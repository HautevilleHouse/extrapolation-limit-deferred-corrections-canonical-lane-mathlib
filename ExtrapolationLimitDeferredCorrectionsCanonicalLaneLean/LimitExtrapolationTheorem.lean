import canonicalLaneMathlib.AdmissibleClass
import ExtrapolationLimitDeferredCorrectionsCanonicalLaneLean.ExtrapolationStep

namespace HautevilleHouse
namespace ExtrapolationLimitDeferredCorrectionsCanonicalLaneLean

structure LimitExtrapolationTheorem where
  baseSequence : Type u → Type v
  extrapolatedLimit : Type w
  errorBound : Prop
  theoremValidity : Prop

structure LimitExtrapolationTheoremEvidence (L : LimitExtrapolationTheorem) where
  errorBoundClosed : L.errorBound
  theoremValidityClosed : L.theoremValidity

def LimitExtrapolationTheoremClosed (L : LimitExtrapolationTheorem) : Prop :=
  L.errorBound ∧ L.theoremValidity

theorem limit_extrapolation_theorem_closed_from_evidence
    (L : LimitExtrapolationTheorem) (Ev : LimitExtrapolationTheoremEvidence L) :
    LimitExtrapolationTheoremClosed L := by
  exact And.intro Ev.errorBoundClosed Ev.theoremValidityClosed

end ExtrapolationLimitDeferredCorrectionsCanonicalLaneLean
end HautevilleHouse
