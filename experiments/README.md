# Computational experiments

The experiments support counterexample searches and reproducibility. They are not substitutes for the proofs or the Lean formalization.

## 1. Finite-group quadratic stability

**Purpose:** Search for counterexamples to the finite-order quadratic bound and check its cyclic identity.

**Input:** Real-valued functions on finite groups subject to unit quadratic defect.

**Method:** Exact multiplication tables, integer cyclic-identity checks, and SciPy HiGHS linear programs.

**Reproduce:**

```bash
python experiments/source/finite_group_quadratic_lp.py --max-cyclic 16
```

**Actual output:** `results/finite_group_quadratic_lp.json`. The executed run covered cyclic groups of orders 2–16, `(Z/2Z)^r` for ranks 1–4, `S3`, `D4`, and `Q8`. Every optimum was `1/2`.

**Limitation:** This theorem is verified background, not the original flagship; Forti's theorem already implies it. Finite examples do not prove a general theorem, and HiGHS uses floating-point arithmetic with tolerance `1e-8`.

## 2. Ultrametric semigroup Pexider stability

**Purpose:** Check the affine repair construction for the sharp Pexider theorem on `ℕ` and positive integers.

**Input:** Deterministic random rational-vector functions `f,g,h` with the `3`-adic max norm.

**Method:**

1. Compute the finite-horizon Pexider defect bound exactly with `Fraction`.
2. Construct the affine repair prescribed by the theorem.
3. Verify exactness and all three error bounds.
4. Check the ultrametric finite-sum property.
5. Check the explicit sharpness example.

**Reproduce:**

```bash
python experiments/source/semigroup_pexider_ultrametric.py --cases 100 --p 3 --horizon 20
```

**Actual output:** `results/semigroup_pexider_ultrametric.json`. The executed run used 100 cases per domain and horizon 20. All checks passed; the sharpness example had defect norm `1` and repair error norm `1`.

**Limitations:** Finite random cases cannot prove the theorem. The script verifies existence of a repair with error at most the defect bound; the general no-better-constant proof uses the full `p`-adic scaling argument and is given in the manuscript.

## 3. Non-Archimedean constant-one obstruction

**Purpose:** Verify the residue-characteristic-two identity behind a four-function example showing that the constant `1` fails when `|2|<1`, and display the growing norm ratio.

**Input:** `Z/2^N`, the parity function `ρ`, and `δ=2^k`.

**Method:** Exhaustive checks of `ρ(x+y)=ρ(x-y)` and exact rational computation of the 2-adic defect norm.

**Reproduce:**

```bash
python -m experiments.source.nonarch_dichotomy --modulus 64 --max-delta-power 8
```

**Actual output:** `results/nonarch_dichotomy.json`. The maximum defect norm is `2^{-(k+1)}` while the function norm is `1`, so the ratio is `2^{k+1}` and grows without bound.

**Limitation:** The finite checks support the construction but do not replace the general proof. The example refutes constant `1`, not the existence of every finite constant; the corrected general bound is `|2|^{-1}`.

## 4. Lean and test status

- `results/lean_axioms.txt` records the axiom audit.
- `results/python_checks.txt` records the executed lint and test output.
- The test suite reported `33 passed`.

Pinned Python dependencies are declared in `pyproject.toml`.
