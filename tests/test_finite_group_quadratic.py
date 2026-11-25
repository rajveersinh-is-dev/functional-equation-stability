from __future__ import annotations

import math

import pytest

from experiments.source.finite_group_quadratic_lp import (
    constant_sharpness,
    cyclic_group,
    dihedral_group_4,
    optimal_constant,
    quaternion_group,
    selected_groups,
    symmetric_group_3,
    verify_cyclic_identity,
)


@pytest.mark.parametrize("n", range(2, 17))
def test_cyclic_group_identity_and_optimum(n: int) -> None:
    table = cyclic_group(n)
    verify_cyclic_identity(table)
    optimum, _ = optimal_constant(table)
    assert math.isclose(optimum, 0.5, abs_tol=1e-8)


@pytest.mark.parametrize(
    "table",
    [symmetric_group_3(), dihedral_group_4(), quaternion_group()],
    ids=["S3", "D4", "Q8"],
)
def test_nonabelian_group_identity_and_optimum(table: object) -> None:
    verify_cyclic_identity(table)
    optimum, _ = optimal_constant(table)
    assert math.isclose(optimum, 0.5, abs_tol=1e-8)


def test_all_selected_groups_have_sharp_constant_example() -> None:
    for table in selected_groups(8):
        value_norm, defect_norm = constant_sharpness(table)
        assert value_norm == 0.5
        assert defect_norm == 1.0
