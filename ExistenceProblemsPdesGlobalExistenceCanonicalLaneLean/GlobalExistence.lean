import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ExistenceProblemsPdesGlobalExistenceCanonicalLaneLean

structure GlobalExistence (X : Type) [TopologicalSpace X] (A : NonlinearOperator X X) where
  initialCondition : X
  timeDomain : Set ℝ
  flowMap : ℝ → X → X
  localExistence : Prop
  blowupCriterion : Prop
  globalBounds : Prop

structure GlobalExistenceEvidence (X : Type) [TopologicalSpace X] (A : NonlinearOperator X X)
    (E : GlobalExistence X A) where
  localExistenceClosed : E.localExistence
  blowupCriterionClosed : E.blowupCriterion
  globalBoundsClosed : E.globalBounds

def GlobalExistenceClosed (X : Type) [TopologicalSpace X] (A : NonlinearOperator X X)
    (E : GlobalExistence X A) : Prop :=
  E.localExistence ∧ E.blowupCriterion ∧ E.globalBounds

theorem global_existence_closed_from_evidence (X : Type) [TopologicalSpace X] (A : NonlinearOperator X X)
    (E : GlobalExistence X A) (Ev : GlobalExistenceEvidence X A E) : GlobalExistenceClosed X A E := by
  exact And.intro Ev.localExistenceClosed (And.intro Ev.blowupCriterionClosed Ev.globalBoundsClosed)

end ExistenceProblemsPdesGlobalExistenceCanonicalLaneLean
end HautevilleHouse