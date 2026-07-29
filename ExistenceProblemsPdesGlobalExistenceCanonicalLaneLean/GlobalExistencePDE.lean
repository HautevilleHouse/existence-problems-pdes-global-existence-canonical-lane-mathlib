import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ExistenceProblemsPdesGlobalExistenceCanonicalLaneLean

structure GlobalExistencePDEPackage where
  spaceTimeDomain : Type u
  pdeOperator : Type v
  initialData : Type w
  boundaryConditions : Type x
  existenceProof : Prop
  uniquenessProof : Prop
  regularityProof : Prop
  blowupCriteria : Prop

structure GlobalExistencePDEEvidence (P : GlobalExistencePDEPackage) where
  existenceProofClosed : P.existenceProof
  uniquenessProofClosed : P.uniquenessProof
  regularityProofClosed : P.regularityProof
  blowupCriteriaClosed : P.blowupCriteria

def GlobalExistencePDEClosed (P : GlobalExistencePDEPackage) : Prop :=
  P.existenceProof ∧ P.uniquenessProof ∧ P.regularityProof ∧ P.blowupCriteria

theorem global_existence_pde_closed_from_evidence
    (P : GlobalExistencePDEPackage) (E : GlobalExistencePDEEvidence P) :
    GlobalExistencePDEClosed P := by
  exact And.intro E.existenceProofClosed
    (And.intro E.uniquenessProofClosed
      (And.intro E.regularityProofClosed E.blowupCriteriaClosed))

end ExistenceProblemsPdesGlobalExistenceCanonicalLaneLean
end HautevilleHouse