import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ExistenceProblemsPdesGlobalExistenceCanonicalLaneLean

structure SobolevEmbeddingsPackage where
  sobolevInequality : Prop
  embeddingContinuous : Prop
  embeddingCompact : Prop
  criticalExponent : Prop

structure SobolevEmbeddingsEvidence (S : SobolevEmbeddingsPackage) where
  sobolevInequalityClosed : S.sobolevInequality
  embeddingContinuousClosed : S.embeddingContinuous
  embeddingCompactClosed : S.embeddingCompact
  criticalExponentClosed : S.criticalExponent

def SobolevEmbeddingsClosed (S : SobolevEmbeddingsPackage) : Prop :=
  S.sobolevInequality ∧ S.embeddingContinuous ∧ S.embeddingCompact ∧ S.criticalExponent

theorem sobolev_embeddings_closed_from_evidence (S : SobolevEmbeddingsPackage) (E : SobolevEmbeddingsEvidence S) :
    SobolevEmbeddingsClosed S := by
  exact And.intro E.sobolevInequalityClosed
    (And.intro E.embeddingContinuousClosed
      (And.intro E.embeddingCompactClosed E.criticalExponentClosed))

end ExistenceProblemsPdesGlobalExistenceCanonicalLaneLean
end HautevilleHouse