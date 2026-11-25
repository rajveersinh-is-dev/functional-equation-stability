# Counterexamples, sharpness, and necessary hypotheses

## Sharpness of `ε/2` for `f`

Take `f(0)=0` and `f(x)=x²+1/2` for `x≠0`. Any quadratic map `Q` with bounded uniform error must satisfy `Q(1)=1`, because `Q(n)=n²Q(1)`. The error is then exactly `1/2` at every nonzero integer. Thus the constant cannot be decreased.

## Sharpness of `ε` for `g`

Take `g(0)=0` and `g(x)=x²+1` for `x≠0`. The same argument forces `Q(1)=1`, and the error is exactly `1` at every nonzero integer.

## Joint sharpness

The pair `f(x)=x²+1/2`, `g(x)=x²+1` off zero satisfies the approximate equation with defect at most `1`, and `Q(x)=x²` attains both distances simultaneously.

## Completeness is necessary for this proof

The dyadic sequence is uniformly Cauchy. In an incomplete target it need not converge, so the Banach assumption cannot be removed without an additional convergence hypothesis.

## Normalization matters

The constants are stated for `f(0)=g(0)=0`. Nonzero values at zero introduce shift terms and require separate estimates.

## Functional equation versus homogeneous form

A solution of the quadratic functional equation need not be genuinely real-homogeneous. A discontinuous additive map `A` gives the exact pair `f=g=A²`, which solves the equation without being a continuous homogeneous quadratic form. The theorem concerns equation solutions, not homogeneous forms.
