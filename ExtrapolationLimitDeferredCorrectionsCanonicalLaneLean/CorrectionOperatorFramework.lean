import ExtrapolationLimitDeferredCorrectionsCanonicalLaneLean.AdmissibleClass

/-!
# Correction Operator Framework Package
-/

namespace HautevilleHouse
namespace ExtrapolationLimitDeferredCorrectionsCanonicalLaneLean

structure CorrectionOperatorPackage {G : DeferredCorrectionScheme} where
  discreteOperator : Prop
  stabilityEstimate : Prop
  consistencyOrder : ℕ
  asymptoticExpansion : Prop

structure CorrectionOperatorEvidence {G : DeferredCorrectionScheme} (C : CorrectionOperatorPackage G) where
  discreteOperatorClosed : C.discreteOperator
  stabilityEstimateClosed : C.stabilityEstimate
  asymptoticExpansionClosed : C.asymptoticExpansion

def CorrectionOperatorClosed {G : DeferredCorrectionScheme} (C : CorrectionOperatorPackage G) : Prop :=
  C.discreteOperator ∧ C.stabilityEstimate ∧ C.asymptoticExpansion

theorem correction_operator_closed_from_evidence
    {G : DeferredCorrectionScheme} (C : CorrectionOperatorPackage G) (E : CorrectionOperatorEvidence C) :
    CorrectionOperatorClosed C := by
  exact And.intro E.discreteOperatorClosed (And.intro E.stabilityEstimateClosed E.asymptoticExpansionClosed)

end ExtrapolationLimitDeferredCorrectionsCanonicalLaneLean
end HautevilleHouse