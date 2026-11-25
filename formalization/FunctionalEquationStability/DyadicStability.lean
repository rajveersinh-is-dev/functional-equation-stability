import FunctionalEquationStability.Definitions
import FunctionalEquationStability.Sharpness
import Mathlib.Analysis.SpecificLimits.Normed
import Mathlib.Tactic.FieldSimp
import Mathlib.Tactic.Module
import Mathlib.Tactic.NormNum

noncomputable section

namespace FunctionalEquationStability

variable {G X : Type*} [Group G] [NormedAddCommGroup X] [NormedSpace ℝ X]

def DyadicEventuallyCommuting (G : Type*) [Group G] : Prop :=
  ∀ x y : G, ∃ N : ℕ, ∀ n : ℕ, N ≤ n →
    (x * y) ^ (2 ^ n) = x ^ (2 ^ n) * y ^ (2 ^ n)

def dyadicApprox (q : G → X) (n : ℕ) (x : G) : X :=
  ((4 : ℝ) ^ n)⁻¹ • q (x ^ (2 ^ n))

lemma four_pow_pos (n : ℕ) : (0 : ℝ) < 4 ^ n := by positivity

lemma four_pow_succ_inv_mul (n : ℕ) :
    ((4 : ℝ) ^ (n + 1))⁻¹ * 4 = ((4 : ℝ) ^ n)⁻¹ := by
  rw [pow_succ]
  field_simp

lemma dyadic_succ_sub (q : G → X) (n : ℕ) (x : G) :
    dyadicApprox q (n + 1) x - dyadicApprox q n x =
      ((4 : ℝ) ^ (n + 1))⁻¹ •
        (quadraticDefect q (x ^ (2 ^ n)) (x ^ (2 ^ n)) - q 1) := by
  have hpow : x ^ (2 ^ (n + 1)) = (x ^ (2 ^ n)) ^ 2 := by
    rw [pow_succ, pow_mul]
  have hscalar : ((4 : ℝ) ^ (n + 1))⁻¹ * 2 + ((4 : ℝ) ^ (n + 1))⁻¹ * 2 =
      ((4 : ℝ) ^ n)⁻¹ := by
    nlinarith [four_pow_succ_inv_mul n]
  simp only [dyadicApprox, hpow, quadraticDefect, mul_inv_cancel, pow_two,
    smul_sub, smul_add]
  module

lemma norm_q_one_le_half (q : G → X) {ε : ℝ}
    (h : IsApproximateQuadratic q ε) : ‖q 1‖ ≤ ε / 2 := by
  have hh := h 1 1
  have hdef : quadraticDefect q 1 1 = -(2 : ℝ) • q 1 := by
    simp only [quadraticDefect, mul_one, inv_one]
    module
  rw [hdef] at hh
  have h2 : (2 : ℝ) * ‖q 1‖ ≤ ε := by simpa [norm_smul] using hh
  linarith

lemma dyadic_step_norm_le (q : G → X) {ε : ℝ}
    (h : IsApproximateQuadratic q ε) (n : ℕ) (x : G) :
    ‖dyadicApprox q (n + 1) x - dyadicApprox q n x‖ ≤
      (3 * ε / 2) * ((1 / 4 : ℝ) ^ (n + 1)) := by
  rw [dyadic_succ_sub, norm_smul, norm_inv, norm_pow]
  have h4 : ‖(4 : ℝ)‖ = 4 := by norm_num
  rw [h4]
  have hdef : ‖quadraticDefect q (x ^ (2 ^ n)) (x ^ (2 ^ n)) - q 1‖ ≤
      ε + ‖q 1‖ := by
    exact (norm_sub_le _ _).trans (add_le_add (h _ _) le_rfl)
  have h1 := norm_q_one_le_half q h
  calc
    ((4 : ℝ) ^ (n + 1))⁻¹ *
        ‖quadraticDefect q (x ^ (2 ^ n)) (x ^ (2 ^ n)) - q 1‖ ≤
        ((4 : ℝ) ^ (n + 1))⁻¹ * (ε + ‖q 1‖) := by
      gcongr
    _ ≤ ((4 : ℝ) ^ (n + 1))⁻¹ * (3 * ε / 2) := by
      gcongr
      linarith
    _ = (3 * ε / 2) * ((1 / 4 : ℝ) ^ (n + 1)) := by
      rw [← inv_pow]
      norm_num
      ring

variable [CompleteSpace X]

omit [CompleteSpace X] in
lemma dyadic_step_norm_le' (q : G → X) {ε : ℝ}
    (h : IsApproximateQuadratic q ε) (n : ℕ) (x : G) :
    ‖dyadicApprox q (n + 1) x - dyadicApprox q n x‖ ≤
      (3 * ε / 8) * ((1 / 4 : ℝ) ^ n) := by
  calc
    ‖dyadicApprox q (n + 1) x - dyadicApprox q n x‖ ≤
        (3 * ε / 2) * ((1 / 4 : ℝ) ^ (n + 1)) := dyadic_step_norm_le q h n x
    _ = (3 * ε / 8) * ((1 / 4 : ℝ) ^ n) := by
      rw [pow_succ]
      ring

