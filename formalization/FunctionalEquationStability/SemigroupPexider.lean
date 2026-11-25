import Mathlib.Analysis.Normed.Group.Ultra
import Mathlib.Algebra.BigOperators.Group.Finset.Basic
import Mathlib.Tactic.Abel

noncomputable section

namespace FunctionalEquationStability

variable {X : Type*} [NormedAddCommGroup X] [IsUltrametricDist X]

def pexiderDefect (f g h : ℕ → X) (s t : ℕ) : X :=
  f (s + t) - g s - h t

def IsApproximatePexider (f g h : ℕ → X) (ε : ℝ) : Prop :=
  ∀ s t, ‖pexiderDefect f g h s t‖ ≤ ε

def IsExactPexider (f g h : ℕ → X) : Prop :=
  ∀ s t, f (s + t) = g s + h t

lemma ultra_norm_add_le {a b : X} {ε : ℝ}
    (ha : ‖a‖ ≤ ε) (hb : ‖b‖ ≤ ε) : ‖a + b‖ ≤ ε := by
  calc
    ‖a + b‖ ≤ max ‖a‖ ‖b‖ := IsUltrametricDist.norm_add_le_max a b
    _ ≤ ε := max_le ha hb

lemma ultra_norm_sub_le {a b : X} {ε : ℝ}
    (ha : ‖a‖ ≤ ε) (hb : ‖b‖ ≤ ε) : ‖a - b‖ ≤ ε := by
  have hb' : ‖-b‖ ≤ ε := by simpa using hb
  simpa only [sub_eq_add_neg] using ultra_norm_add_le ha hb'

lemma ultra_norm_sum_le {ι : Type*} (s : Finset ι) (v : ι → X) {ε : ℝ}
    (hε : 0 ≤ ε) (hv : ∀ i ∈ s, ‖v i‖ ≤ ε) : ‖∑ i ∈ s, v i‖ ≤ ε := by
  classical
  induction s using Finset.induction_on with
  | empty => simpa using hε
  | @insert a s ha ih =>
      rw [Finset.sum_insert ha]
      apply ultra_norm_add_le
      · exact hv a (Finset.mem_insert_self _ _)
      · exact ih fun i hi => hv i (Finset.mem_insert_of_mem hi)

lemma cauchy_deviation_le (Φ : ℕ → X) {ε : ℝ}
    (hdef : ∀ s t, ‖Φ (s + t) - Φ s - Φ t‖ ≤ ε)
    (hzero : ‖Φ 0‖ ≤ ε) (n : ℕ) :
    ‖Φ n - n • Φ 1‖ ≤ ε := by
  induction n with
  | zero => simpa using hzero
  | succ n ih =>
      have heq : Φ (n + 1) - (n + 1) • Φ 1 =
          (Φ (n + 1) - Φ n - Φ 1) + (Φ n - n • Φ 1) := by
        simp only [succ_nsmul]
        abel
      rw [heq]
      exact ultra_norm_add_le (hdef n 1) ih

def normalizedF (f : ℕ → X) (a b : X) (n : ℕ) : X := f n - a - b

def normalizedG (g : ℕ → X) (a : X) (n : ℕ) : X := g n - a

def normalizedH (h : ℕ → X) (b : X) (n : ℕ) : X := h n - b

omit [IsUltrametricDist X] in
lemma normalized_pexiderDefect (f g h : ℕ → X) (s t : ℕ) :
    pexiderDefect (normalizedF f (g 0) (h 0))
      (normalizedG g (g 0)) (normalizedH h (h 0)) s t =
      pexiderDefect f g h s t := by
  simp only [pexiderDefect, normalizedF, normalizedG, normalizedH]
  abel

omit [IsUltrametricDist X] in
lemma normalized_cauchyDefect (f g h : ℕ → X) (s t : ℕ) :
    normalizedF f (g 0) (h 0) (s + t) -
        normalizedF f (g 0) (h 0) s - normalizedF f (g 0) (h 0) t =
      pexiderDefect f g h s t - pexiderDefect f g h s 0 - pexiderDefect f g h 0 t := by
  simp only [pexiderDefect, normalizedF, add_zero, zero_add]
  abel

lemma normalized_cauchy_bound (f g h : ℕ → X) {ε : ℝ}
    (happrox : IsApproximatePexider f g h ε) (s t : ℕ) :
    ‖normalizedF f (g 0) (h 0) (s + t) -
      normalizedF f (g 0) (h 0) s - normalizedF f (g 0) (h 0) t‖ ≤ ε := by
  rw [normalized_cauchyDefect]
  exact ultra_norm_sub_le (ultra_norm_sub_le (happrox s t) (happrox s 0))
    (happrox 0 t)

