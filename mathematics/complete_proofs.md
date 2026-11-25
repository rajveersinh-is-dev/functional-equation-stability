# Complete proof of the normalized sharp theorem

Write `R(x,y)` for the midpoint Pexider defect.

## 1. Diagonal estimate

Setting `x=y` gives

`R(x,x)=2f(x)-2g(x)`.

Hence `‖g(x)-f(x)‖≤ε/2`.

## 2. Dyadic recurrence

Setting `y=0` gives

`‖4f(x/2)-g(x)‖≤ε`.

Combining this with the diagonal estimate yields

`‖4f(x/2)-f(x)‖≤3ε/2`.

Replacing `x` by `2x` and changing the sign gives

`‖f(2x)-4f(x)‖≤3ε/2`.

Define `f_n(x)=4^(-n)f(2^n x)`. Then

`f_(n+1)(x)-f_n(x)=4^(-(n+1))(f(2^(n+1)x)-4f(2^n x))`,

so

`‖f_(n+1)(x)-f_n(x)‖≤(3ε/2)4^(-(n+1))`.

The sequence is uniformly Cauchy. Completeness of `Y` gives a uniform limit `Q`. Telescoping gives

`‖f-Q‖∞≤(3ε/2)∑_{n≥0}4^(-(n+1))=ε/2`.

The diagonal estimate then gives `‖g-Q‖∞≤ε`.

## 3. Quadraticity

With `u=x+y`, `v=x-y`, the midpoint identities give the exact identity

`D_f(x,y)=(f(u)-g(u))+(f(v)-g(v))-R(u,v)`.

The diagonal estimate and the original defect bound therefore give `‖D_f(x,y)‖≤2ε`.

Scaling at `2^n x,2^n y` by `4^(-n)` and passing to the uniform limit proves

`Q(x+y)+Q(x-y)=2Q(x)+2Q(y)`.

Also `Q(0)=0`. If `Q₁,Q₂` are quadratic maps at finite uniform distance from `f`, their difference `H` is bounded and quadratic. Thus `H(2x)=4H(x)` and `H(x)=4^(-n)H(2^n x)→0`, proving uniqueness.

## 4. Sharpness

For the stated example, the defect is `0`, `1`, or `-1` depending on whether neither, exactly one, or both midpoint arguments vanish. Its supremum is `1`.

Let `Q` be any quadratic map. Then `Q(0)=0` and `Q(nx)=n²Q(x)` for integer `n`. Writing `a=Q(1)`, the errors at nonzero integers `n` are

`(1-a)n²+1/2` for `f`, and `(1-a)n²+1` for `g`.

Uniform boundedness forces `a=1`. The distances are then exactly `1/2` and `1`, attained by `Q(x)=x²`.

## 5. Lean verification

The Lean development formalizes the diagonal and axis estimates, dyadic Cauchy bound, limit construction, both error bounds, and quadraticity of the limit. It uses a conservative `2ε` intermediate estimate for the ordinary quadratic defect; this does not affect the final constants.
