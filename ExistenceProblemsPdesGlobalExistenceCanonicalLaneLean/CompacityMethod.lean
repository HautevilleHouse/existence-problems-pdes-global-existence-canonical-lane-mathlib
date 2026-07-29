import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ExistenceProblemsPdesGlobalExistenceCanonicalLaneLean

structure CompacityMethod (X : Type) [TopologicalSpace X] (F : FuncPackage X) where
  approximationScheme : ℕ → Set (X → ℝ)
  uniformEstimates : Prop
  weakConvergence : Prop
  limitIdentification : Prop

structure CompacityMethodEvidence (X : Type) [TopologicalSpace X] (F : FuncPackage X)
    (C : CompacityMethod X F) where
  uniformEstimatesClosed : C.uniformEstimates
  weakConvergenceClosed : C.weakConvergence
  limitIdentificationClosed : C.limitIdentification

def CompacityMethodClosed (X : Type) [TopologicalSpace X] (F : FuncPackage X)
    (C : CompacityMethod X F) : Prop :=
  C.uniformEstimates ∧ C.weakConvergence ∧ C.limitIdentification

theorem compacity_method_closed_from_evidence (X : Type) [TopologicalSpace X] (F : FuncPackage X)
    (C : CompacityMethod X F) (E : CompacityMethodEvidence X F C) :
    CompacityMethodClosed X F C := by
  exact And.intro E.uniformEstimatesClosed (And.intro E.weakConvergenceClosed E.limitIdentificationClosed)

end ExistenceProblemsPdesGlobalExistenceCanonicalLaneLean
end HautevilleHouse