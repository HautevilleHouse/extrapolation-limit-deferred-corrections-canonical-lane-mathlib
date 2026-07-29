import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ExtrapolationLimitDeferredCorrectionsCanonicalLaneLean

structure ExtrapolationLimitModel (A : AdmissibleClass) where
  baseExtrapolation : A.object → A.object
  deferredCorrection : A.object → A.object
  limitPoint : A.object
  convergenceRate : Prop
  baseExtrapolationClosed : Prop
  deferredCorrectionClosed : Prop
  limitPointClosed : limitPoint = baseExtrapolation limitPoint
  convergenceRateClosed : convergenceRate

def ExtrapolationLimitModelClosed (A : AdmissibleClass) (M : ExtrapolationLimitModel A) : Prop :=
  M.baseExtrapolationClosed ∧ M.deferredCorrectionClosed ∧ M.limitPointClosed ∧ M.convergenceRateClosed

theorem extrapolation_limit_model_closed (A : AdmissibleClass) (M : ExtrapolationLimitModel A) : ExtrapolationLimitModelClosed A M :=
  And.intro M.baseExtrapolationClosed (And.intro M.deferredCorrectionClosed (And.intro M.limitPointClosed M.convergenceRateClosed))

end ExtrapolationLimitDeferredCorrectionsCanonicalLaneLean
end HautevilleHouse