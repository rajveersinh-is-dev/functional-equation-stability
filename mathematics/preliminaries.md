# Preliminary lemmas

## Lemma 1: Positive order

If `x` has finite order `n=ord(x)`, then `n≥1` and `x^n=1`.

This is the defining property of the order of an element.

## Lemma 2: Powers along the cycle

For every integer `k≥0`,

`x^(k+1)x = x^(k+2)`

and

`x^(k+1)x⁻¹ = x^k`.

Both identities follow by expanding `x^(k+1)=x^k x` and using associativity and cancellation. No commutativity between distinct group elements is used.

## Lemma 3: Cyclic reindexing

Let `n=ord(x)` and let `F : G→X`. Then

`∑_{k=0}^{n-1} F(x^(k+1)) = ∑_{k=0}^{n-1} F(x^k)`.

Indeed, the left index set runs through `x,x²,…,x^n=1`, while the right runs through `1,x,…,x^(n-1)`. These are the same cyclic list.

More generally, for every fixed nonnegative integer `m`,

`∑_{k=0}^{n-1} F(x^(k+m)) = ∑_{k=0}^{n-1} F(x^k)`.

## Lemma 4: Cyclic quadratic-defect identity

If `n=ord(x)`, then

`∑_{k=0}^{n-1} D_q(x^(k+1),x) = -2n q(x)`.

**Proof.** By Lemma 2, each summand equals

`q(x^(k+2)) + q(x^k) - 2q(x^(k+1)) - 2q(x)`.

Summing and applying Lemma 3 to the first three terms gives

`∑ q(x^k) + ∑ q(x^k) - 2∑ q(x^k) - 2n q(x) = -2n q(x)`.

## Lemma 5: Norm of a finite sum

For any finite family `v_1,…,v_n ∈ X`,

`‖∑_{k=1}^n v_k‖ ≤ ∑_{k=1}^n ‖v_k‖`.

This is repeated application of the triangle inequality.
