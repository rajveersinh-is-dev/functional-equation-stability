# Sharp Normalized Stability of the Pexider Quadratic Equation

**Author:** Rajveersinh Vishal Pardeshi, Independent Researcher

**Publication status:** Research manuscript and reproducibility archive. Not submitted to any journal; no acceptance or DOI is claimed.

## Abstract

We study the two-function Pexider quadratic equation on real normed spaces. If `f(0)=g(0)=0` and the uniform defect is at most `ε`, we prove that a quadratic map `Q` satisfies `‖f-Q‖∞≤ε/2` and `‖g-Q‖∞≤ε`. Both constants are sharp. The proof uses the diagonal identity, a dyadic geometric estimate, and a scaled cross-defect limit. No regularity of `f` or `g` is assumed.

## Mathematical problem

The normalized Pexider quadratic equation is

`2f((x+y)/2)+2f((x-y)/2)=g(x)+g(y)`.

After the substitution `u=(x+y)/2`, `v=(x-y)/2`, it becomes the classical partially Pexiderized quadratic equation

`g(u+v)+g(u-v)=2f(u)+2f(v)`.

The problem is to obtain the strongest simultaneous approximation constants for the two functions.

## Principal contribution

Let `X` be a real normed space, `Y` a real Banach space, and `f,g:X→Y` with zero values at zero. If

`‖2f((x+y)/2)+2f((x-y)/2)-g(x)-g(y)‖≤ε`,

then a quadratic `Q:X→Y` exists with

`‖f-Q‖∞≤ε/2`, `‖g-Q‖∞≤ε`.

The approximant is unique among quadratic maps at finite uniform distance from `f`.

### Precise assumptions

- `X` is a real normed vector space; completeness of `X` is not required.
- `Y` is a real Banach space.
- `f(0)=g(0)=0`.
- The defect bound is uniform over all `x,y∈X`.
- No continuity, measurability, or local boundedness of `f` or `g` is assumed.

### Proof strategy

1. The diagonal defect gives `‖g-f‖∞≤ε/2`.
2. The axis defect gives `‖f(2x)-4f(x)‖≤3ε/2`.
3. The dyadic sequence `4^(-n)f(2^n x)` is uniformly Cauchy and converges to `Q`.
4. Telescoping gives the `ε/2` bound for `f`; adding the diagonal bound gives `ε` for `g`.
5. Scaling the original defect and passing to the limit proves that `Q` is quadratic.

### Sharpness

On `X=Y=ℝ`, take `f(0)=g(0)=0` and, for `x≠0`,

`f(x)=x²+1/2`, `g(x)=x²+1`.

The defect norm is `1`, while `Q(x)=x²` has distances exactly `1/2` and `1`. No smaller constants are possible.

## Relationship to prior work

The equation and its Hyers–Ulam stability are classical. Czerwik, Jung, Jung–Sahoo, and Yang studied the partially Pexiderized equation and general four-function variants. The strongest relevant general bounds located were `2ε` and `3ε` in Yang's two-function theorem. The present `(ε/2, ε)` vector is a substantial sharp strengthening. The equation itself is not claimed as new, and no priority claim is made beyond the documented literature comparison.

## Verification

- Lean `4.36.0` and Mathlib `v4.36.0` are pinned.
- The central theorem, exact normalized solution structure, both sharpness lower bounds, and the uniqueness corollary compile.
- The axiom audit reports only `propext`, `Classical.choice`, and `Quot.sound`.
- Python lint passes and all 33 tests pass.
- The LaTeX manuscript compiles to [paper/manuscript.pdf](paper/manuscript.pdf).
- Separate AI-assisted adversarial reviews are documented; they are not external expert peer review.

See [VERIFICATION.md](VERIFICATION.md) for the evidence manifest.

## Reproduce

```bash
python -m pip install -e '.[dev]'
python -m ruff check experiments/source tests
python -m pytest -q
lake update
lake exe cache get
lake build
lake env lean tests/AxiomAudit.lean
tectonic paper/manuscript.tex --outdir paper
```

Full instructions are in [docs/reproduction.md](docs/reproduction.md).

## Repository structure

- `paper/`: final LaTeX manuscript, PDF, and BibTeX bibliography.
- `mathematics/`: definitions, theorem statements, complete proofs, sharpness, and open questions.
- `formalization/`: pinned Lean/Mathlib development.
- `experiments/`: reproducible computational checks and actual outputs.
- `tests/`: Python regression and repository-consistency tests.
- `research/`: literature review, candidate matrix, conjecture ledger, novelty audit, and reviewer reports.
- `docs/`: notation, background, reproduction, and limitations.
- `submission/`: abstract, cover-letter draft, author information, journal shortlist, and checklist.
- `.github/workflows/`: Python, Lean, and LaTeX CI configuration.

## Research limitations

- The sharp constants are proved for the normalized equation and a complete real Banach target.
- Nonzero values at zero require separate shift estimates.
- “Quadratic” means a solution of the functional equation, not necessarily a continuous homogeneous form.
- Literature novelty is supported by the documented audit but still requires external peer review.
- No journal submission has been made.

## Citation and license

Use [CITATION.cff](CITATION.cff) to cite the archived release. Code and documentation are MIT-licensed. The author is an independent researcher; no institutional affiliation or endorsement is claimed.
