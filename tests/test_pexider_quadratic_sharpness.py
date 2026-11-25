from __future__ import annotations

from fractions import Fraction


def f(value: Fraction) -> Fraction:
    return Fraction(0) if value == 0 else value * value + Fraction(1, 2)


def g(value: Fraction) -> Fraction:
    return Fraction(0) if value == 0 else value * value + 1


def q(value: Fraction) -> Fraction:
    return value * value


def test_normalized_pexider_defect_bound() -> None:
    for x in range(-12, 13):
        for y in range(-12, 13):
            defect = (
                2 * f(Fraction(x + y, 2))
                + 2 * f(Fraction(x - y, 2))
                - g(Fraction(x))
                - g(Fraction(y))
            )
            assert abs(defect) <= 1


def test_sharp_distances_on_nonzero_integers() -> None:
    for value in list(range(-20, 0)) + list(range(1, 21)):
        point = Fraction(value)
        assert abs(f(point) - q(point)) == Fraction(1, 2)
        assert abs(g(point) - q(point)) == 1
