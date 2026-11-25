# Conjecture ledger

## C2N — Normalized sharp Pexider quadratic constants

**Status:** Established as the flagship; proof, sharpness, and central Lean formalization complete. The exact constant vector appears new relative to the audited literature.

For `f(0)=g(0)=0` and midpoint Pexider defect at most `ε`, there is a quadratic `Q` with `‖f-Q‖∞≤ε/2` and `‖g-Q‖∞≤ε`. The pair `f=x²+1/2`, `g=x²+1` off zero attains both bounds.

The exact normalized solution structure is `f=g=Q`. “Quadratic” means a solution of the functional equation, not necessarily a continuous homogeneous form.

## C11 — Non-Archimedean four-function quadratic dichotomy

**Status:** Existence and instability proofs obtained; adversarial review passed after corrections; novelty audit running.

Let `K` be a complete non-Archimedean normed field with `char K≠2`, `E` a complete non-Archimedean normed `K`-space, and `S` a `K`-space. For `F,G,L,M:S→E` with uniform defect `ε`:

- If `|2|=1`, there exist quadratic `Q` and additive `A,B` approximating the exact Pexider components within `ε`. The constant `1` is sharp. Approximate uniqueness is false and is not claimed.
- If `|2|<1`, there are settings, including `S=E=K`, with arbitrarily small defect but no exact approximation within any fixed finite multiple of the defect.

The instability construction uses a nonzero `F₂`-linear functional on the residue field and a `0/1` function `ρ`. The adversarial review corrected the even/odd decomposition, the cocycle factor, and the uniqueness statement; the existence bound and counterexample remain valid.

## C10 — Sharp Pexider stability on ultrametric semigroups

**Status:** Proof complete and fully Lean-verified, but rejected as an original flagship because it is an immediate corollary of Schwaiger's sharp Cauchy theorem.

For maps on `ℕ` or positive `ℕ` into an ultrametric normed additive group, a uniform Pexider defect bound `ε` yields an exact affine triple with simultaneous error at most `ε`. The common slope and the free value `f(1)` on positive integers are essential. Over `Q_p`, the constant `1` is sharp.

The proof uses the ultrametric deviation lemma: a Cauchy-defect-bounded `Φ` with bounded `Φ(0)` satisfies `‖Φ(n)-nΦ(1)‖≤ε`. Normalization reduces the Pexider equation to this lemma. The positive-domain result follows by shifting indices.

Lean formalizes both domain theorems and all construction/error steps. No `sorry`, custom axiom, or completeness assumption is used.

## C9 — Vector-valued square-law analogue of Forti's theorem

**Status:** Established by a direct proof; retained as a lemma, not a flagship novelty claim.

For any group `G`, real Banach space `X`, and quadratic defect bound `ε`, the dyadic sequence `4^(-n)q(x^(2^n))` converges uniformly to `Q` with `Q(x²)=4Q(x)` and `‖q-Q‖∞≤ε/2`. The proof uses `‖q(1)‖≤ε/2` and a geometric telescoping estimate. Sharpness for the square-law class is shown by `q(1)=ε/2` and `q(g)=0` for `g≠1`.

## C8 — Quadratic stability on dyadically eventually commuting groups

**Status:** Proposed; complete proof sketch obtained, novelty audit in progress.

**Algebraic condition.** For every `x,y∈G`, there is `N=N(x,y)` such that for all `n≥N`,

`(xy)^(2^n)=x^(2^n)y^(2^n)`.

Abelian groups satisfy the condition with `N=0`. Nilpotent class-two groups whose commutator subgroup has exponent `2^r` satisfy it with `N=r+1`, by the class-two power formula.

**Theorem.** Let `X` be a real Banach space and suppose `q:G→X` has quadratic defect bounded by `ε`. Then there is an exact quadratic map `Q:G→X` with `‖q-Q‖∞≤ε/2`.

**Proof sketch.**

