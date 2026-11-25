import FunctionalEquationStability.PexiderQuadraticBanach

noncomputable section

namespace FunctionalEquationStability

/-- The first sharpness example: its nonzero values exceed `x²` by `1/2`. -/
def f (x : ℝ) : ℝ :=
  if x = 0 then 0 else x ^ 2 + 1 / 2

/-- The second sharpness example: its nonzero values exceed `x²` by `1`. -/
def g (x : ℝ) : ℝ :=
  if x = 0 then 0 else x ^ 2 + 1

lemma quadratic_zero (Q : ℝ → ℝ)
    (hQ : ∀ x y, Q (x + y) + Q (x - y) = 2 * Q x + 2 * Q y) :
    Q 0 = 0 := by
  have h := hQ 0 0
  simp only [add_zero, sub_zero] at h
  linarith

/-- On the natural numbers, every real quadratic map is determined by `Q 1`. -/
lemma quadratic_nat (Q : ℝ → ℝ)
    (hQ : ∀ x y, Q (x + y) + Q (x - y) = 2 * Q x + 2 * Q y)
    (n : ℕ) : Q (n : ℝ) = (n : ℝ) ^ 2 * Q 1 := by
  induction n using Nat.strong_induction_on with
  | ind n ih =>
    rcases n with _ | n
    · simp [quadratic_zero Q hQ]
    · rcases n with _ | n
      · simp
      · have hn := ih n (by omega)
        have hn1 := ih (n + 1) (by omega)
        have h := hQ ((n + 1 : ℕ) : ℝ) 1
        have hadd : ((n + 1 : ℕ) : ℝ) + 1 = ((n + 2 : ℕ) : ℝ) := by
          norm_cast
        have hsub : ((n + 1 : ℕ) : ℝ) - 1 = (n : ℝ) := by
          push_cast
          ring
        rw [hadd, hsub] at h
        push_cast at hn hn1 h ⊢
        have htwo : (n : ℝ) + 1 + 1 = (n : ℝ) + 2 := by ring
        rw [htwo] at ⊢
        nlinarith

/-- A positive quadratic multiple eventually exceeds any real threshold. -/
lemma exists_nat_sq_mul_gt {c d : ℝ} (hd : 0 < d) :
    ∃ n : ℕ, n ≠ 0 ∧ c < (n : ℝ) ^ 2 * d := by
  obtain ⟨N, hN⟩ := exists_nat_gt (max (c / d) 1)
  refine ⟨N + 1, by omega, ?_⟩
  have hsucc : (N : ℝ) < ((N + 1 : ℕ) : ℝ) := by
    exact_mod_cast Nat.lt_succ_self N
  have hn1 : (1 : ℝ) < ((N + 1 : ℕ) : ℝ) :=
    (max_lt_iff.mp hN).2.trans hsucc
  have hdiv : c / d < ((N + 1 : ℕ) : ℝ) :=
    (max_lt_iff.mp hN).1.trans hsucc
  have hlin : c < ((N + 1 : ℕ) : ℝ) * d := (div_lt_iff₀ hd).mp hdiv
  have hsq : ((N + 1 : ℕ) : ℝ) < ((N + 1 : ℕ) : ℝ) ^ 2 := by
    nlinarith [sq_nonneg (((N + 1 : ℕ) : ℝ) - 1)]
  have hprod : 0 < d * (((N + 1 : ℕ) : ℝ) ^ 2 - ((N + 1 : ℕ) : ℝ)) :=
    mul_pos hd (sub_pos.mpr hsq)
  nlinarith

/-- A nonzero constant offset above `x²` cannot be uniformly approximated
on the nonzero natural numbers by a quadratic map. -/
lemma not_quadratic_approx_of_offset (Q : ℝ → ℝ)
    (hQ : ∀ x y, Q (x + y) + Q (x - y) = 2 * Q x + 2 * Q y)
    {c ε : ℝ} (hc : 0 ≤ c) (hεc : ε ≤ c)
    (h : ∀ n : ℕ, n ≠ 0 → |(n : ℝ) ^ 2 + c - Q (n : ℝ)| < ε) : False := by
  by_cases ha : Q 1 = 1
  · have h1 := h 1 (by norm_num)
    norm_num at h1
    rw [ha] at h1
    norm_num at h1
    rw [abs_of_nonneg hc] at h1
    linarith
  · have hd : 0 < |1 - Q 1| := abs_pos.mpr (sub_ne_zero.mpr (Ne.symm ha))
    obtain ⟨n, hn, hlarge⟩ := exists_nat_sq_mul_gt (c := ε + c) hd
    have hbound := h n hn
    have heq : (n : ℝ) ^ 2 + c - Q (n : ℝ) =
        c + (n : ℝ) ^ 2 * (1 - Q 1) := by
      nlinarith [quadratic_nat Q hQ n]
    rw [heq] at hbound
    have hreverse := abs_sub_le ((n : ℝ) ^ 2 * (1 - Q 1))
      (c + (n : ℝ) ^ 2 * (1 - Q 1)) 0
    have hcancel : (n : ℝ) ^ 2 * (1 - Q 1) -
        (c + (n : ℝ) ^ 2 * (1 - Q 1)) = -c := by ring
    rw [hcancel, abs_neg, abs_of_nonneg hc] at hreverse
    simp only [sub_zero] at hreverse
    rw [abs_mul, abs_of_nonneg (sq_nonneg (n : ℝ))] at hreverse
    linarith

