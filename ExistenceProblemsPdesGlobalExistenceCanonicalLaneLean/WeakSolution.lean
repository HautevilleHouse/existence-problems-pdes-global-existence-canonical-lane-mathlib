import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ExistenceProblemsPdesGlobalExistenceCanonicalLaneLean

structure WeakSolution (X : Type) [TopologicalSpace X] (F : FuncPackage X) where
  testFunctionSpace : Set (X → ℝ)
  integralFormulation : Prop
  existence : Prop
  uniqueness : Prop
  regularity : Prop

structure WeakSolutionEvidence (X : Type) [TopologicalSpace X] (F : FuncPackage X)
    (u : WeakSolution X F) where
  integralFormulationClosed : u.integralFormulation
  existenceClosed : u.existence
  uniquenessClosed : u.uniqueness
  regularityClosed : u.regularity

def WeakSolutionClosed (X : Type) [TopologicalSpace X] (F : FuncPackage X)
    (u : WeakSolution X F) : Prop :=
  u.integralFormulation ∧ u.existence ∧ u.uniqueness ∧ u.regularity

theorem weak_solution_closed_from_evidence (X : Type) [TopologicalSpace X] (F : FuncPackage X)
    (u : WeakSolution X F) (E : WeakSolutionEvidence X F u) : WeakSolutionClosed X F u := by
  exact And.intro E.integralFormulationClosed
    (And.intro E.existenceClosed (And.intro E.uniquenessClosed E.regularityClosed))

end ExistenceProblemsPdesGlobalExistenceCanonicalLaneLean
end HautevilleHouse