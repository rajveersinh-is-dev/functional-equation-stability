# Novelty audit

## C1 — Finite-order quadratic stability: rejected as an original flagship

**Audit date:** 25 November 2026.

**Candidate statement.** A uniform quadratic defect bound `ε` implies `‖q(x)‖≤ε/2` on finite-order elements, with sharp constant `1/2` on periodic groups.

**Mathematical status:** Correct, Lean-verified, and sharp.

**Novelty status:** Not original. The focused audit found that the statement is implied by known results.

### Closest verified results

1. **G. L. Forti (2019), Theorem 1.5**, *Stability of Functional Equations and Properties of Groups*, Annales Mathematicae Silesianae 33, 77–96, DOI [10.2478/amsil-2019-0004](https://doi.org/10.2478/amsil-2019-0004). For any group and real-valued `f` with quadratic defect bounded by `H`, Forti constructs a quadratic `Q` satisfying `|f-Q|≤H/2`. On a finite cyclic subgroup the defining limit vanishes, yielding the finite-order bound.
2. **J. Rätz (2003), Theorem 4.2**, *On inequalities associated with the Jordan–von Neumann functional equation*, Aequationes Mathematicae 66, 191–200, DOI [10.1007/s00010-003-2684-8](https://doi.org/10.1007/s00010-003-2684-8). The finite-order and torsion-group vanishing conclusions are explicit for inner-product targets.
3. **D. Popa and M. D. Rus (2026), Theorem 9.1 and Remark 9.3**, [arXiv:2611.26471v2](https://arxiv.org/html/2611.26471v2). For abelian groups and real Banach targets, the `ε/2` bound is stated and identified as optimal.

### Why the normed-space extension does not restore novelty

Apply Forti's scalar theorem to `ℓ∘q` for each continuous linear functional `ℓ`. The finite-order bound passes to `X` by Hahn–Banach scalarization, without completeness. The constant sharpness example is also standard once the `1/2` bound is known.

### Decision

C1 is retained only as verified background and as a reproducibility/formalization asset. It is not the original theorem required by the research objective. The manuscript draft based on C1 must not be presented as an original research contribution.

## C2 — Pexider quadratic cone stability: weak/incremental novelty

An independent audit found no exact cone formulation, but the transformed equation

`g(u+w)+g(u-w) ∈ v(2f(u)+2f(w))v`

is a classical partially Pexiderized quadratic equation. Czerwik (1994) and Jung–Sahoo (2001, Theorem 3) already study its stability, and the cone extension is a short neighborhood-arithmetic corollary of Bae–Mohammadpour–Najati (2025). The normalized sharp constants `1/2` and `1` may still provide a useful quantitative contribution, but this needs a direct comparison with Yang's improved Pexider bounds before any originality claim.

**Decision:** C2 is a reserve candidate, not the current flagship.

## C10 — Sharp semigroup Pexider stability: rejected as a flagship novelty

The exact `ℕ/ℕ₀` statement was not located verbatim, but the constant-one conclusion is an immediate corollary of Schwaiger's sharp Cauchy theorem on uniquely `p`-divisible semigroups. The discrete case uses the elementary ultrametric deviation lemma. Najati–Cho (2011) also give simultaneous `ε` bounds in a normalized non-Archimedean vector-space setting.

**Decision:** Retain as a fully formalized background theorem and reproducibility asset, not as the original flagship.

## C11 — Non-Archimedean dichotomy: rejected

The four-function equation and positive stability are already in Tongsomporn–Aksornthong (2025). The constant-one upper bound when `|2|=1` is implicit in their proof. The proposed instability when `|2|<1` is false: even/odd decomposition gives the finite constant `|2|^{-1}`. The residue construction can show that constant `1` fails, but not that every finite constant fails.

**Decision:** Retain only as a corrected literature observation and computational check; not an original flagship.

## C8 — Dyadically eventually commuting groups: rejected as an original flagship

Forti's Theorems 1.5–1.6 already provide the dyadic homogeneous approximant and the exact cross-defect criterion. C8 makes that criterion vanish eventually and is therefore a direct corollary. The unbounded pair-dependent commutator example is illustrative added value, not a new stability principle.

**Decision:** Retain as a fully formalized unification/background result.

## C2N — Normalized sharp Pexider quadratic constants: selected flagship

**Verdict:** The equation is classical, but the exact normalized constant vector `(ε/2, ε)` appears new and is componentwise sharp.

The closest strong general result located is Yang (2004), which gives `3ε` for one function and `2ε` for the other in the corresponding two-function equation. Jung–Sahoo (2001, Theorem 3) gives much larger four-function bounds and does not yield the pure normalized quadratic conclusion. Searches through 25 November 2026 found no later theorem giving the present vector or a componentwise stronger one.

**Mathematical contribution:** A substantial quantitative strengthening of classical Pexider-quadratic stability, with a complete proof, matching extremizers, and full Lean formalization of the central theorem and sharpness lower bounds.

**Caution:** No priority claim is made for the equation itself, and “appears new” is not a substitute for external peer review.

## Final selection

C2N is the flagship. C1, C8, C10, and C11 are retained only as verified background or rejected directions. The cosine–sine `√δ` result is a secondary corollary, not the principal contribution.
