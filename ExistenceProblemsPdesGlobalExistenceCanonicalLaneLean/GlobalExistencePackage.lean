import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ExistenceProblemsPdesGlobalExistenceCanonicalLaneLean

structure GlobalExistencePackage where
  pdeSystem : Prop
  initialData : Prop
  globalSolutionExists : Prop
  uniformBounds : Prop
  blowupCriterion : Prop

structure GlobalExistenceEvidence (G : GlobalExistencePackage) where
  pdeSystemClosed : G.pdeSystem
  initialDataClosed : G.initialData
  globalSolutionExistsClosed : G.globalSolutionExists
  uniformBoundsClosed : G.uniformBounds
  blowupCriterionClosed : G.blowupCriterion

def GlobalExistenceClosed (G : GlobalExistencePackage) : Prop := 
  G.pdeSystem ∧ G.initialData ∧ G.globalSolutionExists ∧ G.uniformBounds ∧ G.blowupCriterion

theorem global_existence_closed_from_evidence (G : GlobalExistencePackage) (E : GlobalExistenceEvidence G) :
    GlobalExistenceClosed G := by
  exact And.intro E.pdeSystemClosed (And.intro E.initialDataClosed (And.intro E.globalSolutionExistsClosed (And.intro E.uniformBoundsClosed E.blowupCriterionClosed)))

end ExistenceProblemsPdesGlobalExistenceCanonicalLaneLean
end HautevilleHouse
