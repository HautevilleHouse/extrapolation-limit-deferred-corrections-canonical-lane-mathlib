import canonicalLaneMathlib.AdmissibleClass
import ExtrapolationLimitDeferredCorrectionsCanonicalLaneLean.ExtrapolationLimitModel

namespace HautevilleHouse
namespace ExtrapolationLimitDeferredCorrectionsCanonicalLaneLean

structure DeferredCorrectionPackage (A : AdmissibleClass) (M : ExtrapolationLimitModel A) where
  residualEstimate : Prop
  correctionSchedule : Nat → Prop
  convergenceAccelerated : Prop
  residualEstimateClosed : residualEstimate
  correctionScheduleClosed : correctionSchedule 0 ∧ (∀ n, correctionSchedule n → correctionSchedule (n+1))
  convergenceAcceleratedClosed : convergenceAccelerated

def DeferredCorrectionPackageClosed (A : AdmissibleClass) (M : ExtrapolationLimitModel A) (D : DeferredCorrectionPackage A M) : Prop :=
  D.residualEstimate ∧ D.correctionSchedule 0 ∧ (∀ n, D.correctionSchedule n → D.correctionSchedule (n+1)) ∧ D.convergenceAccelerated

theorem deferred_correction_package_closed (A : AdmissibleClass) (M : ExtrapolationLimitModel A) (D : DeferredCorrectionPackage A M) : DeferredCorrectionPackageClosed A M D :=
  And.intro D.residualEstimateClosed (And.intro (And.intro (D.correctionScheduleClosed.1) (D.correctionScheduleClosed.2)) D.convergenceAcceleratedClosed)

end ExtrapolationLimitDeferredCorrectionsCanonicalLaneLean
end HautevilleHouse