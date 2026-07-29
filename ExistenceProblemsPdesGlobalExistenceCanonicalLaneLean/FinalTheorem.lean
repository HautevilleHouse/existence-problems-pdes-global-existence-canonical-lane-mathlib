import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ExistenceProblemsPdesGlobalExistenceCanonicalLaneLean

def ConstrainedExistenceClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_existence_endgame (A : AdmissibleClass) :
    ConstrainedExistenceClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end ExistenceProblemsPdesGlobalExistenceCanonicalLaneLean
end HautevilleHouse