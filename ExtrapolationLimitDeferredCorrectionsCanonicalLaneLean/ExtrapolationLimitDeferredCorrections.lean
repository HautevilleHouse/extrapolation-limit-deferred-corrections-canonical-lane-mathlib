import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ExtrapolationLimitDeferredCorrectionsCanonicalLaneLean

structure ExtrapolationLimitDefinedCorrectionsPackage where
  baseScheme : Type u
  correctionOperator : baseScheme → baseScheme
  discretizationParameter : ℕ
  consistencyOrder : ℕ
  limitExists : Prop
  correctionsConverge : Prop

def ExtrapolationLimitClosed (E : ExtrapolationLimitDefinedCorrectionsPackage) : Prop :=
  E.limitExists ∧ E.correctionsConverge

end ExtrapolationLimitDeferredCorrectionsCanonicalLaneLean
end HautevilleHouse