# Main theorems

## Theorem C2N — Normalized sharp stability

Let `X` be a real normed space and `Y` a real Banach space. Let `f,g:X→Y` satisfy `f(0)=g(0)=0` and

`‖2f((x+y)/2)+2f((x-y)/2)-g(x)-g(y)‖≤ε`

for all `x,y∈X`. Then there is a quadratic map `Q:X→Y` such that

`‖f-Q‖∞≤ε/2`, `‖g-Q‖∞≤ε`.

No continuity, measurability, or local boundedness of `f` or `g` is assumed.

## Uniqueness among bounded-distance quadratic approximants

The approximant is unique among quadratic maps `Q` for which `‖f-Q‖∞` is finite. A bounded difference of two such maps satisfies `H(2x)=4H(x)`, hence `H(x)=4^(-n)H(2^n x)→0`.

## Sharpness

Let `X=Y=ℝ`, `f(0)=g(0)=0`, and for `x≠0` set

`f(x)=x²+1/2`, `g(x)=x²+1`.

The defect norm is `1`. The quadratic map `Q(x)=x²` has distances exactly `1/2` and `1`. No quadratic map has smaller uniform distances, so both constants are optimal.

## Status

The proof is complete, the central theorem and sharpness are Lean-verified, and the exact constant vector appears new relative to the audited literature.
