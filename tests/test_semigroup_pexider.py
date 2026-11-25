from __future__ import annotations

from fractions import Fraction

from experiments.source.semigroup_pexider_ultrametric import (
    affine_repair_positive,
    check_positive_case,
    check_ultrametric_sums,
    check_zero_case,
    p_adic_norm,
    sharpness_example,
)


def test_p_adic_norm_examples() -> None:
    assert p_adic_norm(Fraction(0), 3) == 0
    assert p_adic_norm(Fraction(1), 3) == 1
    assert p_adic_norm(Fraction(1, 3), 3) == 3
    assert p_adic_norm(Fraction(8, 3), 3) == 3
    assert p_adic_norm(Fraction(9, 8), 3) == Fraction(1, 9)
    assert p_adic_norm(Fraction(5), 3) == 1


def test_zero_domain_affine_repairs() -> None:
    for seed in range(20):
        check_zero_case(seed, 3, 12)


def test_positive_domain_affine_repairs() -> None:
    for seed in range(20):
        check_positive_case(seed, 3, 12)


def test_positive_f_one_is_free() -> None:
    zero = (Fraction(0), Fraction(0))
    one = (Fraction(1), Fraction(0))
    f = [zero, one, zero, one]
    g = [zero, zero, one, one]
    h = [zero, zero, zero, zero]
    exact_f, _, _ = affine_repair_positive(f, g, h)
    assert exact_f[1] == f[1]


def test_ultrametric_sum_bound() -> None:
    check_ultrametric_sums(99, 3, 200)


def test_sharpness_example() -> None:
    result = sharpness_example(3, 60)
    assert result["defect_norm"] == "1"
    assert result["repair_error_norm"] == "1"
