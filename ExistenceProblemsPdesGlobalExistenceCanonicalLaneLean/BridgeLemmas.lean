import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ExistenceProblemsPdesGlobalExistenceCanonicalLaneLean

def bridgeClosed (A : AdmissibleClass) : Prop :=
  PDEGlobalExistenceClosed A.object

theorem bridge_from_admissible_class (A : AdmissibleClass) :
    bridgeClosed A := by
  exact A.object.conclusion

end ExistenceProblemsPdesGlobalExistenceCanonicalLaneLean
end HautevilleHouse
