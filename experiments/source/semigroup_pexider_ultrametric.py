from __future__ import annotations

import argparse
import json
import random
from fractions import Fraction

type Vector = tuple[Fraction, ...]


def add(a: Vector, b: Vector) -> Vector:
    return tuple(x + y for x, y in zip(a, b, strict=True))


def sub(a: Vector, b: Vector) -> Vector:
    return tuple(x - y for x, y in zip(a, b, strict=True))


def scale(n: int, a: Vector) -> Vector:
    return tuple(n * x for x in a)


def p_adic_valuation(value: Fraction, p: int) -> int | None:
    if value == 0:
        return None
    numerator = abs(value.numerator)
    denominator = value.denominator
    valuation = 0
    while numerator % p == 0:
        numerator //= p
        valuation += 1
    while denominator % p == 0:
        denominator //= p
        valuation -= 1
    return valuation


def p_adic_norm(value: Fraction, p: int) -> Fraction:
    valuation = p_adic_valuation(value, p)
    if valuation is None:
        return Fraction(0)
    return Fraction(p) ** (-valuation)


def vector_norm(value: Vector, p: int) -> Fraction:
    return max((p_adic_norm(entry, p) for entry in value), default=Fraction(0))


def pexider_defect(f: list[Vector], g: list[Vector], h: list[Vector], s: int, t: int) -> Vector:
    return sub(sub(f[s + t], g[s]), h[t])


def affine_repair_zero(
    f: list[Vector], g: list[Vector], h: list[Vector]
) -> tuple[list[Vector], list[Vector], list[Vector]]:
    a = g[0]
    b = h[0]
    u = sub(sub(f[1], a), b)
    horizon = len(f)
    exact_f = [add(add(scale(n, u), a), b) for n in range(horizon)]
    exact_g = [add(scale(n, u), a) for n in range(horizon)]
    exact_h = [add(scale(n, u), b) for n in range(horizon)]
    return exact_f, exact_g, exact_h


def affine_repair_positive(
    f: list[Vector], g: list[Vector], h: list[Vector]
) -> tuple[list[Vector], list[Vector], list[Vector]]:
    a = g[1]
    b = h[1]
    u = sub(sub(f[3], a), b)
    horizon = len(f)
    exact_f = [f[0], f[1]] + [
        add(add(scale(n - 2, u), a), b) for n in range(2, horizon)
    ]
    exact_g = [g[0]] + [
        add(scale(n - 1, u), a) for n in range(1, horizon)
    ]
    exact_h = [h[0]] + [
        add(scale(n - 1, u), b) for n in range(1, horizon)
    ]
    return exact_f, exact_g, exact_h


def random_vector(rng: random.Random, dimension: int) -> Vector:
    return tuple(Fraction(rng.randint(-8, 8), rng.randint(1, 5)) for _ in range(dimension))


def check_zero_case(seed: int, p: int, horizon: int, dimension: int = 2) -> Fraction:
    rng = random.Random(seed)
    f = [random_vector(rng, dimension) for _ in range(horizon + 1)]
    g = [random_vector(rng, dimension) for _ in range(horizon + 1)]
    h = [random_vector(rng, dimension) for _ in range(horizon + 1)]
    epsilon = max(
        vector_norm(pexider_defect(f, g, h, s, t), p)
        for s in range(horizon + 1)
        for t in range(horizon + 1 - s)
    )
    exact_f, exact_g, exact_h = affine_repair_zero(f, g, h)
    for n in range(horizon + 1):
        assert vector_norm(sub(f[n], exact_f[n]), p) <= epsilon
        assert vector_norm(sub(g[n], exact_g[n]), p) <= epsilon
        assert vector_norm(sub(h[n], exact_h[n]), p) <= epsilon
        for s in range(n + 1):
            t = n - s
            assert exact_f[s + t] == add(exact_g[s], exact_h[t])
    return epsilon


