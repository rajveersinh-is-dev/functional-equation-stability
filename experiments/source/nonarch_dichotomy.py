from __future__ import annotations

import argparse
import json
from fractions import Fraction

from experiments.source.semigroup_pexider_ultrametric import p_adic_norm


def rho(value: int) -> int:
    return value % 2


def defect(value: Fraction, x: int, y: int, modulus: int) -> Fraction:
    return value * (rho((x + y) % modulus) - rho(x) - rho(y))


def check_residue_identity(modulus: int) -> None:
    for x in range(modulus):
        for y in range(modulus):
            assert rho((x + y) % modulus) == rho((x - y) % modulus)


def instability_ratio(modulus: int, delta_power: int) -> dict[str, object]:
    delta = Fraction(2**delta_power)
    maximum = max(
        p_adic_norm(defect(delta, x, y, modulus), 2)
        for x in range(modulus)
        for y in range(modulus)
    )
    function_norm = Fraction(1)
    assert maximum == p_adic_norm(2 * delta, 2)
    return {
        "modulus": modulus,
        "delta": str(delta),
        "maximum_defect_norm": str(maximum),
        "function_norm": str(function_norm),
        "ratio": str(function_norm / maximum),
    }


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument("--modulus", type=int, default=64)
    parser.add_argument("--max-delta-power", type=int, default=8)
    args = parser.parse_args()
    if args.modulus < 4 or args.modulus & (args.modulus - 1):
        raise ValueError("--modulus must be a power of two at least 4")
    if args.max_delta_power < 1:
        raise ValueError("--max-delta-power must be positive")
    check_residue_identity(args.modulus)
    records = [
        instability_ratio(args.modulus, power)
        for power in range(1, args.max_delta_power + 1)
    ]
    print(json.dumps({"p": 2, "residue_identity": "verified", "records": records}, indent=2))


if __name__ == "__main__":
    main()
