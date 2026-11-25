import Mathlib.Analysis.Complex.Basic
import Mathlib.Analysis.SpecialFunctions.Sqrt
import Mathlib.Tactic.Ring

noncomputable section

namespace FunctionalEquationStability

variable {G : Type*} [Group G]

def sineLaw (f g : G → ℂ) : Prop :=
  ∀ x y, f (x * y) = f x * g y + g x * f y

def cosineSineDefect (f g h : G → ℂ) (x y : G) : ℂ :=
  f (x * y) - f x * g y - g x * f y - h x * h y

lemma cosineSine_branch_defect (f₀ g₀ : G → ℂ) (h₀ : sineLaw f₀ g₀)
    (lam : ℂ) (b : G → ℂ) (x y : G) :
    cosineSineDefect f₀
      (fun z => g₀ z - (lam ^ 2 / 2) * f₀ z - lam * b z)
      (fun z => lam * f₀ z + b z) x y = -(b x * b y) := by
  unfold cosineSineDefect
  rw [h₀ x y]
  ring

lemma cosineSine_branch_bound (f₀ g₀ : G → ℂ) (h₀ : sineLaw f₀ g₀)
    (lam : ℂ) (b : G → ℂ) {δ : ℝ} (_hδ : 0 ≤ δ)
    (hdef : ∀ x y, ‖cosineSineDefect f₀
      (fun z => g₀ z - (lam ^ 2 / 2) * f₀ z - lam * b z)
      (fun z => lam * f₀ z + b z) x y‖ ≤ δ) (x : G) :
    ‖b x‖ ≤ Real.sqrt δ := by
  have hx := hdef x x
  rw [cosineSine_branch_defect f₀ g₀ h₀ lam b x x] at hx
  have hsq : ‖b x‖ ^ 2 ≤ δ := by
    simpa [norm_mul, norm_neg, pow_two] using hx
  exact Real.le_sqrt_of_sq_le hsq

end FunctionalEquationStability

end
