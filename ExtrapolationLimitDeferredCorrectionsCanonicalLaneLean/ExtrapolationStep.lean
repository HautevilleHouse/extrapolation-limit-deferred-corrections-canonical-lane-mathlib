import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ExtrapolationLimitDeferredCorrectionsCanonicalLaneLean

structure ExtrapolationStep where
  currentApproximation : Type u
  correctionOperator : Type v
  extrapolationDelta : Type w
  stepValidity : Prop

structure ExtrapolationStepEvidence (E : ExtrapolationStep) where
  stepValidityClosed : E.stepValidity

def ExtrapolationStepClosed (E : ExtrapolationStep) : Prop :=
  E.stepValidity

theorem extrapolation_step_closed_from_evidence (E : ExtrapolationStep) (Ev : ExtrapolationStepEvidence E) :
    ExtrapolationStepClosed E := by
  exact Ev.stepValidityClosed

end ExtrapolationLimitDeferredCorrectionsCanonicalLaneLean
end HautevilleHouse
