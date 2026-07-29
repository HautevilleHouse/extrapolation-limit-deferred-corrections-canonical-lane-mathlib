import ExtrapolationLimitDeferredCorrectionsCanonicalLaneLean.RichardsonExtrapolation

namespace HautevilleHouse
namespace ExtrapolationLimitDeferredCorrectionsCanonicalLaneLean

structure CompactExtrapolationScheme where
  compactOperator : (ℕ → ℝ) → (ℕ → ℝ)
  fixedPoint : ℕ → ℝ
  attractivityRadius : ℝ
  contractionFactor : ℝ

def compactExtrapolationLimit (C : CompactExtrapolationScheme) (start : ℕ → ℝ) : ℕ → ℝ :=
  Nat.rec start (λ n s => C.compactOperator s)

theorem compact_extrapolation_converges (C : CompactExtrapolationScheme) (h : 0 ≤ C.contractionFactor ∧ C.contractionFactor < 1) :
  ∀ (start : ℕ → ℝ), ∃ (lim : ℕ → ℝ),
    ∀ (ε : ℝ) (hε : 0 < ε), ∃ (N : ℕ), ∀ (n : ℕ) (hn : N ≤ n),
      |compactExtrapolationLimit C start n - lim n| < ε := by
  intro start
  refine ⟨fun n => C.fixedPoint n, λ ε hε => ⟨0, λ n hn => ?_⟩⟩
  sorry

end ExtrapolationLimitDeferredCorrectionsCanonicalLaneLean
end HautevilleHouse