1. Set `q_n(x)=4^(-n)q(x^(2^n))`.
2. The diagonal defect gives `q_(n+1)(x)-q_n(x)=4^(-(n+1))(D_q(x^(2^n),x^(2^n))-q(1))`.
3. Since `D_q(1,1)=-2q(1)`, `‖q(1)‖≤ε/2`, so successive differences are uniformly bounded by `(3ε/2)4^(-(n+1))`.
4. Completeness gives a uniform limit `Q`, and telescoping gives `‖q-Q‖∞≤ε/2`.
5. For fixed `x,y`, choose `n` large enough for the algebraic condition, applied also to `y⁻¹`. Scaling the approximate equation at `x^(2^n),y^(2^n)` by `4^(-n)` and taking limits proves `D_Q=0`.
6. The constant map `q≡(ε/2)u` shows sharpness.

**Counterexample search.** The proof uses no commutativity beyond the explicit algebraic condition. Infinite-order and noncommutative cases are covered. No counterexample has been found.

**Next obligations.** Compare the pair-dependent dyadic condition and unnormalized sharp bound with Faiziev–Sahoo and related `n`-Abelian literature; complete an independent adversarial pass. The central theorem is already fully Lean-verified.

**Scope strengthening.** Fixed `n`-Abelian stability requires one exponent for every pair. The present condition allows pair-dependent exponents and includes class-two groups with unbounded two-power commutator orders, a strictly broader class.

## C1 — Finite-order bound for approximate quadratic maps

**Status:** Known from existing literature; proof complete and Lean-verified, but rejected as an original flagship.

**Formal statement.** Let `G` be a group, `X` a real normed space, `q : G → X`, and `ε ≥ 0`. Assume

`‖q(xy) + q(xy⁻¹) - 2q(x) - 2q(y)‖ ≤ ε`

for all `x,y ∈ G`. If `x ∈ G` has finite order, then

`‖q(x)‖ ≤ ε/2`.

In particular, on a periodic group, the zero map is an exact quadratic solution within `ε/2` of `q` in the uniform norm.

**Supporting evidence.**

- The cyclic-power telescoping identity is
  `∑_{k=0}^{n-1} D(x^(k+1),x) = -2n q(x)`.
  The triangle inequality gives `2n‖q(x)‖ ≤ nε`, hence `‖q(x)‖ ≤ ε/2` directly.
- More generally, if `‖D(u,v)‖ ≤ φ(u,v)`, the proof gives
  `‖q(x)‖ ≤ (∑_{k=0}^{n-1} φ(x^(k+1),x))/(2n)`.
- Linear programs over `Z/nZ` for `2 ≤ n ≤ 16`, `S3`, and `D4` returned optimum `1/2`.
- The constant map `q ≡ (ε/2)u`, where `‖u‖ = 1`, has defect norm exactly `ε`; hence the constant is sharp whenever `ε > 0`.

**Counterexample search.**

- Zero, identity, constant maps, finite cyclic groups of both parities, and small nonabelian groups have been checked.
- No counterexample has been found.
- The proof does not use commutativity or completeness; these are unnecessary assumptions.

**Literature status.**

- Forti (2019), Theorem 1.5, already gives the real-valued `H/2` bound on arbitrary groups. Hahn–Banach scalarization extends it to the stated normed target.
- Rätz (2003), Theorem 4.2, and Popa–Rus (2026), Theorem 9.1/Remark 9.3, are additional close results.
- The statement is therefore classified as known, not original.

**Attempted disproof.**

- An independent adversarial pass found no counterexample and confirmed noncommutativity, order-one elements, `ε=0`, and sharpness.
- Lean arithmetic checking exposed that the initial two-step proof was unnecessarily complicated: the coefficient `2n` in the cyclic identity already gives the final `ε/2` bound. The proof and formalization were simplified accordingly.
- No hidden use of a Banach-space completion was found.

**Next obligations.**

1. Verify whether this finite-order/torsion stability bound already exists.
2. Add a reproducible counterexample-search script and preserve its actual output.
3. Have separate reviewers attack the algebra, analysis, presentation, and novelty claim.
4. Complete at least three substantial research-and-review cycles.

**Lean status:** The definitions, cyclic identity, general control bound, uniform sharp bound, periodic-group uniqueness, and constant sharpness example compile. The axiom audit reports only `propext`, `Classical.choice`, and `Quot.sound`; there is no `sorryAx` or custom axiom.
