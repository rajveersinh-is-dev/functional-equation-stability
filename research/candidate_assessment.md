# Candidate problem assessment

Scores use the required weights: importance 20%, novelty potential 25%, probability of a rigorous result 20%, theorem significance 20%, research and portfolio value 10%, and independent verification feasibility 5%. A novelty score measures potential, not established priority.

## C1 — Sharp finite-order stability for approximate quadratic maps

**Final score: 5.65/10; rejected as non-novel.**

- **Importance (6/10):** It connects quadratic stability with torsion, a structurally meaningful obstruction.
- **Novelty (1/10):** Forti's Theorem 1.5 already gives the real-valued `H/2` bound on arbitrary groups; scalarization gives the normed-target version. Rätz and Popa–Rus provide additional close results.
- **Probability (9/10):** A complete direct proof and Lean formalization were obtained.
- **Significance (6/10):** The result is sharp and elegant, but its mathematical content is already known.
- **Portfolio (7/10):** Useful as a background note and reproducibility asset.
- **Verification (10/10):** Direct reconstruction, adversarial review, Lean compilation, axiom audit, and finite-group tests all succeeded.

## C2 — Pexider quadratic stability in locally convex cones

**Provisional score: 7.30/10.**

- **Importance (6/10):** A genuine two-function extension connects Pexider and quadratic stability in a non-vector target setting.
- **Novelty (8/10):** Verified 2025 sources treat Pexider additive equations and single-function quadratic cone equations separately; no combined theorem was located. An independent audit is running.
- **Probability (9/10):** A complete proof with explicit constants has been obtained. The general estimates are `λ+2/3` for `f` and `2λ+7/6` for `g`; normalized estimates are `1/2` and `1`.
- **Significance (7/10):** The normalized real specialization has sharp constants `1/2` and `1`, with explicit extremizers. The general cone result is broader, although its constants are not claimed optimal.
- **Portfolio (7/10):** Publication relevance is good; full cone formalization in Lean is likely impractical.
- **Verification (4/10):** A normalized real Banach specialization may be formalizable; the general cone framework is the main verification limitation.

## C3 — General non-Archimedean dilation for a four-function quadratic equation

**Score: 6.15/10.**

- **Importance (6/10):** It addresses a critical non-Archimedean regime and could replace a special `p`-adic theorem by a general valued-field result.
- **Novelty (6/10):** No general-field version was located, but replacing `p` by a dilation factor may be viewed as a direct generalization unless the sharp constant is genuinely new.
- **Probability (8/10):** Existing fixed-point proofs suggest a viable route.
- **Significance (5/10):** The main difficulty is quantitative rather than conceptual.
- **Portfolio (6/10):** Useful specialization, with moderate formalization cost.
- **Verification (5/10):** Symbolic checks are possible, but the full valued-field formalization is substantial.

## C4 — Pareto-optimal constants for the Pexiderized Fréchet equation

**Score: 6.20/10.**

- **Importance (6/10):** Sharp multi-function constants clarify the quantitative structure of a standard higher-order stability problem.
- **Novelty (7/10):** Published bounds `6ε, 9ε, 9ε, 9ε` were located; no later Pareto optimization was found.
- **Probability (5/10):** Gauge freedom and coupled constants make the optimization nontrivial.
- **Significance (6/10):** A complete optimal vector would be substantive; improving only one coordinate would be narrower.
- **Portfolio (7/10):** Strong computational and expository value.
- **Verification (7/10):** Finite-dimensional linear programming can support, but not replace, the proof.

## C5 — Sharp uniform Jensen stability over `Q_p` at `abs(2)=1`

**Score: 7.05/10.**

- **Importance (7/10):** It targets a critical non-Archimedean regime where standard contraction-based results fail.
- **Novelty (7/10, provisional):** No sharp uniform constant was located in the audited sources.
- **Probability (7/10):** The Jensen defect controls the Cauchy defect, and additive stability gives existence; sharpness needs a careful classification of bounded additive maps.
- **Significance (7/10):** A sharp endpoint theorem would be broader in field-theoretic interest than C1.
- **Portfolio (8/10):** Strong fit for a stability journal and non-Archimedean analysis.
- **Verification (6/10):** Proof auditing is feasible, but full Lean formalization of `Q_p` is harder than C1.

## C6 — Quantitative non-involutive Jensen stability

**Score: 5.10/10.**

- **Importance (5/10):** A workable subclass of Jensen-type equations, but the proposed form is specialized.
- **Novelty (6/10):** Closest results use involutions and negative-power controls.
- **Probability (4/10):** Degeneration at `s=1`, two-torsion, and higher-order terms create serious obstacles.
- **Significance (5/10):** Even a positive result would likely require narrow parameter restrictions.
- **Portfolio (6/10):** Moderate value.
- **Verification (4/10):** Counterexample-driven analysis would dominate the work.

## C7 — Full polynomial stability over non-Archimedean fields

**Score: 6.40/10.**

- **Importance (7/10):** A full degree-`n` classification would extend beyond the known quadratic-additive scope.
- **Novelty (7/10):** The audited monomial and operator results do not appear to give the full conclusion.
- **Probability (4/10):** Factorial vanishing, mixed-degree terms, and completeness make the general case difficult.
- **Significance (7/10):** High if achieved.
- **Portfolio (8/10):** Strong potential impact.
- **Verification (5/10):** Formalization and sharpness analysis would be extensive.

## C0 — Finite-group additive constant one

**Score: 4.00/10; rejected.**

The sharp constant is elementary and already contained in substance in amenable-group stability (Forti 2019, Theorem 2.4). It is not a defensible flagship novelty claim.

## C2N — Normalized sharp Pexider quadratic constants

**Final score: 7.85/10; selected flagship.**

- **Importance (7/10):** Sharp simultaneous constants clarify the quantitative structure of a classical Pexider equation.
- **Novelty (8/10):** The equation is known, but the exact normalized vector `(ε/2, ε)` appears new and substantially improves Yang's `(2ε, 3ε)` bounds.
- **Probability (9/10):** Complete proof, Lean formalization, and sharpness tests are available.
- **Significance (7/10):** Both constants are attained, not merely sufficient.
- **Portfolio (8/10):** A concise paper with strong reproducibility.
- **Verification (9/10):** The central theorem is fully Lean-verified; a separate sharpness formalization is in progress.

## Current selection status

C1, C8, C10, and C11 were rejected as original flagship results after literature audits. C2N is selected: its exact sharp constants appear new and improve the strongest located general bounds. The cosine–sine `√δ` corollary is retained as a secondary result.
