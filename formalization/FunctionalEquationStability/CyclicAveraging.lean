import FunctionalEquationStability.Definitions
import Mathlib.Algebra.BigOperators.Group.Finset.Defs
import Mathlib.Tactic.Module

noncomputable section

variable {G X : Type*} [Group G] [NormedAddCommGroup X] [NormedSpace ℝ X]

namespace FunctionalEquationStability

omit [NormedSpace ℝ X] in
lemma sum_pow_add_eq_sum_pow {x : G} (hx : IsOfFinOrder x) (m : ℕ) (f : G → X) :
    ∑ k ∈ Finset.range (orderOf x), f (x ^ (k + m)) =
      ∑ k ∈ Finset.range (orderOf x), f (x ^ k) := by
  let n := orderOf x
  letI : NeZero n := ⟨Nat.ne_of_gt hx.orderOf_pos⟩
  let e : Fin n ≃ Fin n := Equiv.addRight (⟨m % n, Nat.mod_lt _ hx.orderOf_pos⟩ : Fin n)
  have hval (i : Fin n) : (e i : ℕ) = (i.val + m) % n := by
    simp [e, Fin.val_add]
  calc
    ∑ k ∈ Finset.range n, f (x ^ (k + m)) =
        ∑ i : Fin n, f (x ^ (i.val + m)) :=
      (Fin.sum_univ_eq_sum_range (fun k => f (x ^ (k + m))) n).symm
    _ = ∑ i : Fin n, f (x ^ (e i : ℕ)) := by
      apply Fintype.sum_congr (fun i : Fin n => f (x ^ (i.val + m)))
      intro i
      rw [hval, pow_mod_orderOf]
    _ = ∑ i : Fin n, f (x ^ (i.val : ℕ)) :=
      Equiv.sum_comp e (fun i : Fin n => f (x ^ (i.val : ℕ)))
    _ = ∑ k ∈ Finset.range n, f (x ^ k) :=
      Fin.sum_univ_eq_sum_range (fun k => f (x ^ k)) n

lemma quadraticDefect_pow_succ (q : G → X) (x : G) (k : ℕ) :
    quadraticDefect q (x ^ (k + 1)) x =
      q (x ^ (k + 2)) + q (x ^ k) - (2 : ℝ) • q (x ^ (k + 1)) - (2 : ℝ) • q x := by
  simp [quadraticDefect, pow_succ, mul_assoc]

lemma sum_quadraticDefect_pow_succ (q : G → X) {x : G} (hx : IsOfFinOrder x) :
    ∑ k ∈ Finset.range (orderOf x), quadraticDefect q (x ^ (k + 1)) x =
      -((2 : ℝ) • ((orderOf x : ℝ) • q x)) := by
  simp_rw [quadraticDefect_pow_succ]
  simp only [Finset.sum_add_distrib, Finset.sum_sub_distrib, ← Finset.smul_sum]
  rw [sum_pow_add_eq_sum_pow hx 2 q, sum_pow_add_eq_sum_pow hx 1 q]
  simp only [Finset.sum_const, Finset.card_range]
  module

end FunctionalEquationStability

end
