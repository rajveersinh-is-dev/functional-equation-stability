import FunctionalEquationStability.DyadicStability
import Mathlib.Analysis.SpecificLimits.Normed
import Mathlib.Tactic.FieldSimp
import Mathlib.Tactic.Module
import Mathlib.Tactic.NormNum

noncomputable section

namespace FunctionalEquationStability

variable {X Y : Type*} [NormedAddCommGroup X] [NormedSpace ℝ X]
  [NormedAddCommGroup Y] [NormedSpace ℝ Y]

/-- The defect in the two-function Pexider quadratic equation. -/
def quadraticPexiderDefect (f g : X → Y) (x y : X) : Y :=
  (2 : ℝ) • f ((2 : ℝ)⁻¹ • (x + y)) +
    (2 : ℝ) • f ((2 : ℝ)⁻¹ • (x - y)) - g x - g y

/-- A uniform bound for the two-function Pexider quadratic defect. -/
def IsApproximatePexiderQuadratic (f g : X → Y) (ε : ℝ) : Prop :=
  ∀ x y, ‖quadraticPexiderDefect f g x y‖ ≤ ε

variable {f g : X → Y} {ε : ℝ}

lemma norm_g_sub_f_le_half (hf0 : f 0 = 0)
    (h : IsApproximatePexiderQuadratic f g ε) (x : X) :
    ‖g x - f x‖ ≤ ε / 2 := by
  have hd := h x x
  have heq : quadraticPexiderDefect f g x x = (2 : ℝ) • (f x - g x) := by
    have hhalf : (2 : ℝ)⁻¹ • (x + x) = x := by module
    have hzero : (2 : ℝ)⁻¹ • (x - x) = 0 := by simp
    simp only [quadraticPexiderDefect, hhalf, hzero, hf0, smul_zero, add_zero]
    module
  rw [heq, norm_smul] at hd
  have h2 : ‖(2 : ℝ)‖ = 2 := by norm_num
  rw [h2] at hd
  have hd' : 2 * ‖g x - f x‖ ≤ ε := by simpa [norm_sub_rev] using hd
  linarith

lemma norm_four_f_half_sub_g (hg0 : g 0 = 0)
    (h : IsApproximatePexiderQuadratic f g ε) (x : X) :
    ‖(4 : ℝ) • f ((2 : ℝ)⁻¹ • x) - g x‖ ≤ ε := by
  have hh := h x 0
  have heq : quadraticPexiderDefect f g x 0 =
      (4 : ℝ) • f ((2 : ℝ)⁻¹ • x) - g x := by
    simp only [quadraticPexiderDefect, add_zero, sub_zero, hg0, add_zero]
    module
  rwa [heq] at hh

lemma norm_f_double_sub_four (hf0 : f 0 = 0) (hg0 : g 0 = 0)
    (h : IsApproximatePexiderQuadratic f g ε) (x : X) :
    ‖f ((2 : ℝ) • x) - (4 : ℝ) • f x‖ ≤ 3 * ε / 2 := by
  have hdiag := norm_g_sub_f_le_half hf0 h ((2 : ℝ) • x)
  have hzero := norm_four_f_half_sub_g hg0 h ((2 : ℝ) • x)
  have hhalf : (2 : ℝ)⁻¹ • ((2 : ℝ) • x) = x := by module
  rw [hhalf] at hzero
  have heq : f ((2 : ℝ) • x) - (4 : ℝ) • f x =
      (f ((2 : ℝ) • x) - g ((2 : ℝ) • x)) -
        ((4 : ℝ) • f x - g ((2 : ℝ) • x)) := by abel
  rw [heq]
  calc
    ‖(f ((2 : ℝ) • x) - g ((2 : ℝ) • x)) -
        ((4 : ℝ) • f x - g ((2 : ℝ) • x))‖ ≤
        ‖f ((2 : ℝ) • x) - g ((2 : ℝ) • x)‖ +
          ‖(4 : ℝ) • f x - g ((2 : ℝ) • x)‖ := norm_sub_le _ _
    _ ≤ ε / 2 + ε := add_le_add (by simpa [norm_sub_rev] using hdiag) hzero
    _ = 3 * ε / 2 := by ring

