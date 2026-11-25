# Contributing

This is a mathematical research repository. Correctness takes priority over feature volume.

## Requirements

- State every theorem with explicit hypotheses and a precise conclusion.
- Supply complete proofs; do not use placeholders or hidden regularity assumptions.
- Verify bibliographic details and mark inaccessible sources as unverified.
- Distinguish published results, preprints, conjectures, and original contributions.
- Label AI-assisted reviews as AI-assisted; do not imply external peer review.
- Keep Lean sources free of `sorry`, `admit`, and custom axioms.
- Report actual test, build, and CI results rather than intended results.
- Preserve counterexamples and negative research outcomes.

## Suggested workflow

1. Read `STATUS.md`, `RESEARCH_LOG.md`, and `PROOF_OBLIGATIONS.md`.
2. Reproduce the existing checks from `docs/reproduction.md`.
3. Propose a precise mathematical change and identify its proof obligations.
4. Add or update proofs, formalization, tests, and literature records together.
5. Run the full local checks before proposing a commit.

## Security and privacy

Do not commit credentials, private research files, personal contact details, or unrelated workspace content.
