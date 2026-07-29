import ExtrapolationLimitDeferredCorrectionsCanonicalLaneLean.CorrectionOperatorFramework

/-!
# Convergence Acceleration Package
-/

namespace HautevilleHouse
namespace ExtrapolationLimitDeferredCorrectionsCanonicalLaneLean

structure ConvergenceAccelerationPackage {G : DeferredCorrectionScheme}
    (C : CorrectionOperatorPackage G) where
  extrapolationLimit : ℕ → ℝ
  convergenceRate : Prop
  limitExistence : Prop
  accelerationFactor : ℝ

structure ConvergenceAccelerationEvidence {G : DeferredCorrectionScheme}
    {C : CorrectionOperatorPackage G} (A : ConvergenceAccelerationPackage C) where
  limitExistenceClosed : A.limitExistence
  convergenceRateClosed : A.convergenceRate

def ConvergenceAccelerationClosed {G : DeferredCorrectionScheme}
    {C : CorrectionOperatorPackage G} (A : ConvergenceAccelerationPackage C) : Prop :=
  A.limitExistence ∧ A.convergenceRate

theorem convergence_acceleration_closed_from_evidence
    {G : DeferredCorrectionScheme} {C : CorrectionOperatorPackage G}
    (A : ConvergenceAccelerationPackage C) (E : ConvergenceAccelerationEvidence A) :
    ConvergenceAccelerationClosed A := by
  exact And.intro E.limitExistenceClosed E.convergenceRateClosed

end ExtrapolationLimitDeferredCorrectionsCanonicalLaneLean
end HautevilleHouse