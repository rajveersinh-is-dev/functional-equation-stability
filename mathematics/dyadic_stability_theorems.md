# Quadratic stability on dyadically eventually commuting groups

## Algebraic condition

A group `G` is **dyadically eventually commuting** if for every `x,y∈G` there is `N=N(x,y)` such that

`(xy)^(2^n)=x^(2^n)y^(2^n)` for all `n≥N`.

The integer `N` may depend on the pair. No fixed exponent is required.

Every abelian group satisfies the condition with `N=0`.

If `G` is nilpotent of class at most two and every element of the commutator subgroup `[G,G]` has order a power of two, then `G` satisfies the condition. Indeed, for central `c=[y,x]` of order dividing `2^r`,

`(xy)^m=x^m y^m c^{binomial(m,2)}`,

and `binomial(2^n,2)=2^(n-1)(2^n-1)` is divisible by `2^r` whenever `n≥r+1`.

The condition is strictly broader than fixed `n`-Abelianity when commutator orders are unbounded.

## Theorem C8

Let `G` be dyadically eventually commuting, `X` a real Banach space, and `q:G→X` satisfy

`‖q(xy)+q(xy⁻¹)-2q(x)-2q(y)‖≤ε`.

Then there exists an exact quadratic map `Q:G→X` such that

`‖q(x)-Q(x)‖≤ε/2` for every `x`.

The map is explicitly

`Q(x)=lim_{n→∞}4^(-n)q(x^(2^n))`.

No continuity, measurability, or local boundedness of `q` is assumed.

## Convergence criterion

The Banach assumption can be replaced by the explicit necessary and sufficient condition that every sequence `4^(-n)q(x^(2^n))` converges in `X`. If these limits exist, their limit map is quadratic and satisfies the same `ε/2` error bound. Conversely, any exact quadratic approximation within `ε/2` forces these sequences to converge to it.

## Normalized corollary

If `q(1)=0`, the same proof gives the stronger estimate `‖q-Q‖∞≤ε/3`.

## Sharpness

For `ε>0` and a unit vector `u`, the constant map `q≡(ε/2)u` has defect norm `ε`. Every exact quadratic map vanishes at the identity, so its distance from `q` is `ε/2`. Thus the unnormalized constant is optimal.

## Scope

The Banach-space hypothesis is used only to converge the uniformly Cauchy dyadic sequence. The algebraic condition is used only to pass to the limit in the cross-defect equation.
