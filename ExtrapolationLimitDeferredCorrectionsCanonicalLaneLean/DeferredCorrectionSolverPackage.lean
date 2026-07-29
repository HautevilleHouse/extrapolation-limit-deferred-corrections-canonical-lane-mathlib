import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ExtrapolationLimitDeferredCorrectionsCanonicalLaneLean

structure DeferredCorrectionSolverPackage where
  baseSolver : Type u
  correctionLoop : Type v
  residualEquation : Type w
  linearSolver : Type x
  defectOperator : Prop
  multigridPreconditioner : Prop
  newtonUpdate : Prop
  residualTolerance : Prop
  iterationStoppingCriterion : Prop

structure DeferredCorrectionSolverEvidence (D : DeferredCorrectionSolverPackage) where
  defectOperatorClosed : D.defectOperator
  multigridPreconditionerClosed : D.multigridPreconditioner
  newtonUpdateClosed : D.newtonUpdate
  residualToleranceClosed : D.residualTolerance
  iterationStoppingCriterionClosed : D.iterationStoppingCriterion

def DeferredCorrectionSolverClosed (D : DeferredCorrectionSolverPackage) : Prop :=
  D.defectOperator ∧ D.multigridPreconditioner ∧
  D.newtonUpdate ∧ D.residualTolerance ∧ D.iterationStoppingCriterion

theorem deferred_correction_solver_closed_from_evidence
    (D : DeferredCorrectionSolverPackage) (E : DeferredCorrectionSolverEvidence D) :
    DeferredCorrectionSolverClosed D := by
  exact And.intro E.defectOperatorClosed
    (And.intro E.multigridPreconditionerClosed
      (And.intro E.newtonUpdateClosed
        (And.intro E.residualToleranceClosed E.iterationStoppingCriterionClosed)))

end ExtrapolationLimitDeferredCorrectionsCanonicalLaneLean
end HautevilleHouse