import FunctionalEquationStability.Main
import Mathlib.Tactic.NormNum

noncomputable section

variable {G X : Type*} [Group G] [NormedAddCommGroup X] [NormedSpace ℝ X]

namespace FunctionalEquationStability

def constantApproximateQuadratic (ε : ℝ) (u : X) : G → X :=
  fun _ => (ε / 2) • u

lemma constantApproximateQuadratic_isApproximate {ε : ℝ} (hε : 0 ≤ ε)
    {u : X} (hu : ‖u‖ = 1) :
    IsApproximateQuadratic (constantApproximateQuadratic (G := G) ε u) ε := by
  intro x y
  have hdef : quadraticDefect (constantApproximateQuadratic ε u) x y = -ε • u := by
    simp only [quadraticDefect, constantApproximateQuadratic, smul_smul]
    module
  rw [hdef, norm_smul, norm_neg, Real.norm_eq_abs, abs_of_nonneg hε, hu, mul_one]

lemma constantApproximateQuadratic_norm_one {ε : ℝ} (hε : 0 ≤ ε)
    {u : X} (hu : ‖u‖ = 1) :
    ‖constantApproximateQuadratic ε u (1 : G)‖ = ε / 2 := by
  simp [constantApproximateQuadratic, norm_smul, Real.norm_eq_abs, abs_of_nonneg hε, hu]

end FunctionalEquationStability

end
