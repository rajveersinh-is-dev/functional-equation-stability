# Literature review

**Search date:** 25 November 2026.

**Scope:** Functional equations and mathematical stability theory, with emphasis on quadratic equations, torsion and periodic groups, non-Archimedean methods, Pexider equations, and quantitative stability constants.

**Verification convention:** “Inspected” means that the mathematical statement was read in a paper, publisher PDF, arXiv version, or verified reproduction. Metadata-only and abstract-only checks are identified separately. A missing search result is not treated as proof that a theorem is new.

## 1. Historical foundations

### Ulam's question

Ulam's stability question is conventionally associated with his 1940 University of Wisconsin talk. The verified printed collections are *A Collection of Mathematical Problems* (Interscience, 1960) and the revised *Problems in Modern Mathematics* (Wiley, 1964). The 1960 scan was not directly accessible; its metadata and edition history were checked. The question asks whether a sufficiently small uniform additive Cauchy defect forces the existence of an exact additive approximation.

The historical dating matters: the printed collections appeared after Hyers's 1941 solution and should not be described as contemporaneous 1940 publications.

### Hyers (1941)

D. H. Hyers, “On the Stability of the Linear Functional Equation,” *Proceedings of the National Academy of Sciences* **27**(4), 222–224, 1941. DOI: [10.1073/pnas.27.4.222](https://doi.org/10.1073/pnas.27.4.222).

**Printed Theorem 1.** For Banach spaces `E,E'`, if

`‖f(x+y)-f(x)-f(y)‖ ≤ δ`

for all `x,y`, then

`A(x)=lim_{n→∞} 2^{-n} f(2^n x)`

exists, is additive, and satisfies `‖f-A‖∞≤δ`. The additive map with this bound is unique. No continuity assumption on `f` is required.

**Limitations.** The defect is uniformly bounded, the target is complete, and the equation is additive. The word “linear” in the title initially refers to additivity, not automatic real linearity.

**Access:** Full article inspected through OCR of the original PNAS issue; DOI metadata verified through Crossref.

### Rassias (1978)

T. M. Rassias, “On the stability of the linear mapping in Banach spaces,” *Proceedings of the American Mathematical Society* **72**(2), 297–300, 1978. DOI: [10.1090/S0002-9939-1978-0507327-1](https://doi.org/10.1090/S0002-9939-1978-0507327-1).

For Banach spaces, scalar-path continuity of `f`, and `0≤p<1`, the bound

`‖f(x+y)-f(x)-f(y)‖ ≤ θ(‖x‖^p+‖y‖^p)`

implies a unique linear `T` with

`‖f-T‖∞ ≤ 2θ/(2-2^p) ‖x‖^p`.

**Limitations.** The theorem retains scalar-path continuity and excludes `p≥1`. At `p=0`, its printed constant is `2θ`, not Hyers's sharp `θ`.

**Access:** All four pages of the AMS PDF inspected; DOI metadata verified.

### Later synthesis and superstability

S.-M. Jung, *Hyers-Ulam-Rassias Stability of Functional Equations in Nonlinear Analysis*, Springer Optimization and Its Applications 48, 2011. DOI: [10.1007/978-1-4419-9637-4](https://doi.org/10.1007/978-1-4419-9637-4). Front matter, contents, and selected chapter abstracts were inspected; the full monograph was not accessible.

J. Baker, J. Lawrence, and F. Zorzitto, “The stability of the equation `f(x+y)=f(x)f(y)`,” *Proceedings of the American Mathematical Society* **74**(2), 242–246, 1979. DOI: [10.1090/S0002-9939-1979-0524294-6](https://doi.org/10.1090/S0002-9939-1979-0524294-6). For real-valued `f` on a real vector space with bounded multiplicative defect, `f` is either bounded or exactly exponential. This is a dichotomy, not an approximation estimate for the exponential branch. Only the publisher abstract, metadata, and indexed excerpts were accessible.

## 2. Exact quadratic structure and torsion

P. Friis and H. Stetkær, “On the quadratic functional equation on groups,” *Publicationes Mathematicae Debrecen* **69**, 65–93, 2006. [Publisher PDF](https://publi.math.unideb.hu/paper/1111/download/10_5486_PMD_2006_3270.pdf).

Theorem 1.2, reproducing Aczél's classification, states that for abelian `G` and uniquely 2-divisible `H`, every solution of

`f(xy)+f(xy^{-1})=2f(x)+2f(y)`

has the form `f(x)=Q(x,x)` for a symmetric biadditive `Q`.

**Limitation.** Unique 2-divisibility of the codomain excludes two-torsion phenomena. Domain torsion alone is not the decisive obstruction in this classification.

P. Yang's 2005 result, Theorem 2.1 as verified in the publisher source, gives the power law

`f(x^n)=n^2 f(x)`

for normalized exact quadratic maps. [Publisher PDF](https://publi.math.unideb.hu/paper/1011/download/10_5486_PMD_2005_2986.pdf).

**Consequence for real normed targets.** If `x` has finite order `n`, then `n^2 f(x)=f(x^n)=f(1)=0`, so `f(x)=0`. Thus exact real-normed quadratic maps vanish on every finite-order element. This exact fact does not by itself give a quantitative approximate bound; that is the distinction investigated by candidate C1.

## 3. Stability methods and their domain restrictions

V. Cădariu and C. Radu (2007), Theorem 3.4, treat quadratic stability on a uniquely 2-divisible domain into a Banach space. Their hypotheses include contraction and decay conditions on a control function, and their conclusion is a unique quadratic approximation with an explicit error estimate. [Publisher PDF](https://www.carpathian.cunbm.utcluj.ro/wp-content/uploads/2007-vol-23/carpathian_2007_23_063_072.pdf).

**Limitation.** The proof uses dyadic scaling. Finite-order domain elements are not naturally treated by a contraction based on repeated dilation.

A. Faiziev and P. K. Sahoo (2007) study the midpoint-free Jensen equation

`f(xy)+f(xy^{-1})=2f(x)`.

Uniformly bounded defect yields an exact Jensen solution whose difference from `f` is bounded. [arXiv:math/0703628](https://arxiv.org/abs/math/0703628).

**Limitation.** The conclusion is boundedness of the difference, not a `Cε` estimate, and the equation is not the quadratic equation.

G. L. Forti, “Stability of functional equations and properties of groups,” *Annales Mathematicae Silesianae* **33**(1), 77–96, 2019. DOI: [10.2478/amsil-2019-0004](https://doi.org/10.2478/amsil-2019-0004). Theorem 2.4 gives an explicit amenable-group additive stability statement for real- or complex-valued functions. More importantly for the present audit, Theorem 1.5 treats any group and real-valued `f` with quadratic defect bounded by `H`: the dyadic limit `q` satisfies `q(x²)=4q(x)` and `|f(x)-q(x)|≤H/2`. On a finite cyclic subgroup the limit vanishes. Scalarization therefore gives the finite-order `H/2` bound for real normed targets. The full paper was downloaded and the theorem text was directly inspected.

## 4. Non-Archimedean and critical-value results

K. Ciepliński, “On Ulam Stability of Functional Equations in Non-Archimedean Spaces,” *Symmetry* **17**(1), 112, 2025. DOI: [10.3390/sym17010112](https://doi.org/10.3390/sym17010112).

The verified survey reports quadratic stability under dyadic decay conditions such as

`|4|^{-j} φ(2^j x,2^j y) → 0`.

It also reports Jensen stability results requiring conditions such as `|3|<1`.

**Limitation.** Critical cases with `|2|=1` or `|4|=1` and constant defect are not covered by those scaling theorems. In `Q_p`, `|2|_p=1` for every odd `p`.

M. Sal Moslehian, “The Jensen functional equation in non-Archimedean normed spaces,” *Journal of Function Spaces* **7**(1), 13–24, 2009. DOI: [10.1155/2009/802032](https://doi.org/10.1155/2009/802032). The survey's statement was checked; the original full text was not independently inspected in this project.

## 5. Recent candidate-generating results

### Locally convex cones

J.-H. Bae, J. Mohammadpour, and A. Najati, “Hyers-Ulam stability of quadratic operators in locally convex cones,” *AIMS Mathematics* **10**(10), 23136–23150, 2025. DOI: [10.3934/math.20251026](https://doi.org/10.3934/math.20251026); [arXiv:2504.08013](https://arxiv.org/abs/2504.08013).

Theorem 2.5 treats the single-function quadratic equation in a separated, full, symmetrically complete locally convex cone under bounded cone errors. A 2025 Pexider additive result treats a different equation. The two-function Pexider quadratic combination was not located and remains candidate C2.

### General-valued-field dilation

J. Tongsomporn and N. Aksornthong, “Hyers-Ulam-Rassias Stability of Generalized Quadratic Functional Equation on Non-Archimedean Normed Space over p-Adic Numbers,” *Symmetry* **17**(10), 1651, 2025. DOI: [10.3390/sym17101651](https://doi.org/10.3390/sym17101651).

Corollary 2 after Theorem 3 treats the four-function equation

`F(x+y)+G(x-y)=L(x)+M(y)`

on a `2p`-divisible abelian group with `Q_p` normed spaces, giving explicit quadratic and additive approximations. Replacing `Q_p` and dilation by `p` with a general complete valued field and a factor `λ` with `|λ|>1` is candidate C3; novelty depends on obtaining more than a routine substitution.

### Pexiderized Fréchet constants

I. Opraie, D. Popa, and L. Timboş, “The Best Ulam Constant of the Fréchet Functional Equation,” *Mathematics* **10**(10), 1769, 2022. DOI: [10.3390/math10101769](https://doi.org/10.3390/math10101769).

Theorem 8 gives the sharp classical Fréchet constant `1`. Theorem 10 classifies exact Pexider quadruples. Theorem 11 gives bounds `6ε` for the first function and `9ε` for the other three. The Pareto-optimal constant vector was not located and is candidate C4.

## 6. Candidate C1 and its precise comparison target

Candidate C1 studied the uniform bound

`‖q(xy)+q(xy^{-1})-2q(x)-2q(y)‖≤ε`

on an arbitrary group with a real normed-space target, seeking to prove `‖q(x)‖≤ε/2` on finite-order elements.

The focused audit found that this is already implied by Forti's Theorem 1.5. For each continuous linear functional `ℓ`, apply the real-valued theorem to `ℓ∘q`. On the finite cyclic subgroup generated by `x`, the defining dyadic limit is zero, so `|ℓ(q(x))|≤ε/2`. Taking the supremum over norming functionals gives the normed-space bound without completeness. Rätz's Theorem 4.2 and Popa–Rus's 2026 Theorem 9.1/Remark 9.3 provide further close results.

C1 is therefore retained as verified background, not as an original contribution.

## 7. Source-access ledger

| Source | Access level |
|---|---|
| Hyers 1941 | Full text inspected |
| Rassias 1978 | Full text inspected |
| Ulam 1960 collection | Archive metadata and edition history only |
| Jung 2011 monograph | Front matter, contents, selected abstracts |
| Baker–Lawrence–Zorzitto 1979 | Abstract, metadata, indexed excerpts |
| Forti 2019 | Theorem statement verified by literature investigation; DOI metadata verified |
| Friis–Stetkær 2006 | Publisher PDF inspected |
| Yang 2005 | Publisher PDF inspected |
| Cădariu–Radu 2007 | Publisher PDF inspected |
| Faiziev–Sahoo 2007 | arXiv source inspected |
| Ciepliński 2025 | Theorem text inspected |
| Bae–Mohammadpour–Najati 2025 | Publisher PDF inspected |
| Tongsomporn–Aksornthong 2025 | Publisher PDF inspected |
| Opraie–Popa–Timboş 2022 | Publisher PDF inspected |

The detailed row-by-row comparison is in `literature_matrix.csv`.
