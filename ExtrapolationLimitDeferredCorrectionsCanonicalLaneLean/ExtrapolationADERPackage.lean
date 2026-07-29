import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ExtrapolationLimitDeferredCorrectionsCanonicalLaneLean

structure ADERPackage where
  timeStep : Type u
  order : Nat
  reconstructionPolynomial : Type v
  taylorExpansion : Type w
  extrapolationCoefficients : Prop
  deferredCorrectionSolver : Prop
  stabilityCondition : Prop
  convergenceOrder : Prop
  initialDataConsistency : Prop

structure ADEREvidence (A : ADERPackage) where
  extrapolationCoefficientsClosed : A.extrapolationCoefficients
  deferredCorrectionSolverClosed : A.deferredCorrectionSolver
  stabilityConditionClosed : A.stabilityCondition
  convergenceOrderClosed : A.convergenceOrder
  initialDataConsistencyClosed : A.initialDataConsistency

def ADERClosed (A : ADERPackage) : Prop :=
  A.extrapolationCoefficients ∧ A.deferredCorrectionSolver ∧
  A.stabilityCondition ∧ A.convergenceOrder ∧ A.initialDataConsistency

theorem ader_closed_from_evidence (A : ADERPackage) (E : ADEREvidence A) : ADERClosed A := by
  exact And.intro E.extrapolationCoefficientsClosed
    (And.intro E.deferredCorrectionSolverClosed
      (And.intro E.stabilityConditionClosed
        (And.intro E.convergenceOrderClosed E.initialDataConsistencyClosed)))

end ExtrapolationLimitDeferredCorrectionsCanonicalLaneLean
end HautevilleHouse