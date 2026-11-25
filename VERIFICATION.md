# Verification manifest

**Date:** 2026-11-25.

This manifest records executed checks, not intended checks.

## Flagship theorem C2N

| Requirement | Evidence | Status |
|---|---|---|
| Precise normalized theorem | `mathematics/main_theorems.md`; `PexiderQuadraticBanach.lean` | Complete |
| Complete proof | `mathematics/complete_proofs.md`; manuscript Section 4 | Complete |
| Sharpness of `ε/2` | `PexiderQuadraticSharpness.lean:f_sharpness`; Python extremizer tests | Complete |
| Sharpness of `ε` | `PexiderQuadraticSharpness.lean:g_sharpness`; Python extremizer tests | Complete |
| Lean build | `lake build` | Passed |
| Axiom audit | `tests/AxiomAudit.lean`; `experiments/results/lean_axioms.txt` | Standard axioms only |
| Python tests | `python -m pytest -q` | 33 passed |
| Python lint | `python -m ruff check experiments/source tests` | Passed |
| LaTeX compilation | `tectonic paper/manuscript.tex --outdir paper` | Passed |
| PDF citation check | `pdftotext` inspection | No undefined markers |
| Independent adversarial review | `research/reviewer_reports/cycle3_*` and separate agent review | No blocking mathematical finding |
| Exact-constant novelty | Targeted literature audit | Cleared: appears to improve Yang's `2ε, 3ε` bounds |
| Exact normalized solution structure | `exact_pexiderQuadratic_normalized_eq` and `_quadratic` | Complete |
| Uniqueness corollary | `quadratic_unique_of_bounded`; manuscript corollary | Complete |

## Background formalizations

- Finite-order quadratic stability: compiled; known from Forti and not claimed original.
- Dyadically eventually commuting quadratic stability: compiled; direct corollary of Forti and not claimed original.
- Ultrametric semigroup Pexider stability: compiled; corollary of Schwaiger and not claimed original.
- Cosine–sine branch identity and `√δ` bound: compiled; secondary quantitative corollary.

## Computational outputs

- `experiments/results/finite_group_quadratic_lp.json`
- `experiments/results/semigroup_pexider_ultrametric.json`
- `experiments/results/nonarch_dichotomy.json`
- `experiments/results/python_checks.txt`
- `experiments/results/lean_axioms.txt`

## Publication checks

- [x] Final flagship novelty cleared against the audited literature.
- [x] Final manuscript selected and renamed to `paper/manuscript.tex`.
- [x] Journal shortlist and submission package completed.
- [x] Local Git history reviewed.
- [x] Public repository created and remote commit/tree verified.
- [x] GitHub Actions results verified for code commit `69ac1d1`.