/-- Dyadic approximants for the common quadratic repair of `f` and `g`. -/
def pexiderDyadicApprox (q : X → Y) (n : ℕ) (x : X) : Y :=
  ((4 : ℝ) ^ n)⁻¹ • q ((2 : ℝ) ^ n • x)

lemma pexiderDyadic_succ_sub (q : X → Y) (n : ℕ) (x : X) :
    pexiderDyadicApprox q (n + 1) x - pexiderDyadicApprox q n x =
      ((4 : ℝ) ^ (n + 1))⁻¹ •
        (q ((2 : ℝ) • ((2 : ℝ) ^ n • x)) - (4 : ℝ) • q ((2 : ℝ) ^ n • x)) := by
  have hpow : (2 : ℝ) ^ (n + 1) • x = (2 : ℝ) • ((2 : ℝ) ^ n • x) := by
    rw [pow_succ, smul_smul, mul_comm]
  have hscalar : ((4 : ℝ) ^ (n + 1))⁻¹ * 4 = ((4 : ℝ) ^ n)⁻¹ :=
    four_pow_succ_inv_mul n
  simp only [pexiderDyadicApprox, hpow, smul_sub, smul_smul]
  module

lemma pexiderDyadic_step_norm_le (hf0 : f 0 = 0) (hg0 : g 0 = 0)
    (h : IsApproximatePexiderQuadratic f g ε) (n : ℕ) (x : X) :
    ‖pexiderDyadicApprox f (n + 1) x - pexiderDyadicApprox f n x‖ ≤
      (3 * ε / 8) * ((1 / 4 : ℝ) ^ n) := by
  rw [pexiderDyadic_succ_sub, norm_smul, norm_inv, norm_pow]
  have h4 : ‖(4 : ℝ)‖ = 4 := by norm_num
  rw [h4]
  calc
    ((4 : ℝ) ^ (n + 1))⁻¹ *
        ‖f ((2 : ℝ) • ((2 : ℝ) ^ n • x)) - (4 : ℝ) • f ((2 : ℝ) ^ n • x)‖ ≤
        ((4 : ℝ) ^ (n + 1))⁻¹ * (3 * ε / 2) := by
      gcongr
      exact norm_f_double_sub_four hf0 hg0 h _
    _ = (3 * ε / 8) * ((1 / 4 : ℝ) ^ n) := by
      rw [← inv_pow]
      norm_num
      ring

variable [CompleteSpace Y]

omit [CompleteSpace Y] in
lemma pexiderDyadic_cauchy (hf0 : f 0 = 0) (hg0 : g 0 = 0)
    (h : IsApproximatePexiderQuadratic f g ε) (x : X) :
    CauchySeq (fun n => pexiderDyadicApprox f n x) := by
  apply SeminormedAddCommGroup.cauchySeq_of_le_geometric
    (r := (1 / 4 : ℝ)) (C := 3 * ε / 8) (by norm_num)
  intro n
  simpa [dist_eq_norm, norm_sub_rev] using
    pexiderDyadic_step_norm_le hf0 hg0 h n x

noncomputable def pexiderDyadicLimit (q : X → Y) (x : X) : Y :=
  Filter.limUnder Filter.atTop (fun n => pexiderDyadicApprox q n x)

lemma pexiderDyadicLimit_tendsto (hf0 : f 0 = 0) (hg0 : g 0 = 0)
    (h : IsApproximatePexiderQuadratic f g ε) (x : X) :
    Filter.Tendsto (fun n => pexiderDyadicApprox f n x) Filter.atTop
      (nhds (pexiderDyadicLimit f x)) :=
  (pexiderDyadic_cauchy hf0 hg0 h x).tendsto_limUnder