omit [CompleteSpace X] in
lemma dyadic_cauchy (q : G → X) {ε : ℝ}
    (h : IsApproximateQuadratic q ε) (x : G) :
    CauchySeq (fun n => dyadicApprox q n x) := by
  apply SeminormedAddCommGroup.cauchySeq_of_le_geometric
    (r := (1 / 4 : ℝ)) (C := 3 * ε / 8) (by norm_num)
  intro n
  simpa [dist_eq_norm, norm_sub_rev] using dyadic_step_norm_le' q h n x

noncomputable def dyadicLimit (q : G → X) (x : G) : X :=
  Filter.limUnder Filter.atTop (fun n => dyadicApprox q n x)

lemma dyadicLimit_tendsto (q : G → X) {ε : ℝ}
    (h : IsApproximateQuadratic q ε) (x : G) :
    Filter.Tendsto (fun n => dyadicApprox q n x) Filter.atTop
      (nhds (dyadicLimit q x)) :=
  (dyadic_cauchy q h x).tendsto_limUnder

lemma norm_q_sub_dyadicLimit_le (q : G → X) {ε : ℝ}
    (h : IsApproximateQuadratic q ε) (x : G) :
    ‖q x - dyadicLimit q x‖ ≤ ε / 2 := by
  have hbound : ∀ n : ℕ,
      dist (dyadicApprox q n x) (dyadicApprox q (n + 1) x) ≤
        (3 * ε / 8) * ((1 / 4 : ℝ) ^ n) := by
    intro n
    rw [dist_eq_norm, norm_sub_rev]
    exact dyadic_step_norm_le' q h n x
  have hd := dist_le_of_le_geometric_of_tendsto₀
    (r := (1 / 4 : ℝ)) (C := 3 * ε / 8) (by norm_num)
    hbound (dyadicLimit_tendsto q h x)
  rw [dist_eq_norm] at hd
  have hd' : ‖q x - dyadicLimit q x‖ ≤
      (3 * ε / 8) / (1 - (1 / 4 : ℝ)) := by
    simpa [dyadicApprox] using hd
  calc
    ‖q x - dyadicLimit q x‖ ≤ (3 * ε / 8) / (1 - (1 / 4 : ℝ)) := hd'
    _ = ε / 2 := by ring

omit [CompleteSpace X] in
lemma dyadicApprox_mul_self (q : G → X) (n : ℕ) (x : G) :
    dyadicApprox q n (x * x) = (4 : ℝ) • dyadicApprox q (n + 1) x := by
  have hpow : (x * x) ^ (2 ^ n) = x ^ (2 ^ (n + 1)) := by
    rw [← pow_two x, ← pow_mul, pow_succ]
    congr 1
    ring
  simp only [dyadicApprox, hpow, smul_smul]
  rw [mul_comm, four_pow_succ_inv_mul]

lemma dyadicLimit_mul_self (q : G → X) {ε : ℝ}
    (h : IsApproximateQuadratic q ε) (x : G) :
    dyadicLimit q (x * x) = (4 : ℝ) • dyadicLimit q x := by
  have hleft := dyadicLimit_tendsto q h (x * x)
  have hright : Filter.Tendsto (fun n => (4 : ℝ) • dyadicApprox q (n + 1) x)
      Filter.atTop (nhds ((4 : ℝ) • dyadicLimit q x)) :=
    Filter.Tendsto.smul tendsto_const_nhds
      ((dyadicLimit_tendsto q h x).comp (Filter.tendsto_add_atTop_nat 1))
  apply tendsto_nhds_unique hleft
  simpa only [dyadicApprox_mul_self] using hright

omit [CompleteSpace X] in
lemma quadraticDefect_dyadicApprox (q : G → X) (n : ℕ) (x y : G)
    (hxy : (x * y) ^ (2 ^ n) = x ^ (2 ^ n) * y ^ (2 ^ n))
    (hxyi : (x * y⁻¹) ^ (2 ^ n) = x ^ (2 ^ n) * (y ^ (2 ^ n))⁻¹) :
    quadraticDefect (dyadicApprox q n) x y =
      ((4 : ℝ) ^ n)⁻¹ • quadraticDefect q (x ^ (2 ^ n)) (y ^ (2 ^ n)) := by
  simp only [quadraticDefect, dyadicApprox, hxy, hxyi]
  module