/-- The error constant `1/2` is sharp for approximating `f` by quadratics. -/
theorem f_sharpness (Q : ℝ → ℝ)
    (hQ : ∀ x y, Q (x + y) + Q (x - y) = 2 * Q x + 2 * Q y) :
    ¬ ∀ n : ℕ, |f n - Q n| < (1 / 2 : ℝ) := by
  intro h
  apply not_quadratic_approx_of_offset Q hQ (c := 1 / 2) (ε := 1 / 2)
    (by norm_num) (by norm_num)
  intro n hn
  simpa [f, hn] using h n

/-- The error constant `1` is sharp for approximating `g` by quadratics. -/
theorem g_sharpness (Q : ℝ → ℝ)
    (hQ : ∀ x y, Q (x + y) + Q (x - y) = 2 * Q x + 2 * Q y) :
    ¬ ∀ n : ℕ, |g n - Q n| < (1 : ℝ) := by
  intro h
  apply not_quadratic_approx_of_offset Q hQ (c := 1) (ε := 1)
    (by norm_num) (by norm_num)
  intro n hn
  simpa [g, hn] using h n

lemma quadratic_double (Q : ℝ → ℝ)
    (hQ : ∀ x y, Q (x + y) + Q (x - y) = 2 * Q x + 2 * Q y) (x : ℝ) :
    Q (2 * x) = 4 * Q x := by
  have h := hQ x x
  have htwo : x + x = 2 * x := by ring
  rw [htwo, sub_self, quadratic_zero Q hQ] at h
  nlinarith

lemma quadratic_pow_two (Q : ℝ → ℝ)
    (hQ : ∀ x y, Q (x + y) + Q (x - y) = 2 * Q x + 2 * Q y)
    (n : ℕ) (x : ℝ) :
    Q ((2 : ℝ) ^ n * x) = (4 : ℝ) ^ n * Q x := by
  induction n with
  | zero => simp
  | succ n ih =>
      rw [pow_succ, pow_succ]
      have htwo : (2 : ℝ) ^ n * 2 * x = 2 * ((2 : ℝ) ^ n * x) := by ring
      rw [htwo, quadratic_double Q hQ, ih]
      ring

lemma quadratic_unique_of_bounded (Q₁ Q₂ : ℝ → ℝ)
    (hQ₁ : ∀ x y, Q₁ (x + y) + Q₁ (x - y) = 2 * Q₁ x + 2 * Q₁ y)
    (hQ₂ : ∀ x y, Q₂ (x + y) + Q₂ (x - y) = 2 * Q₂ x + 2 * Q₂ y)
    {C : ℝ} (_hC : 0 ≤ C) (hbound : ∀ x, |Q₁ x - Q₂ x| ≤ C) :
    Q₁ = Q₂ := by
  let H : ℝ → ℝ := fun x => Q₁ x - Q₂ x
  have hH : ∀ x y, H (x + y) + H (x - y) = 2 * H x + 2 * H y := by
    intro x y
    dsimp [H]
    nlinarith [hQ₁ x y, hQ₂ x y]
  have hpow := quadratic_pow_two H hH
  have hp : Filter.Tendsto (fun n : ℕ => ((4 : ℝ) ^ n)⁻¹ * C) Filter.atTop (nhds 0) := by
    have hz : Filter.Tendsto (fun n : ℕ => (1 / 4 : ℝ) ^ n) Filter.atTop (nhds 0) :=
      tendsto_pow_atTop_nhds_zero_of_lt_one (by norm_num) (by norm_num)
    simpa [inv_pow, mul_comm, mul_zero] using hz.const_mul C
  funext x
  have hconst : Filter.Tendsto (fun _n : ℕ => H x) Filter.atTop (nhds (H x)) :=
    tendsto_const_nhds
  have hseq : Filter.Tendsto (fun n : ℕ => ((4 : ℝ) ^ n)⁻¹ * H ((2 : ℝ) ^ n * x))
      Filter.atTop (nhds (H x)) := by
    convert hconst using 1
    funext n
    rw [hpow n x]
    field_simp
  have hnorm : Filter.Tendsto (fun n : ℕ => ‖((4 : ℝ) ^ n)⁻¹ * H ((2 : ℝ) ^ n * x)‖)
      Filter.atTop (nhds 0) := by
    refine squeeze_zero' (Filter.Eventually.of_forall (fun n => norm_nonneg _)) ?_ hp
    filter_upwards [] with n
    rw [norm_mul, norm_inv, norm_pow]
    have h4 : ‖(4 : ℝ)‖ = 4 := by norm_num
    rw [h4]
    exact mul_le_mul_of_nonneg_left (hbound ((2 : ℝ) ^ n * x)) (by positivity)
  have hzero := tendsto_nhds_unique hseq.norm hnorm
  apply sub_eq_zero.mp
  simpa [H, Real.norm_eq_abs] using hzero

end FunctionalEquationStability

end