lemma norm_f_sub_pexiderDyadicLimit_le (hf0 : f 0 = 0) (hg0 : g 0 = 0)
    (h : IsApproximatePexiderQuadratic f g ε) (x : X) :
    ‖f x - pexiderDyadicLimit f x‖ ≤ ε / 2 := by
  have hbound : ∀ n : ℕ,
      dist (pexiderDyadicApprox f n x) (pexiderDyadicApprox f (n + 1) x) ≤
        (3 * ε / 8) * ((1 / 4 : ℝ) ^ n) := by
    intro n
    rw [dist_eq_norm, norm_sub_rev]
    exact pexiderDyadic_step_norm_le hf0 hg0 h n x
  have hd := dist_le_of_le_geometric_of_tendsto₀
    (r := (1 / 4 : ℝ)) (C := 3 * ε / 8) (by norm_num)
    hbound (pexiderDyadicLimit_tendsto hf0 hg0 h x)
  rw [dist_eq_norm] at hd
  have hd' : ‖f x - pexiderDyadicLimit f x‖ ≤
      (3 * ε / 8) / (1 - (1 / 4 : ℝ)) := by
    simpa [pexiderDyadicApprox] using hd
  calc
    ‖f x - pexiderDyadicLimit f x‖ ≤ (3 * ε / 8) / (1 - (1 / 4 : ℝ)) := hd'
    _ = ε / 2 := by ring

/-- The ordinary quadratic defect on an additive domain. -/
def additiveQuadraticDefect (q : X → Y) (x y : X) : Y :=
  q (x + y) + q (x - y) - (2 : ℝ) • q x - (2 : ℝ) • q y

/-- A uniform bound for the ordinary quadratic defect on an additive domain. -/
def IsApproximateAdditiveQuadratic (q : X → Y) (δ : ℝ) : Prop :=
  ∀ x y, ‖additiveQuadraticDefect q x y‖ ≤ δ

/-- The quadratic equation on an additive domain. -/
def IsAdditiveQuadratic (q : X → Y) : Prop :=
  ∀ x y, additiveQuadraticDefect q x y = 0

omit [CompleteSpace Y] in
/-- The original Pexider estimate and its diagonal bound control the ordinary
quadratic defect of `f`. -/
lemma isApproximateAdditiveQuadratic_of_pexider (hf0 : f 0 = 0)
    (h : IsApproximatePexiderQuadratic f g ε) :
    IsApproximateAdditiveQuadratic f (2 * ε) := by
  intro x y
  let u := x + y
  let v := x - y
  have hu : (2 : ℝ)⁻¹ • (u + v) = x := by
    dsimp [u, v]
    module
  have hv : (2 : ℝ)⁻¹ • (u - v) = y := by
    dsimp [u, v]
    module
  have heq : additiveQuadraticDefect f x y =
      (f u - g u) + (f v - g v) - quadraticPexiderDefect f g u v := by
    simp only [additiveQuadraticDefect, quadraticPexiderDefect, hu, hv]
    dsimp [u, v]
    module
  have hfu : ‖f u - g u‖ ≤ ε / 2 := by
    simpa [norm_sub_rev] using norm_g_sub_f_le_half hf0 h u
  have hfv : ‖f v - g v‖ ≤ ε / 2 := by
    simpa [norm_sub_rev] using norm_g_sub_f_le_half hf0 h v
  rw [heq]
  calc
    ‖(f u - g u) + (f v - g v) - quadraticPexiderDefect f g u v‖ ≤
        ‖(f u - g u) + (f v - g v)‖ + ‖quadraticPexiderDefect f g u v‖ :=
      norm_sub_le _ _
    _ ≤ (ε / 2 + ε / 2) + ε :=
      add_le_add (norm_add_le _ _ |>.trans (add_le_add hfu hfv)) (h u v)
    _ = 2 * ε := by ring

