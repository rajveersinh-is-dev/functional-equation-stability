# Pexider quadratic cone stability — definitions

## Cones

A cone is a set `P` with commutative associative addition, zero, and scalar multiplication by `ℝ≥0` satisfying the usual module axioms except that additive inverses are not required. Cancellation is not assumed.

A preordered cone carries a reflexive transitive order compatible with addition and nonnegative scalars.

## Neighborhood system

An abstract zero-neighborhood system `V` satisfies:

- `0<v` for every `v∈V`;
- for `u,v∈V`, some `w∈V` satisfies `w≤u` and `w≤v`;
- `u+v∈V` and `λv∈V` for positive `λ`.

For `a∈P`, define

- `v(a)={b : b≤a+v}`;
- `(a)v={b : a≤b+v}`;
- `v(a)v=v(a)∩(a)v`.

Thus `a∈v(b)v` means `a≤b+v` and `b≤a+v`.

## Full, separated, complete

A full locally convex cone is bounded below: for every `a` and `v∈V`, some `ρ>0` satisfies `0≤a+ρv`.

An element is bounded if it is both lower and upper bounded; in a full cone it suffices to check upper boundedness.

A locally convex cone is separated if equality of all upper closures implies equality of the elements. It is symmetrically complete if every symmetric Cauchy net converges.

A useful consequence of separation is: if `a≤b+v` and `b≤a+v` for every `v∈V`, then `a=b`.

## Domain and maps

`X` is a cone. Maps `f,g:X→Y` are considered at arguments for which the displayed midpoint expressions belong to `X`.

The Pexider quadratic defect relation is

`2f((x+y)/2)+2f((x-y)/2) ∈ v(g(x)+g(y))v`.

An exact pair satisfies the same relation with `v` replaced by equality.
