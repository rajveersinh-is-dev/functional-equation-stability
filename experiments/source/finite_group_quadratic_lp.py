from __future__ import annotations

import argparse
import json
from dataclasses import dataclass
from itertools import permutations, product

import numpy as np
from scipy.optimize import linprog


@dataclass(frozen=True)
class GroupTable:
    name: str
    multiplication: tuple[tuple[int, ...], ...]
    inverse: tuple[int, ...]
    identity: int

    @property
    def order(self) -> int:
        return len(self.multiplication)


def make_table(
    name: str,
    elements: tuple[object, ...],
    multiply: object,
    inverse: object,
    identity: object,
) -> GroupTable:
    index = {element: i for i, element in enumerate(elements)}
    multiplication = tuple(
        tuple(index[multiply(x, y)] for y in elements) for x in elements
    )
    inverses = tuple(index[inverse(x)] for x in elements)
    return GroupTable(name, multiplication, inverses, index[identity])


def cyclic_group(n: int) -> GroupTable:
    elements = tuple(range(n))
    return make_table(
        f"Z/{n}Z",
        elements,
        lambda x, y: (x + y) % n,
        lambda x: (-x) % n,
        0,
    )


def elementary_abelian_group(rank: int) -> GroupTable:
    elements = tuple(product(range(2), repeat=rank))
    return make_table(
        f"(Z/2Z)^{rank}",
        elements,
        lambda x, y: tuple((a + b) % 2 for a, b in zip(x, y, strict=True)),
        lambda x: x,
        (0,) * rank,
    )


def symmetric_group_3() -> GroupTable:
    elements = tuple(permutations(range(3)))

    def multiply(x: tuple[int, ...], y: tuple[int, ...]) -> tuple[int, ...]:
        return tuple(x[y[i]] for i in range(3))

    def inverse(x: tuple[int, ...]) -> tuple[int, ...]:
        result = [0, 0, 0]
        for i, j in enumerate(x):
            result[j] = i
        return tuple(result)

    return make_table("S3", elements, multiply, inverse, (0, 1, 2))


def dihedral_group_4() -> GroupTable:
    elements = tuple(product(range(4), range(2)))

    def multiply(x: tuple[int, int], y: tuple[int, int]) -> tuple[int, int]:
        k, reflected = x
        rotation, other_reflected = y
        sign = -1 if reflected else 1
        return ((k + sign * rotation) % 4, (reflected + other_reflected) % 2)

    def inverse(x: tuple[int, int]) -> tuple[int, int]:
        rotation, reflected = x
        sign = -1 if reflected else 1
        return ((-sign * rotation) % 4, reflected)

    return make_table("D4", elements, multiply, inverse, (0, 0))


def quaternion_group() -> GroupTable:
    elements = tuple(product((1, -1), range(2), range(2)))

    def multiply(
        x: tuple[int, int, int], y: tuple[int, int, int]
    ) -> tuple[int, int, int]:
        sign, a, b = x
        other_sign, c, d = y
        return (sign * other_sign * (-1 if b and c else 1), a ^ c, b ^ d)

    return make_table("Q8", elements, multiply, lambda x: x, (1, 0, 0))


def power(table: GroupTable, x: int, exponent: int) -> int:
    result = table.identity
    for _ in range(exponent):
        result = table.multiplication[result][x]
    return result


def element_order(table: GroupTable, x: int) -> int:
    result = x
    order = 1
    while result != table.identity:
        result = table.multiplication[result][x]
        order += 1
    return order


def quadratic_defect(
    table: GroupTable, values: list[int], x: int, y: int
) -> int:
    return (
        values[table.multiplication[x][y]]
        + values[table.multiplication[x][table.inverse[y]]]
        - 2 * values[x]
        - 2 * values[y]
    )


def verify_cyclic_identity(table: GroupTable) -> None:
    values = [
        (7 * i * i + 3 * i + 11) % 13 - 6 for i in range(table.order)
    ]
    for x in range(table.order):
        n = element_order(table, x)
        total = sum(
            quadratic_defect(table, values, power(table, x, k + 1), x)
            for k in range(n)
        )
        if total != -2 * n * values[x]:
            raise AssertionError(
                f"Cyclic identity failed for {table.name} at element {x}"
            )


def defect_matrix(table: GroupTable) -> np.ndarray:
    rows = []
    for x in range(table.order):
        for y in range(table.order):
            row = np.zeros(table.order, dtype=float)
            row[table.multiplication[x][y]] += 1.0
            row[table.multiplication[x][table.inverse[y]]] += 1.0
            row[x] -= 2.0
            row[y] -= 2.0
            rows.append(row)
    return np.asarray(rows, dtype=float)


def optimal_constant(table: GroupTable) -> tuple[float, list[float]]:
    matrix = defect_matrix(table)
    constraints = np.vstack((matrix, -matrix))
    bounds = np.ones(2 * table.order * table.order, dtype=float)
    best = -np.inf
    witness: list[float] = []
    for coordinate in range(table.order):
        objective = np.zeros(table.order, dtype=float)
        objective[coordinate] = -1.0
        result = linprog(
            objective,
            A_ub=constraints,
            b_ub=bounds,
            bounds=[(None, None)] * table.order,
            method="highs",
        )
        if not result.success:
            raise RuntimeError(f"Linear program failed for {table.name}: {result.message}")
        value = float(-result.fun)
        if value > best:
            best = value
            witness = [float(v) for v in result.x]
    return best, witness


def constant_sharpness(table: GroupTable) -> tuple[float, float]:
    values = [0.5] * table.order
    value_norm = max(abs(value) for value in values)
    defect_norm = max(
        abs(quadratic_defect(table, values, x, y))
        for x in range(table.order)
        for y in range(table.order)
    )
    return value_norm, defect_norm


def selected_groups(max_cyclic: int) -> list[GroupTable]:
    groups = [cyclic_group(n) for n in range(2, max_cyclic + 1)]
    groups.extend(elementary_abelian_group(rank) for rank in range(1, 5))
    groups.extend(
        [symmetric_group_3(), dihedral_group_4(), quaternion_group()]
    )
    return groups


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument("--max-cyclic", type=int, default=16)
    args = parser.parse_args()
    if args.max_cyclic < 2:
        raise ValueError("--max-cyclic must be at least 2")
    records = []
    for table in selected_groups(args.max_cyclic):
        verify_cyclic_identity(table)
        optimum, witness = optimal_constant(table)
        value_norm, defect_norm = constant_sharpness(table)
        if abs(optimum - 0.5) > 1e-8:
            raise AssertionError(f"Unexpected optimum for {table.name}: {optimum}")
        if abs(value_norm - 0.5) > 1e-12 or abs(defect_norm - 1.0) > 1e-12:
            raise AssertionError(f"Sharpness check failed for {table.name}")
        records.append(
            {
                "group": table.name,
                "order": table.order,
                "cyclic_identity": "verified_exactly",
                "lp_optimum": round(optimum, 10),
                "lp_witness": [round(value, 6) for value in witness],
                "constant_value_norm": value_norm,
                "constant_defect_norm": defect_norm,
            }
        )
    print(json.dumps({"numpy": np.__version__, "groups": records}, indent=2))


if __name__ == "__main__":
    main()
