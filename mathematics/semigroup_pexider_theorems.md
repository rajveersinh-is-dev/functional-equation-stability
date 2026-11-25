# Sharp Pexider stability on ultrametric semigroups

## Setting

Let `X` be an ultrametric normed additive group. Thus `‖a+b‖≤max(‖a‖,‖b‖)`. No completeness or scalar-field structure is required for the upper bound.

For `f,g,h:ℕ→X`, define the Pexider defect

`R(s,t)=f(s+t)-g(s)-h(t)`.

Here `ℕ` contains zero.

## Theorem C10a — Semigroup with zero

If `‖R(s,t)‖≤ε` for all `s,t`, then there exist `u,a,b∈X` such that

`F(n)=nu+a+b`, `G(n)=nu+a`, `H(n)=nu+b`

is an exact triple and

`‖f(n)-F(n)‖≤ε`, `‖g(n)-G(n)‖≤ε`, `‖h(n)-H(n)‖≤ε`

for every `n`.

## Theorem C10b — Positive integers

If the defect bound holds only for `s,t≥1`, then there exist `u,a,b∈X` such that

`G(n)=a+(n-1)u`, `H(n)=b+(n-1)u` for `n≥1`,

`F(n)=a+b+(n-2)u` for `n≥2`,

is exact on positive integers. The value `F(1)` is arbitrary and may be chosen equal to `f(1)`. All three errors are at most `ε` on their domains.

The free value `F(1)` is essential: `1` is not a sum of two positive integers.

## Theorem C10c — Sharpness over `Q_p`

For `ε>0`, choose `e∈Q_p` with `‖e‖_p=ε`. On positive integers define

`h(n)=0`,

`g(1)=0`, `g(n)=e` for `n≥2`,

`f(2)=0`, `f(n)=e` for `n≥3`,

with `f(1)` arbitrary.

Every defect is `0` or `e`, so the bound is `ε`. No exact triple has all three errors strictly below `ε`. Thus the constant `1` is sharp, and the non-strict inequality `≤ε` cannot be replaced by `<ε`.

## Exact solution structure and gauge

On `ℕ`, every exact triple has the affine form above, with a common slope `u` for `g` and `h`. Complementary slopes are impossible because different decompositions of the same sum would give different values.

On `ℕ₀`, the gauge is

`(f,g,h) ↦ (f+a+b,g+a,h+b)`.

On positive integers there is an additional genuine freedom in `f(1)`, not merely gauge freedom.
