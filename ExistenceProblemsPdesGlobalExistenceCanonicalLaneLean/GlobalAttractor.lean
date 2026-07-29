import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ExistenceProblemsPdesGlobalExistence

structure GlobalAttractorPackage where
  absorbingSet : Prop
  invariance : Prop
  compactness : Prop
  attractsBoundedSets : Prop

structure GlobalAttractorEvidence (G : GlobalAttractorPackage) where
  absorbingSetClosed : G.absorbingSet
  invarianceClosed : G.invariance
  compactnessClosed : G.compactness
  attractsBoundedSetsClosed : G.attractsBoundedSets

def GlobalAttractorClosed (G : GlobalAttractorPackage) : Prop :=
  G.absorbingSet ∧ G.invariance ∧ G.compactness ∧ G.attractsBoundedSets

theorem global_attractor_closed_from_evidence (G : GlobalAttractorPackage) (E : GlobalAttractorEvidence G) :
    GlobalAttractorClosed G := by
  exact And.intro E.absorbingSetClosed (And.intro E.invarianceClosed (And.intro E.compactnessClosed E.attractsBoundedSetsClosed))

end ExistenceProblemsPdesGlobalExistence
end HautevilleHouse
