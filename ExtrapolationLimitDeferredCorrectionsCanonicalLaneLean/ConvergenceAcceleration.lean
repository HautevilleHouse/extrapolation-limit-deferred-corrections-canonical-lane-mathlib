import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ExtrapolationLimitDeferredCorrectionsCanonicalLaneLean

structure ConvergenceAccelerationOperator where
  order : ℕ
  weightVector : Type u
  operatorValidity : Prop

structure ConvergenceAccelerationOperatorEvidence (C : ConvergenceAccelerationOperator) where
  operatorValidityClosed : C.operatorValidity

def ConvergenceAccelerationOperatorClosed (C : ConvergenceAccelerationOperator) : Prop :=
  C.operatorValidity

theorem convergence_acceleration_operator_closed_from_evidence
    (C : ConvergenceAccelerationOperator) (Ev : ConvergenceAccelerationOperatorEvidence C) :
    ConvergenceAccelerationOperatorClosed C := by
  exact Ev.operatorValidityClosed

end ExtrapolationLimitDeferredCorrectionsCanonicalLaneLean
end HautevilleHouse
