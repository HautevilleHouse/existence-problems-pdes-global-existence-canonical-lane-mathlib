import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ExistenceProblemsPdesGlobalExistence

structure SobolevSpace (Ω : Type) [MeasureTheory.MeasureSpace Ω] where
  exponent : ℝ
  differentiabilityOrder : ℕ
  normedSpace : Prop
  completeness : Prop
  embeddingTheorems : Prop

structure SobolevSpaceEvidence (S : SobolevSpace Ω) where
  normedSpaceClosed : S.normedSpace
  completenessClosed : S.completeness
  embeddingTheoremsClosed : S.embeddingTheorems

def SobolevSpaceClosed (S : SobolevSpace Ω) : Prop :=
  S.normedSpace ∧ S.completeness ∧ S.embeddingTheorems

theorem sobolev_space_closed_from_evidence (S : SobolevSpace Ω) (E : SobolevSpaceEvidence S) :
    SobolevSpaceClosed S := by
  exact And.intro E.normedSpaceClosed (And.intro E.completenessClosed E.embeddingTheoremsClosed)

end ExistenceProblemsPdesGlobalExistence
end HautevilleHouse
