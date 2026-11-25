# Final research report

## A. Research discovery

### Selected topic

Sharp normalized stability of the two-function Pexider quadratic equation:

`2f((x+y)/2)+2f((x-y)/2)=g(x)+g(y)`.

### Why it was selected

The equation is classical, but the audited literature did not contain the exact sharp normalized constant vector `(ε/2, ε)`. The strongest located general two-function bounds were `2ε` and `3ε` in Yang (2004). The proposed result is therefore a substantive quantitative strengthening rather than a new equation or notation change.

### Candidates rejected or retained as background

- **C1:** finite-order quadratic `ε/2` bound — implied by Forti's Theorem 1.5.
- **C8:** dyadically eventually commuting groups — direct corollary of Forti's Theorems 1.5–1.6.
- **C10:** ultrametric semigroup Pexider constant one — corollary of Schwaiger's sharp Cauchy theorem.
- **C11:** non-Archimedean instability dichotomy — equation already known and the claimed nonexistence of a finite constant was false.
- **C2:** general locally convex cone extension — mathematically valid but judged incremental.
- **C4, C5, C6, C7, C0:** investigated as alternatives with lower feasibility, novelty, or verification value.

Twelve candidates were scored in total.

### Literature investigated

The review covers Ulam, Hyers, Rassias, Jung, Baker–Lawrence–Zorzitto, Forti, Friis–Stetkær, Yang, Cădariu–Radu, Faiziev–Sahoo, Czerwik as reported by Jung–Sahoo, Ciepliński, Moslehian, recent cone and four-function results, Schwaiger, Najati–Cho, and the cosine–sine classification literature. Access limitations are recorded source by source.

### Identified gap

A sharp simultaneous normalized approximation vector for the two-function Pexider quadratic equation, with matching extremizers and no regularity assumptions on the unknown maps.

## B. Original mathematical contribution

### Main theorem

Let `X` be a real normed space, `Y` a real Banach space, and `f,g:X→Y` with `f(0)=g(0)=0`. Assume

`‖2f((x+y)/2)+2f((x-y)/2)-g(x)-g(y)‖≤ε`

for all `x,y∈X`. Then there is a quadratic map `Q:X→Y` such that

`‖f-Q‖∞≤ε/2`, `‖g-Q‖∞≤ε`.

The approximant is unique among quadratic maps at finite uniform distance from `f`.

### Proof location

- `mathematics/complete_proofs.md`
- `paper/manuscript.tex`, Section 4
- `formalization/FunctionalEquationStability/PexiderQuadraticBanach.lean`

### Relationship to existing results

The equation and its Hyers–Ulam stability are classical. Yang's general two-function theorem gives bounds `2ε` and `3ε`; Jung–Sahoo's general four-function bounds are much larger. The present theorem improves both normalized constants and proves they cannot be decreased.

### What is genuinely new

The exact vector `(ε/2, ε)`, its simultaneous sharpness, and the explicit dyadic proof in this normalized setting appear new in the literature searched through 25 November 2026. No priority claim is made for the equation itself.

### Known limitations

- The target must be a complete real normed space for the limit construction.
- The normalization `f(0)=g(0)=0` is essential for the displayed constants.
- “Quadratic” means a solution of the functional equation, not necessarily a continuous homogeneous form.
- External peer review has not occurred.

## C. Verification

### Proof audits

Separate AI-assisted functional-analysis, algebraic, adversarial, and publication passes were completed. An independent adversarial agent confirmed the factors, limit argument, exact solution structure, and sharpness. Factor errors in early drafts were caught and corrected.

### Counterexample investigations

Zero maps, exact quadratic pairs, constant perturbations off zero, boundary arguments, incomplete targets, and the homogeneous-form interpretation were checked. No counterexample to the final theorem was found.

### Lean formalization

Lean 4.36.0 and Mathlib v4.36.0 are pinned. The central theorem, exact normalized structure, both sharpness lower bounds, and uniqueness corollary compile. The axiom audit reports only `propext`, `Classical.choice`, and `Quot.sound`.

### Computational verification

- 33 Python tests pass.
- Ruff lint passes.
- Finite-group linear programs, ultrametric semigroup repairs, residue-characteristic checks, and exact extremizer tests are reproducible.
- Numerical and finite checks are explicitly distinguished from proof.

### Remaining unverified components

External peer review and journal suitability remain unverified. Background directions outside the flagship are not all fully formalized.

## D. Academic output

- **Manuscript title:** Sharp Normalized Stability of the Pexider Quadratic Equation.
- **Abstract:** Included in `paper/manuscript.tex` and `submission/abstract.md`.
- **Extracted word count:** approximately 1,208.
- **Pages:** 5.
- **Theorems:** 2.
- **Corollaries:** 1.
- **Bibliography:** 3 works cited in the final paper; 28 entries in the research BibTeX archive.
- **Compilation:** Tectonic 0.17.0 succeeded; no undefined citation markers.
- **Publication readiness:** Suitable for a specialized functional-equations journal or a short general-mathematics note, subject to external review. Aequationes Mathematicae is the recommended topical fit; BAMS is the concise fee-free alternative.

## E. GitHub

- **Repository:** https://github.com/rajveersinh-is-dev/functional-equation-stability
- **Visibility:** Public.
- **Owner:** `rajveersinh-is-dev`.
- **Main branch:** `main`.
- **Verified code/CI commit:** `69ac1d1956c0bcfdd97290920764db8b4799f919`.
- **Important directories:** `paper/`, `mathematics/`, `formalization/`, `experiments/`, `tests/`, `research/`, `docs/`, `submission/`.
- **CI:** Python, Lean, and LaTeX workflows all passed on the verified code commit.
- **Reproducibility:** See `docs/reproduction.md`.

## F. Honest assessment

### Ratings

- **Mathematical significance: 6/10.** A sharp improvement for a classical equation, but specialized rather than broad foundational work.
- **Originality: 7/10.** The exact constant vector appears new and materially improves prior bounds; external priority review is still absent.
- **Proof completeness: 9/10.** Every step is explicit and the central argument is machine-verified.
- **Literature verification: 8/10.** Strong primary-source comparison with recorded access limits; no search can prove absolute priority.
- **Formal verification: 9/10.** The flagship theorem, structure, sharpness, and uniqueness are fully formalized with standard axioms only.
- **Manuscript quality: 8/10.** Clear, concise, compiled, and honest about scope; external referee judgment may differ.
- **Reproducibility: 9/10.** Pinned environments, actual outputs, tests, and three passing CI workflows.
- **Overall research quality: 8/10.** A correct, sharp, well-documented strengthening with strong verification, but modest scope and no external peer review.

### Outcome classification

**3. Existing theorem substantially strengthened.**

## G. Remaining work

1. **External peer review — high importance.** Required to assess originality, significance, and journal fit.
2. **Journal selection and formatting — moderate.** Choose a venue, recheck current policies, and adapt the manuscript style.
3. **Unnormalized constants — open mathematical question.** Determine sharp bounds when `f(0)` or `g(0)` is nonzero.
4. **Broader targets — open mathematical question.** Investigate incomplete targets, non-Archimedean targets, and cone-valued formulations.
5. **Actual submission — requires human authorization.** No submission has been made.

## Strongest achievement

The project establishes and fully verifies the sharp normalized Pexider quadratic stability vector `(ε/2, ε)`, improves the strongest located general bounds, and provides matching extremizers, a uniqueness corollary, a compiled manuscript, and a public reproducible research repository.
