# Reproduction guide

## Pinned environment

- Lean `4.36.0`
- Mathlib `v4.36.0`
- Python `3.14.6`
- NumPy `2.4.6`
- SciPy `1.18.0`
- pytest `9.1.1`
- ruff `0.16.8`
- Tectonic `0.17.0`

## Python checks

```bash
python -m pip install -e '.[dev]'
python -m ruff check experiments/source tests
python -m pytest -q
```

Reproduce the computational outputs:

```bash
python experiments/source/finite_group_quadratic_lp.py --max-cyclic 16
python experiments/source/semigroup_pexider_ultrametric.py --cases 100 --p 3 --horizon 20
python -m experiments.source.nonarch_dichotomy --modulus 64 --max-delta-power 8
```

The executed outputs are stored under `experiments/results/`.

## Lean checks

```bash
lake update
lake exe cache get
lake build
lake env lean tests/AxiomAudit.lean
```

`lean-toolchain` and `lakefile.toml` pin the toolchain and Mathlib release. The source contains no `sorry`, `admit`, or custom axioms.

## LaTeX manuscript

```bash
tectonic paper/manuscript.tex --outdir paper
pdftotext paper/manuscript.pdf /tmp/manuscript.txt
```

The PDF is the final flagship manuscript.

## Scope warning

Reproduction commands verify only the artifacts actually present. They do not establish literature novelty, and the current flagship selection remains open.
