# Research log

## 2026-11-25 — Programme initialization

### Investigated

- The master directive and current workspace state.
- Available Lean, LaTeX/PDF, Python, and GitHub tooling.

### Established

- There was no pre-existing project to reuse.
- The required mathematical product must take priority over repository construction.
- The available GitHub account matches the requested author name.

### Commissioned investigations

- Additive and quadratic Hyers–Ulam stability, including recent literature.
- Jensen, Pexider, polynomial, and quadratic equations on groups and semigroups.
- Non-Archimedean settings and two-torsion/two-divisibility obstructions.
- Multiplicative, exponential, logarithmic, and mixed equations.
- Parallelogram/norm/orthogonality equations and biadditive maps.

### Failed or abandoned approaches

- None at the mathematical level yet.

### Changes of direction

- None at the mathematical level yet.

### New conjectures

- None recorded; candidates must be checked against primary literature first.

### Counterexamples

- None recorded.

### Candidate C1 — finite-order quadratic stability

A complete proof sketch was obtained for the following candidate statement. If

`‖q(xy) + q(xy⁻¹) - 2q(x) - 2q(y)‖ ≤ ε`

and `x` has finite order, then `‖q(x)‖ ≤ ε/2`.

The proof sums the defect along the cyclic powers of `x`. Expansion and cyclic reindexing give

`∑_{k=0}^{n-1} D(x^(k+1),x) = -2n q(x)`.

The triangle inequality gives `2n‖q(x)‖ ≤ nε`, hence `‖q(x)‖ ≤ ε/2` directly. No commutativity or completeness is used. A general control version replaces `nε` by the sum of the controls along the same cycle.

The constant `1/2` is sharp: `q ≡ (ε/2)u`, with `‖u‖ = 1`, has defect norm `ε`.

Computational checks using linear programs over cyclic groups of orders 2 through 16 and over `S3` and `D4` returned optimum `1/2`. These are counterexample searches, not proofs.

### Failed or refined approaches

- An initial diagonal-defect/supremum improvement was unnecessary. Lean arithmetic checking exposed the factor `2n` in the cyclic identity, yielding the sharp bound in one step. The proof and formalization were simplified.
- An additive finite-group constant-one candidate was derived by cyclic telescoping, but it appears more elementary and is not the current flagship.

### Focused novelty audit and abandonment of C1

The focused audit located Forti (2019), Theorem 1.5: for any group and real-valued `f` with quadratic defect bounded by `H`, there is a quadratic `Q` with `|f-Q|≤H/2`. On a finite cyclic subgroup its defining limit vanishes. Scalarization by Hahn–Banach therefore gives C1 for arbitrary real normed targets, without completeness. Rätz (2003), Theorem 4.2, and Popa–Rus (2026), Theorem 9.1/Remark 9.3, provide additional close results.

C1 is therefore correct but not original. It is retained as verified background and a Lean/reproducibility asset, not as the flagship theorem.

### Vector-valued Forti theorem

A direct Banach-space proof of the square-law analogue of Forti's Theorem 1.5 was obtained. The dyadic differences are bounded by `(ε+‖q(1)‖)4^{-(n+1)}`, and `‖q(1)‖≤ε/2`, giving a homogeneous approximant `Q(x²)=4Q(x)` within `ε/2`. This avoids scalarization. It is retained as a lemma for C8, not as a flagship novelty claim.

### Candidate C8 — dyadically eventually commuting groups

A new proof sketch was obtained. Assume that for every `x,y∈G`, the powers `(xy)^(2^n)` and `x^(2^n)y^(2^n)` eventually agree. Define `q_n(x)=4^(-n)q(x^(2^n))`. The diagonal defect makes `q_n` uniformly Cauchy in a Banach target, with telescoping error at most `ε/2`. For fixed `x,y`, the algebraic condition and the scaled approximate equation then imply that the limit is exactly quadratic.

The condition includes all abelian groups and nilpotent class-two groups whose commutator subgroup has exponent a power of two. It is broader than commutativity and gives a genuine exact quadratic approximation, not merely Forti's homogeneous map. Novelty is under audit.

### Candidate C10 — sharp ultrametric semigroup Pexider stability

A complete proof was obtained for `ℕ` and positive integers. The ultrametric deviation lemma controls `Φ(n)-nΦ(1)` by the Cauchy-defect bound. Normalization reduces Pexider stability to this lemma, and shifting indices handles the positive domain. The constant `1` is sharp over `Q_p` by a `p^k` scaling argument.

An adversarial review corrected several proof details: the normalized Cauchy defect is a three-term ultrametric expression, `F(0)` need not vanish, exact affine components have a common slope, and `f(1)` is genuinely free on positive integers. The corrected theorem is fully formalized in Lean for both domains, including exact-solution structure corollaries. Independent novelty review is pending.

### C11 technical audit warning

An attempted Lean verification of the short cocycle identity `2(c(h+k)-c(h)-c(k))=...` failed, and the even function `f(x)=|x|` gives a numerical counterexample to that identity. The erroneous Lean draft was removed. This does not yet refute the full C11 existence theorem, because the longer defect identity may still control the extension, but the lifting lemma is now a blocking proof obligation pending the expanded audit.

### Candidate C2N — normalized sharp Pexider quadratic constants

The normalized equation has exact pairs `f=g=Q`. A complete proof gives `‖f-Q‖≤ε/2` and `‖g-Q‖≤ε`, with sharp examples `f=x²+1/2`, `g=x²+1` off zero. The central theorem is fully Lean-verified. An initial factor error in the draft (`f=Q/2`) was caught by testing and corrected; the Lean implementation uses the correct statement.

A targeted literature audit is checking whether these exact constants are already known. An independent adversarial review confirmed the factors, the dyadic limit, the exact solution structure, and sharpness. It also clarified that “quadratic” means a solution of the functional equation; a discontinuous additive square is a valid exact solution but not a continuous homogeneous form.

### Flagship selection

C2N was selected after the targeted audit found no published theorem with the exact normalized vector `(ε/2, ε)` or a componentwise stronger vector. Yang's general two-function bounds are `2ε` and `3ε`; Jung–Sahoo's general four-function bounds are much larger. The flagship contribution is therefore a sharp quantitative strengthening of a classical equation, not a claim that the equation itself is new.

### New direction

Four alternatives are now being investigated in parallel:

- C2: two-function Pexider quadratic stability in locally convex cones.
- C5: sharp uniform Jensen stability over `Q_p` at `|2|=1`.
- C4: improved or Pareto-optimal Pexiderized Fréchet constants.
- C3: sharp four-function quadratic stability over general valued fields and dilation factors.

### Remaining obligations

- Select a new flagship only after proof and novelty checks.
- Replace the C1-based manuscript draft before any publication claim.
- Complete at least three substantial research-and-review cycles on the selected direction.