omit [CompleteSpace Y] in
lemma additiveQuadraticDefect_pexiderDyadicApprox (q : X → Y) (n : ℕ) (x y : X) :
    additiveQuadraticDefect (pexiderDyadicApprox q n) x y =
      ((4 : ℝ) ^ n)⁻¹ •
        additiveQuadraticDefect q ((2 : ℝ) ^ n • x) ((2 : ℝ) ^ n • y) := by
  simp only [additiveQuadraticDefect, pexiderDyadicApprox, smul_add, smul_sub, smul_smul]
  module

omit [CompleteSpace Y] in
lemma additiveQuadraticDefect_pexiderDyadicApprox_norm_le (hf0 : f 0 = 0)
    (h : IsApproximatePexiderQuadratic f g ε) (n : ℕ) (x y : X) :
    ‖additiveQuadraticDefect (pexiderDyadicApprox f n) x y‖ ≤
      (2 * ε) * ((1 / 4 : ℝ) ^ n) := by
  rw [additiveQuadraticDefect_pexiderDyadicApprox, norm_smul, norm_inv, norm_pow]
  have h4 : ‖(4 : ℝ)‖ = 4 := by norm_num
  rw [h4]
  calc
    ((4 : ℝ) ^ n)⁻¹ *
        ‖additiveQuadraticDefect f ((2 : ℝ) ^ n • x) ((2 : ℝ) ^ n • y)‖ ≤
        ((4 : ℝ) ^ n)⁻¹ * (2 * ε) := by
      gcongr
      exact isApproximateAdditiveQuadratic_of_pexider hf0 h _ _
    _ = (2 * ε) * ((1 / 4 : ℝ) ^ n) := by
      rw [← inv_pow]
      norm_num
      ring

lemma additiveQuadraticDefect_pexiderDyadicApprox_tendsto
    (hf0 : f 0 = 0) (hg0 : g 0 = 0)
    (h : IsApproximatePexiderQuadratic f g ε) (x y : X) :
    Filter.Tendsto
      (fun n => additiveQuadraticDefect (pexiderDyadicApprox f n) x y)
      Filter.atTop (nhds (additiveQuadraticDefect (pexiderDyadicLimit f) x y)) := by
  unfold additiveQuadraticDefect
  simpa only [sub_add_eq_sub_sub] using
    ((pexiderDyadicLimit_tendsto hf0 hg0 h (x + y)).add
      (pexiderDyadicLimit_tendsto hf0 hg0 h (x - y))).sub
        (((pexiderDyadicLimit_tendsto hf0 hg0 h x).const_smul 2).add
          ((pexiderDyadicLimit_tendsto hf0 hg0 h y).const_smul 2))

lemma isAdditiveQuadratic_pexiderDyadicLimit (hf0 : f 0 = 0) (hg0 : g 0 = 0)
    (h : IsApproximatePexiderQuadratic f g ε) :
    IsAdditiveQuadratic (pexiderDyadicLimit f) := by
  intro x y
  have ht := additiveQuadraticDefect_pexiderDyadicApprox_tendsto hf0 hg0 h x y
  have hp : Filter.Tendsto (fun n : ℕ => (1 / 4 : ℝ) ^ n) Filter.atTop (nhds 0) :=
    tendsto_pow_atTop_nhds_zero_of_lt_one (by norm_num) (by norm_num)
  have hz : Filter.Tendsto
      (fun n => ‖additiveQuadraticDefect (pexiderDyadicApprox f n) x y‖)
      Filter.atTop (nhds 0) := by
    refine squeeze_zero' (Filter.Eventually.of_forall (fun n => norm_nonneg _))
      (Filter.Eventually.of_forall (fun n =>
        additiveQuadraticDefect_pexiderDyadicApprox_norm_le hf0 h n x y)) ?_
    simpa using hp.const_mul (2 * ε)
  have hnorm := ht.norm
  have heq : ‖additiveQuadraticDefect (pexiderDyadicLimit f) x y‖ = 0 :=
    tendsto_nhds_unique hnorm hz
  exact norm_eq_zero.mp heq

