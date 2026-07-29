import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.ExtrapolationLimitDeferredCorrectionsCanonicalLaneLean.ExtrapolationADERPackage
import HautevilleHouse.ExtrapolationLimitDeferredCorrectionsCanonicalLaneLean.ExtrapolationLimitConvergence
import HautevilleHouse.ExtrapolationLimitDeferredCorrectionsCanonicalLaneLean.DeferredCorrectionSolverPackage
import HautevilleHouse.ExtrapolationLimitDeferredCorrectionsCanonicalLaneLean.NonlinearErrorTransportPackage

namespace HautevilleHouse
namespace ExtrapolationLimitDeferredCorrectionsCanonicalLaneLean

noncomputable section

def bridgeClosed (A : AdmissibleClass) : Prop :=
  match A.object with
  | ADERPackage => ADERClosed A.object
  | _ => False

def gateClosed (A : AdmissibleClass) : Prop :=
  A.endpointSatisfied ∨ A.remainderRecorded

def ConstrainedExtrapolationLimitClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem bridge_from_admissible_class (A : AdmissibleClass) : bridgeClosed A := by
  unfold bridgeClosed
  -- This is a placeholder assuming the object is ADERPackage
  -- In a full formalization, we would case split on the object
  sorry

theorem gate_from_admissible_class (A : AdmissibleClass) : gateClosed A := by
  exact A.gateWitness

theorem extrapolation_limit_endgame (A : AdmissibleClass) : ConstrainedExtrapolationLimitClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end

end ExtrapolationLimitDeferredCorrectionsCanonicalLaneLean
end HautevilleHouse