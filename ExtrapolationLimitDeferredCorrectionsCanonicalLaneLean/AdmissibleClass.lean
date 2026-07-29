import ExtrapolationLimitDeferredCorrectionsCanonicalLaneLean.MathlibObjects

namespace HautevilleHouse
namespace ExtrapolationLimitDeferredCorrectionsCanonicalLaneLean

structure AdmissibleClass where
  object : ExtrapolationAdmittedObject
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def admittedClosure (A : AdmissibleClass) : Prop :=
  ExtrapolationWitnessClosed A.object ∧ (A.endpointSatisfied ∨ A.remainderRecorded)

end ExtrapolationLimitDeferredCorrectionsCanonicalLaneLean
end HautevilleHouse