def IsExactPexiderQuadratic (f g : X → Y) : Prop :=
  ∀ x y, quadraticPexiderDefect f g x y = 0

omit [CompleteSpace Y] in
lemma exact_pexiderQuadratic_normalized_eq (f g : X → Y)
    (hf0 : f 0 = 0) (_hg0 : g 0 = 0) (h : IsExactPexiderQuadratic f g) :
    f = g := by
  funext x
  have hx := h x x
  have hhalf : (2 : ℝ)⁻¹ • (x + x) = x := by module
  have hzero : (2 : ℝ)⁻¹ • (x - x) = 0 := by simp
  have heq : quadraticPexiderDefect f g x x = (2 : ℝ) • (f x - g x) := by
    simp only [quadraticPexiderDefect, hhalf, hzero, hf0, smul_zero, add_zero]
    module
  rw [heq] at hx
  have hfg : f x - g x = 0 := (smul_eq_zero.mp hx).resolve_left (by norm_num)
  exact sub_eq_zero.mp hfg

omit [CompleteSpace Y] in
lemma exact_pexiderQuadratic_normalized_quadratic (f g : X → Y)
    (hf0 : f 0 = 0) (hg0 : g 0 = 0) (h : IsExactPexiderQuadratic f g) :
    IsAdditiveQuadratic f := by
  have hfg : f = g := exact_pexiderQuadratic_normalized_eq f g hf0 hg0 h
  intro x y
  have hxy := h (x + y) (x - y)
  have hu : (2 : ℝ)⁻¹ • ((x + y) + (x - y)) = x := by module
  have hv : (2 : ℝ)⁻¹ • ((x + y) - (x - y)) = y := by module
  simp only [quadraticPexiderDefect, hu, hv] at hxy
  rw [← hfg] at hxy
  have heq : (2 : ℝ) • f x + (2 : ℝ) • f y = f (x + y) + f (x - y) := by
    apply sub_eq_zero.mp
    simpa only [← sub_add_eq_sub_sub] using hxy
  rw [additiveQuadraticDefect, ← heq]
  abel

/-- Normalized Pexider quadratic stability over real normed spaces with a
complete target: the same quadratic map approximates `f` within `ε / 2` and
`g` within `ε`. -/
theorem exists_quadratic_approx_of_pexiderQuadratic
    (f g : X → Y) {ε : ℝ} (hf0 : f 0 = 0) (hg0 : g 0 = 0)
    (h : IsApproximatePexiderQuadratic f g ε) :
    ∃ Q : X → Y,
      (∀ x y, Q (x + y) + Q (x - y) = (2 : ℝ) • Q x + (2 : ℝ) • Q y) ∧
      (∀ x, ‖f x - Q x‖ ≤ ε / 2) ∧ (∀ x, ‖g x - Q x‖ ≤ ε) := by
  refine ⟨pexiderDyadicLimit f, ?_,
    norm_f_sub_pexiderDyadicLimit_le hf0 hg0 h, ?_⟩
  · intro x y
    have hz := isAdditiveQuadratic_pexiderDyadicLimit hf0 hg0 h x y
    rw [additiveQuadraticDefect, sub_sub] at hz
    exact sub_eq_zero.mp hz
  · intro x
    calc
      ‖g x - pexiderDyadicLimit f x‖ =
          ‖(g x - f x) + (f x - pexiderDyadicLimit f x)‖ := by
        congr 1
        abel
      _ ≤ ‖g x - f x‖ + ‖f x - pexiderDyadicLimit f x‖ := norm_add_le _ _
      _ ≤ ε / 2 + ε / 2 :=
        add_le_add (norm_g_sub_f_le_half hf0 h x)
          (norm_f_sub_pexiderDyadicLimit_le hf0 hg0 h x)
      _ = ε := by ring

end FunctionalEquationStability

end
