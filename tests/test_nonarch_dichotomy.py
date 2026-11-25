from __future__ import annotations

from fractions import Fraction

from experiments.source.nonarch_dichotomy import (
    check_residue_identity,
    instability_ratio,
)


def test_residue_characteristic_two_identity() -> None:
    check_residue_identity(64)


def test_defect_ratio_grows_without_bound() -> None:
    ratios = []
    for power in range(1, 9):
        result = instability_ratio(32, power)
        assert result["maximum_defect_norm"] == str(Fraction(1, 2 ** (power + 1)))
        ratios.append(Fraction(str(result["ratio"])))
    assert ratios == [Fraction(2 ** (power + 1)) for power in range(1, 9)]
