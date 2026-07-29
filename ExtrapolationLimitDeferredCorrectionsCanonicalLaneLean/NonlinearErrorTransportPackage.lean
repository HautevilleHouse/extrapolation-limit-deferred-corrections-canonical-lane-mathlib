import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.ExtrapolationLimitDeferredCorrectionsCanonicalLaneLean.ExtrapolationADERPackage

namespace HautevilleHouse
namespace ExtrapolationLimitDeferredCorrectionsCanonicalLaneLean

structure NonlinearErrorTransportPackage {A : ADERPackage} where
  adjointOperator : Type u
  sensitivityMatrix : Type v
  errorAccumulation : Prop
  errorEvolutionOperator : Prop
  stiffnessWeightedNorm : Prop
  globalErrorBound : Prop
  perturbationStability : Prop

structure NonlinearErrorTransportEvidence {A : ADERPackage}
    (N : NonlinearErrorTransportPackage A) where
  errorAccumulationClosed : N.errorAccumulation
  errorEvolutionOperatorClosed : N.errorEvolutionOperator
  stiffnessWeightedNormClosed : N.stiffnessWeightedNorm
  globalErrorBoundClosed : N.globalErrorBound
  perturbationStabilityClosed : N.perturbationStability

def NonlinearErrorTransportClosed {A : ADERPackage}
    (N : NonlinearErrorTransportPackage A) : Prop :=
  N.errorAccumulation ∧ N.errorEvolutionOperator ∧
  N.stiffnessWeightedNorm ∧ N.globalErrorBound ∧ N.perturbationStability

theorem nonlinear_error_transport_closed_from_evidence
    {A : ADERPackage} (N : NonlinearErrorTransportPackage A)
    (E : NonlinearErrorTransportEvidence N) : NonlinearErrorTransportClosed N := by
  exact And.intro E.errorAccumulationClosed
    (And.intro E.errorEvolutionOperatorClosed
      (And.intro E.stiffnessWeightedNormClosed
        (And.intro E.globalErrorBoundClosed E.perturbationStabilityClosed)))

end ExtrapolationLimitDeferredCorrectionsCanonicalLaneLean
end HautevilleHouse