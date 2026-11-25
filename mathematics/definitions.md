# Definitions and notation

## Setting

- `X`: a real normed vector space.
- `Y`: a real Banach space.
- `f,g:X→Y`: the two unknown maps.
- `ε≥0`: the uniform defect bound.

## Midpoint Pexider defect

For `x,y∈X`, define

`R(x,y)=2f((x+y)/2)+2f((x-y)/2)-g(x)-g(y)`.

The map pair is approximately quadratic when `‖R(x,y)‖≤ε` for all `x,y`.

## Equivalent standard form

With `u=(x+y)/2` and `v=(x-y)/2`, the equation becomes

`g(u+v)+g(u-v)=2f(u)+2f(v)`.

This is the classical partially Pexiderized quadratic equation.

## Exact normalized solutions

An exact pair satisfies `R=0`. Under `f(0)=g(0)=0`, the diagonal substitution gives `f=g`, and the remaining equation is

`f(u+v)+f(u-v)=2f(u)+2f(v)`.

Thus every exact normalized pair is `f=g=Q`, where `Q` is a solution of the quadratic functional equation.

Here “quadratic map” means a solution of the functional equation. It need not be continuous or genuinely real-homogeneous without additional regularity.

## Uniform norm

For maps on `X`, `‖q‖∞=sup_{x∈X}‖q(x)‖`.

## Stability constants

The normalized theorem seeks one quadratic `Q` with

`‖f-Q‖∞≤ε/2` and `‖g-Q‖∞≤ε`.

Both constants are sharp.
