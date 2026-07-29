import ExtrapolationLimitDeferredCorrectionsCanonicalLaneLean.ConvergenceAccelerationPackage

/-!
# Discretization Error Analysis Package
-/

namespace HautevilleHouse
namespace ExtrapolationLimitDeferredCorrectionsCanonicalLaneLean

structure DiscretizationErrorPackage {G : DeferredCorrectionScheme}
    {C : CorrectionOperatorPackage G} {A : ConvergenceAccelerationPackage C} where
  errorExpansion : ℕ → ℝ
  regularityAssumption : Prop
  errorBound : Prop
  extrapolationGain : ℕ → ℝ

structure DiscretizationErrorEvidence {G : DeferredCorrectionScheme}
    {C : CorrectionOperatorPackage G} {A : ConvergenceAccelerationPackage C}
    (D : DiscretizationErrorPackage G C A) where
  errorBoundClosed : D.errorBound
  extrapolationGainStrict : ∀ n, D.extrapolationGain n > 0

def DiscretizationErrorClosed {G : DeferredCorrectionScheme}
    {C : CorrectionOperatorPackage G} {A : ConvergenceAccelerationPackage C}
    (D : DiscretizationErrorPackage G C A) : Prop :=
  D.errorBound ∧ (∀ n, D.extrapolationGain n > 0)

theorem discretization_error_closed_from_evidence
    {G : DeferredCorrectionScheme} {C : CorrectionOperatorPackage G}
    {A : ConvergenceAccelerationPackage C} (D : DiscretizationErrorPackage G C A)
    (E : DiscretizationErrorEvidence D) : DiscretizationErrorClosed D := by
  exact And.intro E.errorBoundClosed E.extrapolationGainStrict

end ExtrapolationLimitDeferredCorrectionsCanonicalLaneLean
end HautevilleHouse