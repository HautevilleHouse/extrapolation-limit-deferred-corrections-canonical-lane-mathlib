import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ExtrapolationLimitDeferredCorrectionsCanonicalLaneLean

def ConstrainedExtrapolationClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_extrapolation_endgame (A : AdmissibleClass) :
    ConstrainedExtrapolationClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end ExtrapolationLimitDeferredCorrectionsCanonicalLaneLean
end HautevilleHouse