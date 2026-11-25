# Project status

Last updated: 2026-11-25 (UTC)

## Current phase

Final audit and report complete; documentation commit and remote recheck remain.

## Flagship result

**Selected:** C2N — normalized sharp Pexider quadratic stability.

For `f(0)=g(0)=0` and uniform midpoint Pexider defect at most `ε`, there is a quadratic `Q` with

`‖f-Q‖∞≤ε/2`, `‖g-Q‖∞≤ε`.

Both constants are sharp, and the approximant is unique among quadratic maps at finite uniform distance from `f`.

The closest strong general result located is Yang (2004), with bounds `2ε` and `3ε`. The exact sharp vector appears new in the audited literature.

## Completed

- Serious literature review, source-verification ledger, and 12-candidate weighted matrix.
- More than three substantial research-and-review cycles.
- Complete proof and adversarial review of the flagship theorem.
- Full Lean formalization of the central theorem, exact solution structure, sharpness lower bounds, and uniqueness corollary.
- Lean build and standard-axiom audit.
- 33 passing Python tests and clean lint.
- Final LaTeX manuscript compiled to `paper/manuscript.pdf`.
- Submission package and current journal shortlist prepared.
- Local Git repository initialized on `main`.

## Rejected or background directions

- C1 finite-order quadratic bound: known from Forti.
- C8 dyadically eventually commuting groups: direct corollary of Forti.
- C10 ultrametric semigroup Pexider constant: corollary of Schwaiger.
- C11 non-Archimedean dichotomy: equation known and claimed instability false.
- General cone Pexider extension: incremental; retained as background.

## Published and verified

- Public repository: https://github.com/rajveersinh-is-dev/functional-equation-stability
- Branch: `main`.
- Verified code/CI commit: `69ac1d1956c0bcfdd97290920764db8b4799f919`.
- Local and remote commit/tree identifiers matched.
- Python, Lean, and LaTeX GitHub Actions all passed on the verified code commit.
- No credentials or personal contact details were found in the published files.

## Final artifacts

- `COMPLETION_AUDIT.md`: requirement-by-requirement evidence checklist.
- `FINAL_REPORT.md`: research, proof, verification, academic, GitHub, ratings, and remaining-work report.
- `submission/`: journal shortlist and submission package; no submission made.
