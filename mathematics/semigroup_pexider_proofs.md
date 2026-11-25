# Complete proofs for the semigroup Pexider theorems

## 1. Ultrametric deviation lemma

Let `Φ:ℕ→X` satisfy

`‖Φ(s+t)-Φ(s)-Φ(t)‖≤ε`

and `‖Φ(0)‖≤ε`. Then, for every `n`,

`‖Φ(n)-nΦ(1)‖≤ε`.

**Proof.** Induct on `n`. At zero this is the assumed bound. For the successor,

`Φ(n+1)-(n+1)Φ(1) = (Φ(n+1)-Φ(n)-Φ(1)) + (Φ(n)-nΦ(1))`.

Both terms have norm at most `ε`, so their sum does as well by the ultrametric inequality.

More generally, a finite sum whose summands all have norm at most `ε` has norm at most `ε`; this follows by induction using the same inequality.

## 2. Normalization on `ℕ`

Put `a=g(0)`, `b=h(0)` and define

`F₀(n)=f(n)-a-b`, `G₀(n)=g(n)-a`, `H₀(n)=h(n)-b`.

Then

`F₀(s+t)-G₀(s)-H₀(t)=R(s,t)`.

Consequently,

`F₀(s)-G₀(s)=R(s,0)`, `F₀(t)-H₀(t)=R(0,t)`,

and

`F₀(s+t)-F₀(s)-F₀(t)=R(s,t)-R(s,0)-R(0,t)`.

The ultrametric inequality gives a Cauchy defect bound `ε` for `F₀`. Also `‖F₀(0)‖≤ε`.

Set `u=F₀(1)`. The deviation lemma gives

`‖F₀(n)-nu‖≤ε`.

Define

`F(n)=nu+a+b`, `G(n)=nu+a`, `H(n)=nu+b`.

The triple is exact because `G(s)+H(t)=(s+t)u+a+b=F(s+t)`. The three errors are

`f(n)-F(n)=F₀(n)-nu`,

`g(n)-G(n)=F₀(n)-nu-R(n,0)`,

`h(n)-H(n)=F₀(n)-nu-R(0,n)`,

and all have norm at most `ε`.

## 3. Positive integers

Define shifted maps

`fS(n)=f(n+2)`, `gS(n)=g(n+1)`, `hS(n)=h(n+1)`.

Their defect is `R(s+1,t+1)`, so Theorem C10a applies. If its affine parameters are `u,α,β`, pull back to obtain

`G(n)=α+(n-1)u`, `H(n)=β+(n-1)u` for `n≥1`,

`F(n)=α+β+(n-2)u` for `n≥2`.

For `s,t≥1`,

`G(s)+H(t)=α+β+(s+t-2)u=F(s+t)`.

Choose `F(1)=f(1)`. The errors are exactly the shifted errors from Theorem C10a.

## 4. Sharpness

Take `p` odd, `e=1`, and the functions in Theorem C10c. The only nonzero residual occurs for `s=1,t≥2`, where it equals `e`; hence the defect norm is at most `1`.

Suppose an exact triple had all errors `<1`. Exactness forces the `g` component to have the form

`G(n)=α+(n-1)u`.

The error at `n=1` gives `‖α‖<1`. For every `n≥2`, the error at `n` gives

`‖α+(n-1)u-e‖<1`.

Choose `n=1+p^k`. The ultrametric inequality then gives

`‖p^k u-e‖<1`.

Since `|p^k|_p=p^{-k}`, choose `k` so large that `‖p^k u‖_p<1`. Consequently

`‖e‖_p ≤ max(‖p^k u-e‖_p,‖p^k u‖_p)<1`,

contradicting `‖e‖_p=1`.

Thus no constant below `1` works. This argument uses the full sequence of indices and does not incorrectly treat an open `p`-adic unit ball as a singleton.

## 5. Lean verification scope

The ultrametric deviation lemma, normalization, affine construction, and both domain theorems are formalized in Lean 4 without completeness assumptions. The `Q_p` sharpness example is proved in the manuscript but is not part of the current Lean development.
