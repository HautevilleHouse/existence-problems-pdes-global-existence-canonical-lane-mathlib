import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ExistenceProblemsPdesGlobalExistenceCanonicalLaneLean

structure FunctionalSpace (X : Type) [TopologicalSpace X] where
  carrier : Set (X → ℝ)
  normDefined : Prop
  completeness : Prop
  embeddingProperties : Prop

structure FunctionalSpaceEvidence (X : Type) [TopologicalSpace X] (F : FunctionalSpace X) where
  normDefinedClosed : F.normDefined
  completenessClosed : F.completeness
  embeddingPropertiesClosed : F.embeddingProperties

def FunctionalSpaceClosed (X : Type) [TopologicalSpace X] (F : FunctionalSpace X) : Prop :=
  F.normDefined ∧ F.completeness ∧ F.embeddingProperties

theorem functional_space_closed_from_evidence (X : Type) [TopologicalSpace X] (F : FunctionalSpace X)
    (E : FunctionalSpaceEvidence X F) : FunctionalSpaceClosed X F := by
  exact And.intro E.normDefinedClosed (And.intro E.completenessClosed E.embeddingPropertiesClosed)

end ExistenceProblemsPdesGlobalExistenceCanonicalLaneLean
end HautevilleHouse