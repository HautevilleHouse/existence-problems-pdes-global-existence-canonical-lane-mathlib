import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ExistenceProblemsPdesGlobalExistenceCanonicalLaneLean

structure AdmissibleClass where
  object : PDEAdmittedObject
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def admittedClosure (A : AdmissibleClass) : Prop :=
  PDEGlobalExistenceClosed A.object ∧ (A.endpointSatisfied ∨ A.remainderRecorded)

end ExistenceProblemsPdesGlobalExistenceCanonicalLaneLean
end HautevilleHouse
