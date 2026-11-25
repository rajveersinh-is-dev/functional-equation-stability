# Pexider quadratic cone stability — complete proofs

## 1. Eliminate `g`

Set `y=x` in the Pexider relation. Then

`2f(x)+2a ∈ v(2g(x))v`.

Multiplying both inequalities by `1/2` gives

`g(x) ∈ (v/2)(f(x)+a)(v/2)`.

Substituting this neighborhood bound into the original relation and adding radii yields

`2f((x+y)/2)+2f((x-y)/2) ∈ (2v)(f(x)+f(y)+2a)(2v)`.

No cancellation or additive inverse is used.

## 2. Dyadic estimate for `f`

Set `y=0`:

`4f(x/2) ∈ (2v)(f(x)+3a)(2v)`.

Using `a≤λv` for the upper inequality and `0≤a+λv` for the lower inequality gives

`f(2x)≤4f(x)+(3λ+2)v`,

`4f(x)≤f(2x)+(3λ+2)v`.

Put `k=(3λ+2)v` and `q_n(x)=4^(-n)f(2^n x)`. The preceding inequalities imply

`q_(n+1)(x)≤q_n(x)+4^(-(n+1))k`,

`q_n(x)≤q_(n+1)(x)+4^(-(n+1))k`.

Induction and `∑_{j≥1}4^(-j)=1/3` give

`q_n(x)≤f(x)+(k/3)(1-4^(-n))`,

`f(x)≤q_n(x)+(k/3)(1-4^(-n))`.

Because `k` is bounded, `4^(-n)k→0`. These estimates make `(q_n(x))` Cauchy. Symmetric completeness gives the limit `Q(x)`, and the same estimates give

`Q(x)∈((λ+2/3)v)(f(x))((λ+2/3)v)`.

Also `q_n(0)=4^(-n)a→0`, so `Q(0)=0`.

## 3. Quadraticity of the limit

Scale the single-function relation from Step 1 at `2^n x,2^n y` by `4^(-n)`. The error terms `4^(-n)(2v)` and `4^(-n)a` tend to zero. Taking two-sided limits and applying separation gives

`2Q((x+y)/2)+2Q((x-y)/2)=Q(x)+Q(y)`.

Since `Q(0)=0`, setting `y=0` gives `4Q(x/2)=Q(x)`. Replacing `(x,y)` by `((u+v)/2,(u-v)/2)` yields

`Q(u+v)+Q(u-v)=2Q(u)+2Q(v)`.

## 4. Approximation of `g`

From Step 1, `g(x)` is within `v/2` of `f(x)+a`. Since `a≤λv` and `0≤a+λv`, this implies

`f(x)∈((λ+1/2)v)(g(x))((λ+1/2)v)`.

Adding the radius `λ+2/3` for `Q-f` gives

`Q(x)∈((2λ+7/6)v)(g(x))((2λ+7/6)v)`.

## 5. Normalized improvement

Assume `a=0` and `g(0)=0`. The diagonal of the original equation is

`2f(x)∈v(2g(x))v`,

so

`g(x)∈(v/2)(f(x))(v/2)`.

Setting `y=0` in the original equation gives

`4f(x/2)∈v(g(x))v`.

Combining the two neighborhood bounds yields

`4f(x/2)∈((3/2)v)(f(x))((3/2)v)`.

Replacing `x` by `2x` gives `f(2x)≤4f(x)+(3/2)v` and the reverse inequality. The dyadic argument therefore has `k=(3/2)v`, so

`Q(x)∈((1/2)v)(f(x))((1/2)v)`.

Finally, `g(x)∈(v/2)(f(x))(v/2)`. Adding radii gives

`Q(x)∈v(g(x))v`.

## 6. Sharpness in the real case

Take `X=Y=ℝ`, `v=1`, `f(0)=g(0)=0`, and for `x≠0` set `f(x)=x²+1/2`, `g(x)=x²+1`.

If `x,y≠0` and `x±y≠0`, the defect is zero. If exactly one of `x,y` is zero, the defect is `1`. If `x=±y≠0`, the defect is `-1`. At `(0,0)` it is zero. Hence the uniform defect is at most `1`.

The map `Q(x)=x²` is exactly quadratic. For every `x≠0`, `|f(x)-Q(x)|=1/2` and `|g(x)-Q(x)|=1`. Therefore the normalized constants are sharp.

## 7. Uniqueness

Let `R` be quadratic and satisfy `R∈(cv)(f)(cv)`. Its value at zero is bounded. The quadratic equation at zero and repeated doubling force `R(0)=0`. Therefore `R(2^n x)=4^n R(x)`, and

`q_n(x)∈(c4^(-n)v)(R(x))(c4^(-n)v)`.

Letting `n→∞` and using separation gives `R=Q`.
