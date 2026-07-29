import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ExistenceProblemsPdesGlobalExistence

structure ParabolicRegularityPackage where
  hölderEstimates : Prop
  maximalRegularity : Prop
  smoothingEffect : Prop
  compactEmbeddings : Prop

structure ParabolicRegularityEvidence (P : ParabolicRegularityPackage) where
  hölderEstimatesClosed : P.hölderEstimates
  maximalRegularityClosed : P.maximalRegularity
  smoothingEffectClosed : P.smoothingEffect
  compactEmbeddingsClosed : P.compactEmbeddings

def ParabolicRegularityClosed (P : ParabolicRegularityPackage) : Prop :=
  P.hölderEstimates ∧ P.maximalRegularity ∧ P.smoothingEffect ∧ P.compactEmbeddings

theorem parabolic_regularity_closed_from_evidence (P : ParabolicRegularityPackage) (E : ParabolicRegularityEvidence P) :
    ParabolicRegularityClosed P := by
  exact And.intro E.hölderEstimatesClosed (And.intro E.maximalRegularityClosed (And.intro E.smoothingEffectClosed E.compactEmbeddingsClosed))

end ExistenceProblemsPdesGlobalExistence
end HautevilleHouse