def check_positive_case(seed: int, p: int, horizon: int, dimension: int = 2) -> Fraction:
    rng = random.Random(seed)
    f = [random_vector(rng, dimension) for _ in range(horizon + 3)]
    g = [random_vector(rng, dimension) for _ in range(horizon + 3)]
    h = [random_vector(rng, dimension) for _ in range(horizon + 3)]
    epsilon = max(
        vector_norm(pexider_defect(f, g, h, s, t), p)
        for s in range(1, horizon + 1)
        for t in range(1, horizon + 2 - s)
    )
    exact_f, exact_g, exact_h = affine_repair_positive(f, g, h)
    assert exact_f[1] == f[1]
    for n in range(1, horizon + 1):
        assert vector_norm(sub(g[n], exact_g[n]), p) <= epsilon
        assert vector_norm(sub(h[n], exact_h[n]), p) <= epsilon
    for n in range(2, horizon + 1):
        assert vector_norm(sub(f[n], exact_f[n]), p) <= epsilon
    for s in range(1, horizon + 1):
        for t in range(1, horizon + 2 - s):
            assert exact_f[s + t] == add(exact_g[s], exact_h[t])
    return epsilon


def check_ultrametric_sums(seed: int, p: int, cases: int) -> None:
    rng = random.Random(seed)
    for _ in range(cases):
        terms = [random_vector(rng, 2) for _ in range(rng.randint(1, 30))]
        total: Vector = (Fraction(0), Fraction(0))
        for term in terms:
            total = add(total, term)
        assert vector_norm(total, p) <= max(vector_norm(term, p) for term in terms)


def sharpness_example(p: int, horizon: int = 40) -> dict[str, object]:
    zero = (Fraction(0), Fraction(0))
    e = (Fraction(1), Fraction(0))
    f = [zero, zero, zero] + [e for _ in range(3, horizon + 2)]
    g = [zero, zero] + [e for _ in range(2, horizon + 2)]
    h = [zero for _ in range(horizon + 2)]
    epsilon = max(
        vector_norm(pexider_defect(f, g, h, s, t), p)
        for s in range(1, horizon + 1)
        for t in range(1, horizon + 2 - s)
    )
    exact_f, exact_g, exact_h = affine_repair_positive(f, g, h)
    error = max(
        vector_norm(sub(f[n], exact_f[n]), p) for n in range(2, horizon + 1)
    )
    g_error = max(vector_norm(sub(g[n], exact_g[n]), p) for n in range(1, horizon + 1))
    h_error = max(vector_norm(sub(h[n], exact_h[n]), p) for n in range(1, horizon + 1))
    assert epsilon == 1
    assert max(error, g_error, h_error) <= 1
    return {"defect_norm": str(epsilon), "repair_error_norm": str(max(error, g_error, h_error))}


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument("--cases", type=int, default=100)
    parser.add_argument("--p", type=int, default=3)
    parser.add_argument("--horizon", type=int, default=20)
    args = parser.parse_args()
    if args.cases < 1 or args.p < 2 or args.horizon < 4:
        raise ValueError("Require cases >= 1, p >= 2, and horizon >= 4")
    zero_bounds = [check_zero_case(seed, args.p, args.horizon) for seed in range(args.cases)]
    positive_bounds = [
        check_positive_case(seed + 10_000, args.p, args.horizon) for seed in range(args.cases)
    ]
    check_ultrametric_sums(12_345, args.p, args.cases)
    print(
        json.dumps(
            {
                "p": args.p,
                "cases_per_domain": args.cases,
                "horizon": args.horizon,
                "zero_domain_max_defect": str(max(zero_bounds)),
                "positive_domain_max_defect": str(max(positive_bounds)),
                "ultrametric_sum_checks": args.cases,
                "sharpness_example": sharpness_example(args.p),
            },
            indent=2,
        )
    )


if __name__ == "__main__":
    main()
