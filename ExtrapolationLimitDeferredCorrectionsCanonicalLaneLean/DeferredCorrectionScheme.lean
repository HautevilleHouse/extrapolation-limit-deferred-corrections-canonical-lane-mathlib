import canonicalLaneMathlib.AdmissibleClass

/-!
# Deferred Correction Scheme

This module defines deferred correction scheme structures.
-/

namespace HautevilleHouse
namespace ExtrapolationLimitDeferredCorrectionsCanonicalLaneLean

structure DeferredCorrectionScheme where
  baseScheme : Type u
  correctionOrder : Nat
  errorEquation : Prop
  residualComputed : Prop
  updateApplied : Prop
  stability : Prop
  convergenceOrder : Prop

structure DeferredCorrectionEvidence (D : DeferredCorrectionScheme) where
  errorEquationClosed : D.errorEquation
  residualComputedClosed : D.residualComputed
  updateAppliedClosed : D.updateApplied
  stabilityClosed : D.stability

def DeferredCorrectionClosed (D : DeferredCorrectionScheme) : Prop :=
  D.errorEquation ∧ D.residualComputed ∧ D.updateApplied ∧ D.stability

theorem deferred_correction_closed_from_evidence (D : DeferredCorrectionScheme) (Ev : DeferredCorrectionEvidence D) :
    DeferredCorrectionClosed D := by
  exact And.intro Ev.errorEquationClosed (And.intro Ev.residualComputedClosed (And.intro Ev.updateAppliedClosed Ev.stabilityClosed))

end ExtrapolationLimitDeferredCorrectionsCanonicalLaneLean
end HautevilleHouse