import ExtrapolationLimitDeferredCorrectionsCanonicalLaneLean.ExtrapolationLimitCore
import Mathlib.Topology.Basic

namespace HautevilleHouse
namespace ExtrapolationLimitDeferredCorrectionsCanonicalLaneLean

structure ExtrapolationSpace where
  carrier : Type
  topology : TopologicalSpace carrier

structure ExtrapolationAdmittedObject where
  space : ExtrapolationSpace
  sequenceSpace : Type
  limitPoint : carrier
  convergenceWitness : Prop
  conclusion : convergenceWitness

def ExtrapolationWitnessClosed (O : ExtrapolationAdmittedObject) : Prop :=
  O.convergenceWitness

end ExtrapolationLimitDeferredCorrectionsCanonicalLaneLean
end HautevilleHouse