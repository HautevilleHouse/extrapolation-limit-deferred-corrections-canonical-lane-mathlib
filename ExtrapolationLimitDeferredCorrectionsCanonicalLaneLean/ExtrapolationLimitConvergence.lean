import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.ExtrapolationLimitDeferredCorrectionsCanonicalLaneLean.ExtrapolationADERPackage

namespace HautevilleHouse
namespace ExtrapolationLimitDeferredCorrectionsCanonicalLaneLean

structure ExtrapolationLimitConvergencePackage {A : ADERPackage} where
  truncationErrorBound : Prop
  limitAsymptotics : Prop
  superConvergenceRate : Prop
  stiffnessTolerance : Prop
  boundaryLayerHandling : Prop

structure ExtrapolationLimitConvergenceEvidence {A : ADERPackage}
    (C : ExtrapolationLimitConvergencePackage A) where
  truncationErrorBoundClosed : C.truncationErrorBound
  limitAsymptoticsClosed : C.limitAsymptotics
  superConvergenceRateClosed : C.superConvergenceRate
  stiffnessToleranceClosed : C.stiffnessTolerance
  boundaryLayerHandlingClosed : C.boundaryLayerHandling

def ExtrapolationLimitConvergenceClosed {A : ADERPackage}
    (C : ExtrapolationLimitConvergencePackage A) : Prop :=
  C.truncationErrorBound ∧ C.limitAsymptotics ∧
  C.superConvergenceRate ∧ C.stiffnessTolerance ∧ C.boundaryLayerHandling

theorem extrapolation_limit_convergence_closed_from_evidence
    {A : ADERPackage} (C : ExtrapolationLimitConvergencePackage A)
    (E : ExtrapolationLimitConvergenceEvidence C) : ExtrapolationLimitConvergenceClosed C := by
  exact And.intro E.truncationErrorBoundClosed
    (And.intro E.limitAsymptoticsClosed
      (And.intro E.superConvergenceRateClosed
        (And.intro E.stiffnessToleranceClosed E.boundaryLayerHandlingClosed)))

end ExtrapolationLimitDeferredCorrectionsCanonicalLaneLean
end HautevilleHouse