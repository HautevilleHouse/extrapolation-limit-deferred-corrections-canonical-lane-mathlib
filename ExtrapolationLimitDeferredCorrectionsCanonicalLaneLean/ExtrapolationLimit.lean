import canonicalLaneMathlib.AdmissibleClass

/-!
# Extrapolation Limit Deferred Corrections

This module defines the core structures for extrapolation limit and deferred correction methods.
-/

namespace HautevilleHouse
namespace ExtrapolationLimitDeferredCorrectionsCanonicalLaneLean

structure ExtrapolationLimitPackage where
  baseMethod : Type u
  extrapolationOrders : List Nat
  limitExists : Prop
  limitValue : Type v
  convergenceRate : Prop
  deferredCorrection : Type w
  correctionApplied : Prop
  stability : Prop

structure ExtrapolationLimitEvidence (E : ExtrapolationLimitPackage) where
  limitExistsClosed : E.limitExists
  convergenceRateClosed : E.convergenceRate
  correctionAppliedClosed : E.correctionApplied
  stabilityClosed : E.stability

def ExtrapolationLimitClosed (E : ExtrapolationLimitPackage) : Prop :=
  E.limitExists ∧ E.convergenceRate ∧ E.correctionApplied ∧ E.stability

theorem extrapolation_limit_closed_from_evidence (E : ExtrapolationLimitPackage) (Ev : ExtrapolationLimitEvidence E) :
    ExtrapolationLimitClosed E := by
  exact And.intro Ev.limitExistsClosed (And.intro Ev.convergenceRateClosed (And.intro Ev.correctionAppliedClosed Ev.stabilityClosed))

end ExtrapolationLimitDeferredCorrectionsCanonicalLaneLean
end HautevilleHouse