# Non-Archimedean four-function quadratic equation — corrected record

**Status:** Rejected as an original flagship. The equation is known, and the asserted instability is false.

## Setting

Let `K` be a complete non-Archimedean normed field with `char K≠2`, let `E` be a complete non-Archimedean normed `K`-space, and let `S` be a `K`-space. For `F,G,L,M:S→E`, define

`D(x,y)=F(x+y)+G(x-y)-L(x)-M(y)`.

Assume `‖D(x,y)‖≤ε`.

## Exact component form

Every exact quadruple has the form

`F(x)=F(0)+Q(x)+A(x)`,

`G(x)=G(0)+Q(x)+B(x)`,

`L(x)=L(0)+2Q(x)+A(x)+B(x)`,

`M(x)=M(0)+2Q(x)+A(x)-B(x)`,

where `Q` is quadratic, `A,B` are additive, and `F(0)+G(0)=L(0)+M(0)`.

## Theorem C11a — Stable regime

If `|2|=1`, then there exist `Q,A,B` such that all four normalized errors

`‖F-F(0)-Q-A‖∞`, `‖G-G(0)-Q-B‖∞`,

`‖L-L(0)-2Q-A-B‖∞`, `‖M-M(0)-2Q-A+B‖∞`

are at most `ε`.

The constant `1` is sharp. Approximate uniqueness is not asserted and is false in general.

## Corrected bound when `|2|<1`

Even/odd decomposition amplifies the error by `|2|^{-1}`, but the standard proof still gives a finite stability constant `|2|^{-1}`. The residue construction shows only that the constant `1` fails in this regime; it does not rule out every finite constant.

## Limitations

- The instability example concerns rich targets such as `K`; trivial zero spaces are exceptions.
- The stable-regime theorem is an existence statement, not an approximate uniqueness theorem.
- Full Lean formalization of the transfinite extension argument is outside the practical scope of the current development.
