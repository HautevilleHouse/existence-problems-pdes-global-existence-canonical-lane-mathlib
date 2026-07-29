import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ExistenceProblemsPdesGlobalExistence

structure SemigroupPackage where
  stronglyContinuous : Prop
  contractionProperty : Prop
  analyticity : Prop
  sectorialOperator : Prop

structure SemigroupEvidence (S : SemigroupPackage) where
  stronglyContinuousClosed : S.stronglyContinuous
  contractionPropertyClosed : S.contractionProperty
  analyticityClosed : S.analyticity
  sectorialOperatorClosed : S.sectorialOperator

def SemigroupClosed (S : SemigroupPackage) : Prop :=
  S.stronglyContinuous ∧ S.contractionProperty ∧ S.analyticity ∧ S.sectorialOperator

theorem semigroup_closed_from_evidence (S : SemigroupPackage) (E : SemigroupEvidence S) :
    SemigroupClosed S := by
  exact And.intro E.stronglyContinuousClosed (And.intro E.contractionPropertyClosed (And.intro E.analyticityClosed E.sectorialOperatorClosed))

end ExistenceProblemsPdesGlobalExistence
end HautevilleHouse
