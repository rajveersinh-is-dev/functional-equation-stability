from __future__ import annotations

import re
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]


def test_required_research_files_exist() -> None:
    required = [
        "README.md",
        "VERIFICATION.md",
        "COMPLETION_AUDIT.md",
        "FINAL_REPORT.md",
        "LICENSE",
        "CITATION.cff",
        "CONTRIBUTING.md",
        "CHANGELOG.md",
        "STATUS.md",
        "RESEARCH_LOG.md",
        "PROOF_OBLIGATIONS.md",
        "DECISIONS.md",
        "NOVELTY_AUDIT.md",
        "research/literature_review.md",
        "research/literature_matrix.csv",
        "research/reference_verification.md",
        "paper/manuscript.tex",
        "paper/references.bib",
        "lean-toolchain",
        "lakefile.toml",
        "pyproject.toml",
    ]
    missing = [name for name in required if not (ROOT / name).is_file()]
    assert not missing


def test_lean_sources_have_no_placeholders_or_custom_axioms() -> None:
    forbidden = re.compile(r"\b(?:sorry|admit)\b|^\s*axiom\s", re.MULTILINE)
    for path in (ROOT / "formalization").rglob("*.lean"):
        assert not forbidden.search(path.read_text(encoding="utf-8")), path


def test_ci_workflows_exist() -> None:
    workflows = ROOT / ".github" / "workflows"
    expected = {"tests.yml", "lean.yml", "manuscript.yml"}
    assert expected.issubset({path.name for path in workflows.glob("*.yml")})


def test_bibtex_keys_are_unique() -> None:
    text = (ROOT / "paper" / "references.bib").read_text(encoding="utf-8")
    keys = re.findall(r"@\w+\{([^,]+),", text)
    assert len(keys) == len(set(keys))
