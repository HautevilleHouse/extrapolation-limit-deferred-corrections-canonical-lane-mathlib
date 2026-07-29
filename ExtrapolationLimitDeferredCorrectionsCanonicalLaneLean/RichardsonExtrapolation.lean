import canonicalLaneMathlib.AdmissibleClass

/-!
# Richardson Extrapolation

This module defines Richardson extrapolation for the limit theory.
-/

namespace HautevilleHouse
namespace ExtrapolationLimitDeferredCorrectionsCanonicalLaneLean

structure RichardsonExtrapolationPackage where
  sequenceType : Type u
  stepSizes : List Nat
  extrapolationTable : Type v
  limitEstimate : Type w
  orderIncreased : Prop
  errorReduced : Prop
  asymptoticExpansion : Prop

structure RichardsonExtrapolationEvidence (R : RichardsonExtrapolationPackage) where
  orderIncreasedClosed : R.orderIncreased
  errorReducedClosed : R.errorReduced
  asymptoticExpansionClosed : R.asymptoticExpansion

def RichardsonExtrapolationClosed (R : RichardsonExtrapolationPackage) : Prop :=
  R.orderIncreased ∧ R.errorReduced ∧ R.asymptoticExpansion

theorem richardson_extrapolation_closed_from_evidence (R : RichardsonExtrapolationPackage) (Ev : RichardsonExtrapolationEvidence R) :
    RichardsonExtrapolationClosed R := by
  exact And.intro Ev.orderIncreasedClosed (And.intro Ev.errorReducedClosed Ev.asymptoticExpansionClosed)

end ExtrapolationLimitDeferredCorrectionsCanonicalLaneLean
end HautevilleHouse