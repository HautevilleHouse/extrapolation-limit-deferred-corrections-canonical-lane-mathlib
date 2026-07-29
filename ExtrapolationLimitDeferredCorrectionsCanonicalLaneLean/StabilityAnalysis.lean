import canonicalLaneMathlib.AdmissibleClass
import ExtrapolationLimitDeferredCorrectionsCanonicalLaneLean.ExtrapolationLimitModel

namespace HautevilleHouse
namespace ExtrapolationLimitDeferredCorrectionsCanonicalLaneLean

structure StabilityAnalysisPackage (A : AdmissibleClass) (M : ExtrapolationLimitModel A) where
  perturbationBound : Prop
  stabilityMargin : Prop
  perturbationBoundClosed : perturbationBound
  stabilityMarginClosed : stabilityMargin

def StabilityAnalysisPackageClosed (A : AdmissibleClass) (M : ExtrapolationLimitModel A) (S : StabilityAnalysisPackage A M) : Prop :=
  S.perturbationBound ∧ S.stabilityMargin

theorem stability_analysis_closed (A : AdmissibleClass) (M : ExtrapolationLimitModel A) (S : StabilityAnalysisPackage A M) : StabilityAnalysisPackageClosed A M S :=
  And.intro S.perturbationBoundClosed S.stabilityMarginClosed

end ExtrapolationLimitDeferredCorrectionsCanonicalLaneLean
end HautevilleHouse