lemma quadraticDefect_dyadicApprox_norm_le (q : G → X) {ε : ℝ}
    (h : IsApproximateQuadratic q ε) (n : ℕ) (x y : G)
    (hxy : (x * y) ^ (2 ^ n) = x ^ (2 ^ n) * y ^ (2 ^ n))
    (hxyi : (x * y⁻¹) ^ (2 ^ n) = x ^ (2 ^ n) * (y ^ (2 ^ n))⁻¹) :
    ‖quadraticDefect (dyadicApprox q n) x y‖ ≤ ε * ((1 / 4 : ℝ) ^ n) := by
  rw [quadraticDefect_dyadicApprox q n x y hxy hxyi, norm_smul, norm_inv, norm_pow]
  have h4 : ‖(4 : ℝ)‖ = 4 := by norm_num
  rw [h4]
  calc
    ((4 : ℝ) ^ n)⁻¹ * ‖quadraticDefect q (x ^ (2 ^ n)) (y ^ (2 ^ n))‖ ≤
        ((4 : ℝ) ^ n)⁻¹ * ε := by
      gcongr
      exact h _ _
    _ = ε * ((1 / 4 : ℝ) ^ n) := by
      rw [← inv_pow]
      norm_num
      ring

lemma quadraticDefect_dyadicApprox_tendsto (q : G → X) {ε : ℝ}
    (h : IsApproximateQuadratic q ε) (x y : G) :
    Filter.Tendsto (fun n => quadraticDefect (dyadicApprox q n) x y)
      Filter.atTop (nhds (quadraticDefect (dyadicLimit q) x y)) := by
  unfold quadraticDefect
  simpa only [sub_add_eq_sub_sub] using
    ((dyadicLimit_tendsto q h (x * y)).add
      (dyadicLimit_tendsto q h (x * y⁻¹))).sub
        (((dyadicLimit_tendsto q h x).const_smul 2).add
          ((dyadicLimit_tendsto q h y).const_smul 2))

theorem isQuadratic_dyadicLimit (q : G → X) {ε : ℝ}
    (h : IsApproximateQuadratic q ε) (hcomm : DyadicEventuallyCommuting G) :
    IsQuadratic (dyadicLimit q) := by
  intro x y
  obtain ⟨N, hN⟩ := hcomm x y
  obtain ⟨N', hN'⟩ := hcomm x y⁻¹
  let k := max N N'
  have hxy : ∀ n : ℕ, k ≤ n →
      (x * y) ^ (2 ^ n) = x ^ (2 ^ n) * y ^ (2 ^ n) := by
    intro n hn
    exact hN n ((le_max_left _ _).trans hn)
  have hxyi : ∀ n : ℕ, k ≤ n →
      (x * y⁻¹) ^ (2 ^ n) = x ^ (2 ^ n) * (y ^ (2 ^ n))⁻¹ := by
    intro n hn
    simpa only [inv_pow] using hN' n ((le_max_right _ _).trans hn)
  have hbound : ∀ n : ℕ, k ≤ n →
      ‖quadraticDefect (dyadicApprox q n) x y‖ ≤ ε * ((1 / 4 : ℝ) ^ n) := by
    intro n hn
    exact quadraticDefect_dyadicApprox_norm_le q h n x y (hxy n hn) (hxyi n hn)
  have ht := quadraticDefect_dyadicApprox_tendsto q h x y
  have hp : Filter.Tendsto (fun n : ℕ => (1 / 4 : ℝ) ^ n) Filter.atTop (nhds 0) :=
    tendsto_pow_atTop_nhds_zero_of_lt_one (by norm_num) (by norm_num)
  have hz : Filter.Tendsto (fun n => ‖quadraticDefect (dyadicApprox q n) x y‖)
      Filter.atTop (nhds 0) := by
    refine squeeze_zero' (Filter.Eventually.of_forall (fun n => norm_nonneg _))
      (Filter.eventually_atTop.mpr ⟨k, hbound⟩) ?_
    simpa using hp.const_mul ε
  have hnorm := ht.norm
  have heq : ‖quadraticDefect (dyadicLimit q) x y‖ = 0 :=
    tendsto_nhds_unique hnorm hz
  exact norm_eq_zero.mp heq

theorem exists_quadratic_approx_of_dyadicEventuallyCommuting
    (q : G → X) {ε : ℝ} (h : IsApproximateQuadratic q ε)
    (hcomm : DyadicEventuallyCommuting G) :
    ∃ Q : G → X, IsQuadratic Q ∧ ∀ x : G, ‖q x - Q x‖ ≤ ε / 2 := by
  refine ⟨dyadicLimit q, isQuadratic_dyadicLimit q h hcomm, ?_⟩
  intro x
  exact norm_q_sub_dyadicLimit_le q h x

omit [CompleteSpace X] in
theorem half_constant_optimal (ε : ℝ) (hε : 0 ≤ ε) {u : X}
    (hu : ‖u‖ = 1) :
    ∃ q : G → X, IsApproximateQuadratic q ε ∧
      ∀ Q : G → X, IsQuadratic Q → ε / 2 ≤ ‖q 1 - Q 1‖ := by
  refine ⟨constantApproximateQuadratic ε u,
    constantApproximateQuadratic_isApproximate hε hu, ?_⟩
  intro Q hQ
  rw [eq_zero_of_isQuadratic_of_isOfFinOrder Q hQ IsOfFinOrder.one,
    sub_zero, constantApproximateQuadratic_norm_one hε hu]

end FunctionalEquationStability

end
