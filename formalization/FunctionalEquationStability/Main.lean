import FunctionalEquationStability.CyclicAveraging
import Mathlib.Tactic.NormNum

noncomputable section

variable {G X : Type*} [Group G] [NormedAddCommGroup X] [NormedSpace ℝ X]

namespace FunctionalEquationStability

def torsionNorms (q : G → X) : Set ℝ :=
  {r | ∃ x, IsOfFinOrder x ∧ r = ‖q x‖}

omit [NormedSpace ℝ X] in
lemma torsionNorms_nonempty (q : G → X) : (torsionNorms q).Nonempty := by
  exact ⟨‖q 1‖, 1, IsOfFinOrder.one, rfl⟩

theorem norm_le_cyclic_defect_average (q : G → X) (φ : G → G → ℝ)
    (h : ∀ u v, ‖quadraticDefect q u v‖ ≤ φ u v)
    {x : G} (hx : IsOfFinOrder x) :
    ‖q x‖ ≤
      (∑ k ∈ Finset.range (orderOf x), φ (x ^ (k + 1)) x) /
        (2 * (orderOf x : ℝ)) := by
  have hsum : ‖∑ k ∈ Finset.range (orderOf x),
      quadraticDefect q (x ^ (k + 1)) x‖ ≤
      ∑ k ∈ Finset.range (orderOf x), φ (x ^ (k + 1)) x := by
    calc
      ‖∑ k ∈ Finset.range (orderOf x), quadraticDefect q (x ^ (k + 1)) x‖ ≤
          ∑ k ∈ Finset.range (orderOf x), ‖quadraticDefect q (x ^ (k + 1)) x‖ :=
        norm_sum_le _ _
      _ ≤ ∑ k ∈ Finset.range (orderOf x), φ (x ^ (k + 1)) x :=
        Finset.sum_le_sum fun k _ => h _ _
  rw [sum_quadraticDefect_pow_succ q hx] at hsum
  have hn : (0 : ℝ) < orderOf x := by exact_mod_cast hx.orderOf_pos
  have hnorm : (2 : ℝ) * ((orderOf x : ℝ) * ‖q x‖) ≤
      ∑ k ∈ Finset.range (orderOf x), φ (x ^ (k + 1)) x := by
    simpa [norm_smul, Real.norm_eq_abs, abs_of_nonneg hn.le] using hsum
  apply (le_div_iff₀ (mul_pos (by norm_num : (0 : ℝ) < 2) hn)).mpr
  calc
    ‖q x‖ * (2 * (orderOf x : ℝ)) = 2 * ((orderOf x : ℝ) * ‖q x‖) := by ring
    _ ≤ ∑ k ∈ Finset.range (orderOf x), φ (x ^ (k + 1)) x := hnorm

theorem norm_le_half_of_isOfFinOrder (q : G → X) {ε : ℝ}
    (_hε : 0 ≤ ε) (h : IsApproximateQuadratic q ε) {x : G} (hx : IsOfFinOrder x) :
    ‖q x‖ ≤ ε / 2 := by
  have hb := norm_le_cyclic_defect_average q (fun _ _ => ε) h hx
  have hb' : ‖q x‖ ≤ (orderOf x : ℝ) * ε / (2 * (orderOf x : ℝ)) := by
    simpa using hb
  have hn : (0 : ℝ) < orderOf x := by exact_mod_cast hx.orderOf_pos
  calc
    ‖q x‖ ≤ (orderOf x : ℝ) * ε / (2 * (orderOf x : ℝ)) := hb'
    _ = ε / 2 := by field_simp [hn.ne']

theorem sSup_torsionNorms_le_half (q : G → X) {ε : ℝ}
    (hε : 0 ≤ ε) (h : IsApproximateQuadratic q ε) :
    sSup (torsionNorms q) ≤ ε / 2 := by
  apply csSup_le (torsionNorms_nonempty q)
  rintro r ⟨x, hx, rfl⟩
  exact norm_le_half_of_isOfFinOrder q hε h hx

theorem norm_le_half_of_periodic (q : G → X) {ε : ℝ}
    (hper : ∀ x : G, IsOfFinOrder x) (hε : 0 ≤ ε)
    (h : IsApproximateQuadratic q ε) (x : G) : ‖q x‖ ≤ ε / 2 :=
  norm_le_half_of_isOfFinOrder q hε h (hper x)

theorem eq_zero_of_isQuadratic_of_isOfFinOrder (q : G → X)
    (hq : IsQuadratic q) {x : G} (hx : IsOfFinOrder x) : q x = 0 := by
  have h : IsApproximateQuadratic q 0 := by
    intro y z
    simp [hq y z]
  have hb := norm_le_half_of_isOfFinOrder q le_rfl h hx
  simpa using hb

theorem eq_zero_of_isQuadratic_of_periodic (q : G → X)
    (hper : ∀ x : G, IsOfFinOrder x) (hq : IsQuadratic q) : q = 0 := by
  funext x
  exact eq_zero_of_isQuadratic_of_isOfFinOrder q hq (hper x)

end FunctionalEquationStability

end