theorem approximate_pexider_nat_zero (f g h : ℕ → X) {ε : ℝ}
    (_hε : 0 ≤ ε) (happrox : IsApproximatePexider f g h ε) :
    ∃ (F G H : ℕ → X) (u a b : X),
      IsExactPexider F G H ∧
      (∀ n, G n = n • u + a) ∧
      (∀ n, H n = n • u + b) ∧
      (∀ n, F n = n • u + a + b) ∧
      (∀ n, ‖f n - F n‖ ≤ ε) ∧
      (∀ n, ‖g n - G n‖ ≤ ε) ∧
      (∀ n, ‖h n - H n‖ ≤ ε) := by
  let a := g 0
  let b := h 0
  let F₀ := normalizedF f a b
  let G₀ := normalizedG g a
  let H₀ := normalizedH h b
  let u := F₀ 1
  let F : ℕ → X := fun n => n • u + a + b
  let G : ℕ → X := fun n => n • u + a
  let H : ℕ → X := fun n => n • u + b
  have hFdef : ∀ s t, ‖F₀ (s + t) - F₀ s - F₀ t‖ ≤ ε := by
    intro s t
    exact normalized_cauchy_bound f g h happrox s t
  have hFzero : ‖F₀ 0‖ ≤ ε := by
    have hh := happrox 0 0
    simpa [F₀, normalizedF, pexiderDefect, a, b] using hh
  have hdev : ∀ n, ‖F₀ n - n • u‖ ≤ ε := by
    intro n
    exact cauchy_deviation_le F₀ hFdef hFzero n
  refine ⟨F, G, H, u, a, b, ?_, ?_, ?_, ?_, ?_, ?_, ?_⟩
  · intro s t
    simp only [F, G, H]
    rw [add_nsmul]
    abel
  · intro n
    rfl
  · intro n
    rfl
  · intro n
    rfl
  · intro n
    have hh := hdev n
    have heq : f n - (n • u + a + b) = F₀ n - n • u := by
      dsimp [F, F₀, normalizedF]
      abel
    rw [heq]
    exact hh
  · intro n
    have hr := happrox n 0
    have hh := ultra_norm_sub_le (hdev n) hr
    have heq : g n - (n • u + a) =
        F₀ n - n • u - pexiderDefect f g h n 0 := by
      dsimp [F₀, normalizedF, pexiderDefect, a, b]
      abel
    rw [heq]
    exact hh
  · intro n
    have hr := happrox 0 n
    have hh := ultra_norm_sub_le (hdev n) hr
    have heq : h n - (n • u + b) =
        F₀ n - n • u - pexiderDefect f g h 0 n := by
      dsimp [F₀, normalizedF, pexiderDefect, a, b]
      abel
    rw [heq]
    exact hh

def IsApproximatePositivePexider (f g h : ℕ → X) (ε : ℝ) : Prop :=
  ∀ s t, ‖f (s + t + 2) - g (s + 1) - h (t + 1)‖ ≤ ε

def IsExactPositivePexider (f g h : ℕ → X) : Prop :=
  ∀ s t, f (s + t + 2) = g (s + 1) + h (t + 1)

