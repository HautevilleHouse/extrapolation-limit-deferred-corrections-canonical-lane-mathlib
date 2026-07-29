import canonicalLaneMathlib.AdmissibleClass
import ExtrapolationLimitDeferredCorrectionsCanonicalLaneLean.LimitExtrapolationTheorem

namespace HautevilleHouse
namespace ExtrapolationLimitDeferredCorrectionsCanonicalLaneLean

structure ErrorAnalysis where
  truncationError : Prop
  roundoffError : Prop
  stabilityMargin : Prop
  analysisValidity : Prop

structure ErrorAnalysisEvidence (E : ErrorAnalysis) where
  truncationErrorClosed : E.truncationError
  roundoffErrorClosed : E.roundoffError
  stabilityMarginClosed : E.stabilityMargin
  analysisValidityClosed : E.analysisValidity

def ErrorAnalysisClosed (E : ErrorAnalysis) : Prop :=
  E.truncationError ∧ E.roundoffError ∧ E.stabilityMargin ∧ E.analysisValidity

theorem error_analysis_closed_from_evidence (E : ErrorAnalysis) (Ev : ErrorAnalysisEvidence E) :
    ErrorAnalysisClosed E := by
  exact And.intro Ev.truncationErrorClosed
    (And.intro Ev.roundoffErrorClosed
      (And.intro Ev.stabilityMarginClosed Ev.analysisValidityClosed))

end ExtrapolationLimitDeferredCorrectionsCanonicalLaneLean
end HautevilleHouse
