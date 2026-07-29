import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ExistenceProblemsPdesGlobalExistenceCanonicalLaneLean

structure GlobalWellposednessPackage where
  uniqueSolution : Prop
  continuousDependence : Prop
  blowupCriterion : Prop
  globalInTime : Prop

structure GlobalWellposednessEvidence (G : GlobalWellposednessPackage) where
  uniqueSolutionClosed : G.uniqueSolution
  continuousDependenceClosed : G.continuousDependence
  blowupCriterionClosed : G.blowupCriterion
  globalInTimeClosed : G.globalInTime

def GlobalWellposednessClosed (G : GlobalWellposednessPackage) : Prop :=
  G.uniqueSolution ∧ G.continuousDependence ∧ G.blowupCriterion ∧ G.globalInTime

theorem global_wellposedness_closed_from_evidence
    (G : GlobalWellposednessPackage) (E : GlobalWellposednessEvidence G) :
    GlobalWellposednessClosed G := by
  exact And.intro E.uniqueSolutionClosed
    (And.intro E.continuousDependenceClosed
      (And.intro E.blowupCriterionClosed E.globalInTimeClosed))

end ExistenceProblemsPdesGlobalExistenceCanonicalLaneLean
end HautevilleHouse