theorem approximate_pexider_nat_positive (f g h : ℕ → X) {ε : ℝ}
    (happrox : IsApproximatePositivePexider f g h ε) :
    ∃ (F G H : ℕ → X) (u a b : X),
      IsExactPositivePexider F G H ∧
      F 1 = f 1 ∧
      (∀ n, G (n + 1) = n • u + a) ∧
      (∀ n, H (n + 1) = n • u + b) ∧
      (∀ n, F (n + 2) = n • u + a + b) ∧
      (∀ n, ‖g (n + 1) - G (n + 1)‖ ≤ ε) ∧
      (∀ n, ‖h (n + 1) - H (n + 1)‖ ≤ ε) ∧
      (∀ n, ‖f (n + 2) - F (n + 2)‖ ≤ ε) := by
  let fS : ℕ → X := fun n => f (n + 2)
  let gS : ℕ → X := fun n => g (n + 1)
  let hS : ℕ → X := fun n => h (n + 1)
  have happroxS : IsApproximatePexider fS gS hS ε := by
    intro s t
    simpa [pexiderDefect, fS, gS, hS, Nat.add_assoc] using happrox s t
  have hε : 0 ≤ ε := (norm_nonneg _).trans (happroxS 0 0)
  obtain ⟨FS, GS, HS, u, a, b, hExact, hG, hH, hF, hf, hg, hh⟩ :=
    approximate_pexider_nat_zero fS gS hS hε happroxS
  let F : ℕ → X := fun n => if n = 1 then f 1 else FS (n - 2)
  let G : ℕ → X := fun n => if n = 0 then 0 else GS (n - 1)
  let H : ℕ → X := fun n => if n = 0 then 0 else HS (n - 1)
  refine ⟨F, G, H, u, a, b, ?_, ?_, ?_, ?_, ?_, ?_, ?_, ?_⟩
  · intro s t
    dsimp [F, G, H]
    have hst' : s + t + 2 - 2 = s + t := by omega
    rw [hst']
    exact hExact s t
  · rfl
  · intro n
    simpa [G] using hG n
  · intro n
    simpa [H] using hH n
  · intro n
    simpa [F] using hF n
  · intro n
    simpa [G, gS] using hg n
  · intro n
    simpa [H, hS] using hh n
  · intro n
    simpa [F, fS] using hf n

omit [IsUltrametricDist X] in
lemma approximatePexider_zero_of_exact (f g h : ℕ → X)
    (hexact : IsExactPexider f g h) : IsApproximatePexider f g h 0 := by
  intro s t
  simp [pexiderDefect, hexact s t]

theorem exact_pexider_nat_zero_structure (f g h : ℕ → X)
    (hexact : IsExactPexider f g h) :
    ∃ u a b : X,
      (∀ n, f n = n • u + a + b) ∧
      (∀ n, g n = n • u + a) ∧
      (∀ n, h n = n • u + b) := by
  obtain ⟨F, G, H, u, a, b, _, hG, hH, hF, hf, hg, hh⟩ :=
    approximate_pexider_nat_zero f g h le_rfl (approximatePexider_zero_of_exact f g h hexact)
  refine ⟨u, a, b, ?_, ?_, ?_⟩
  · intro n
    have heq : f n = F n := by
      have hn := hf n
      have hz : ‖f n - F n‖ = 0 := le_antisymm hn (norm_nonneg _)
      exact sub_eq_zero.mp (norm_eq_zero.mp hz)
    rw [heq]
    exact hF n
  · intro n
    have heq : g n = G n := by
      have hn := hg n
      have hz : ‖g n - G n‖ = 0 := le_antisymm hn (norm_nonneg _)
      exact sub_eq_zero.mp (norm_eq_zero.mp hz)
    rw [heq]
    exact hG n
  · intro n
    have heq : h n = H n := by
      have hn := hh n
      have hz : ‖h n - H n‖ = 0 := le_antisymm hn (norm_nonneg _)
      exact sub_eq_zero.mp (norm_eq_zero.mp hz)
    rw [heq]
    exact hH n

omit [IsUltrametricDist X] in
lemma approximatePositivePexider_zero_of_exact (f g h : ℕ → X)
    (hexact : IsExactPositivePexider f g h) : IsApproximatePositivePexider f g h 0 := by
  intro s t
  simp [hexact s t]

theorem exact_pexider_nat_positive_structure (f g h : ℕ → X)
    (hexact : IsExactPositivePexider f g h) :
    ∃ u a b : X,
      (∀ n, g (n + 1) = n • u + a) ∧
      (∀ n, h (n + 1) = n • u + b) ∧
      (∀ n, f (n + 2) = n • u + a + b) := by
  have happrox := approximatePositivePexider_zero_of_exact f g h hexact
  have hε : 0 ≤ (0 : ℝ) := le_rfl
  obtain ⟨F, G, H, u, a, b, _, _, hG, hH, hF, hg, hh, hf⟩ :=
    approximate_pexider_nat_positive f g h happrox
  refine ⟨u, a, b, ?_, ?_, ?_⟩
  · intro n
    have hn := hg n
    have hz : ‖g (n + 1) - G (n + 1)‖ = 0 := le_antisymm hn (norm_nonneg _)
    have heq : g (n + 1) = G (n + 1) := sub_eq_zero.mp (norm_eq_zero.mp hz)
    rw [heq]
    exact hG n
  · intro n
    have hn := hh n
    have hz : ‖h (n + 1) - H (n + 1)‖ = 0 := le_antisymm hn (norm_nonneg _)
    have heq : h (n + 1) = H (n + 1) := sub_eq_zero.mp (norm_eq_zero.mp hz)
    rw [heq]
    exact hH n
  · intro n
    have hn := hf n
    have hz : ‖f (n + 2) - F (n + 2)‖ = 0 := le_antisymm hn (norm_nonneg _)
    have heq : f (n + 2) = F (n + 2) := sub_eq_zero.mp (norm_eq_zero.mp hz)
    rw [heq]
    exact hF n

end FunctionalEquationStability

end
