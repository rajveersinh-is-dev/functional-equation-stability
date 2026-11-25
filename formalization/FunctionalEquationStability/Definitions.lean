import Mathlib.Analysis.Normed.Module.Basic
import Mathlib.GroupTheory.OrderOfElement

noncomputable section

variable {G X : Type*} [Group G] [NormedAddCommGroup X] [NormedSpace ℝ X]

namespace FunctionalEquationStability

def quadraticDefect (q : G → X) (x y : G) : X :=
  q (x * y) + q (x * y⁻¹) - (2 : ℝ) • q x - (2 : ℝ) • q y

def IsApproximateQuadratic (q : G → X) (ε : ℝ) : Prop :=
  ∀ x y, ‖quadraticDefect q x y‖ ≤ ε

def IsQuadratic (q : G → X) : Prop :=
  ∀ x y, quadraticDefect q x y = 0

end FunctionalEquationStability

end
