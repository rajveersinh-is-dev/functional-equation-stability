# Pexider quadratic cone stability — theorems

## Theorem C2 — General two-function estimate

Let `X` be a cone and `Y` a separated, full, symmetrically complete locally convex cone. Let `v∈V` be bounded, `f,g:X→Y`, and put `a=f(0)`. Assume `a` is bounded and

`2f((x+y)/2)+2f((x-y)/2) ∈ v(g(x)+g(y))v`

for all admissible `x,y`.

Choose `λ>0` such that `a≤λv` and `0≤a+λv`. Define

`Q(x)=lim_{n→∞} 4^(-n) f(2^n x)`.

Then the limit exists, `Q(0)=0`, and `Q` is quadratic:

`Q(x+y)+Q(x-y)=2Q(x)+2Q(y)`.

Moreover,

`Q(x) ∈ ((λ+2/3)v)(f(x))((λ+2/3)v)`,

and

`Q(x) ∈ ((2λ+7/6)v)(g(x))((2λ+7/6)v)`.

No separate boundedness assumption on `g(0)` is needed.

## Theorem C2N — Normalized improvement

If, in addition, `f(0)=g(0)=0`, then the original equation gives the sharper estimates

`Q(x) ∈ ((1/2)v)(f(x))((1/2)v)`,

`Q(x) ∈ v(g(x))v`.

These constants follow by combining the original equation with its diagonal, without passing through the general `λ` estimates. In the real Banach-space specialization they are optimal.

## Theorem C2S — Sharpness of the normalized constants

Let `X=Y=ℝ`, `v=1`, and define

`f(0)=g(0)=0`,

`f(x)=x²+1/2` and `g(x)=x²+1` for `x≠0`.

Then the normalized Pexider defect is bounded by `1`, while the exact quadratic map `Q(x)=x²` satisfies

`sup_{x≠0}|f(x)-Q(x)|=1/2`,

`sup_{x≠0}|g(x)-Q(x)|=1`.

Thus neither normalized constant can be decreased.

## Uniqueness

The quadratic map satisfying the first general neighborhood estimate is unique. Any other quadratic map `R` with `R∈(cv)(f)(cv)` has `R(0)=0`; hence `R(2^n x)=4^n R(x)`, and the shrinking radii force `R=Q` by separation.

## Status

The proof is complete. Novelty is under independent audit; the constants in the normalized case are not claimed to be optimal.
