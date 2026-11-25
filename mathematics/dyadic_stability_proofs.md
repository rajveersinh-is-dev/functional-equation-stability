# Complete proof of dyadic quadratic stability

Let `Δ(x,y)=q(xy)+q(xy⁻¹)-2q(x)-2q(y)`.

## 1. Identity control and dyadic recurrence

At `x=y=1`, `Δ(1,1)=-2q(1)`, hence `‖q(1)‖≤ε/2`.

At `y=x`,

`Δ(x,x)=q(x²)+q(1)-4q(x)`, so

`q(x²)=4q(x)+Δ(x,x)-q(1)`.

Define `q_n(x)=4^(-n)q(x^(2^n))`. Then

`q_(n+1)(x)-q_n(x)=4^(-(n+1))(Δ(x^(2^n),x^(2^n))-q(1))`,

and therefore

`‖q_(n+1)(x)-q_n(x)‖≤(3ε/2)4^(-(n+1))`.

The bound is uniform in `x` and summable.

## 2. Limit and error

Completeness of `X` gives a uniform limit `Q`. Telescoping yields

`‖q(x)-Q(x)‖≤(3ε/2)∑_{n≥0}4^(-(n+1))=ε/2`.

Shifting the sequence gives `Q(x²)=4Q(x)`.

If `q(1)=0`, the increment bound is `ε4^(-(n+1))`, so the error is at most `ε/3`.

## 3. Full quadraticity

Fix `x,y`. Choose `n` large enough for the algebraic condition, applied to both `(x,y)` and `(x,y⁻¹)`. Then

`(xy)^(2^n)=x^(2^n)y^(2^n)`,

`(xy⁻¹)^(2^n)=x^(2^n)y^(-2^n)`.

Applying the approximate equation at `x^(2^n),y^(2^n)` and scaling by `4^(-n)` gives

`q_n(xy)+q_n(xy⁻¹)-2q_n(x)-2q_n(y)=4^(-n)Δ(x^(2^n),y^(2^n))`.

The right-hand side tends uniformly to zero. The left-hand side tends to `Δ_Q(x,y)`, so `Δ_Q=0`.

## 4. Convergence criterion

The forward direction needs no completeness: the same telescoping and cross-defect arguments apply once the pointwise limits are assumed. Conversely, if `Q` is exact and `‖q-Q‖∞≤ε/2`, then

`4^(-n)q(x^(2^n))-Q(x)=4^(-n)(q-Q)(x^(2^n))`,

whose norm is at most `(ε/2)4^(-n)`. Thus the dyadic sequences converge to `Q`.

## 5. Sharpness

For `q≡(ε/2)u`, `Δ_q(x,y)=-εu`. Any exact quadratic `Q` satisfies `Q(1)=0`, so the distance is `ε/2`.

## 6. Why the algebraic class is broader than fixed n-Abelian groups

For class-two groups, a fixed relation `(xy)^m=x^m y^m` for all `x,y` forces every commutator order to divide `m`. The dyadic condition only requires each individual commutator order to be a power of two, with no uniform bound.

For example, a class-two Heisenberg-type group whose center is the Prüfer two-group has commutators of arbitrarily large two-power order. Each pair still satisfies the dyadic eventual relation, while no fixed `m` works for all pairs.

## 7. Lean verification

The algebraic condition, dyadic recurrence, uniform Cauchy estimate, limit, error bound, homogeneity, scaled cross-defect limit, and final existential theorem are formalized in Lean 4. The class-two implication and Prüfer-group example are expository and are not part of the current Lean development.
