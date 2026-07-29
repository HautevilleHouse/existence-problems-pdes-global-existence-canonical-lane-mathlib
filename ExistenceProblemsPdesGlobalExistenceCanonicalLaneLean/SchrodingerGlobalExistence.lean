import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ExistenceProblemsPdesGlobalExistenceCanonicalLaneLean

structure SchrodingerGlobalExistencePackage where
  potentialBounded : Prop
  initialWavefunctionInL2 : Prop
  nonlinearitySubcritical : Prop
  conservationLaws : Prop
  globalSolutionExists : Prop

structure SchrodingerGlobalExistenceEvidence (S : SchrodingerGlobalExistencePackage) where
  potentialBoundedClosed : S.potentialBounded
  initialWavefunctionInL2Closed : S.initialWavefunctionInL2
  nonlinearitySubcriticalClosed : S.nonlinearitySubcritical
  conservationLawsClosed : S.conservationLaws
  globalSolutionExistsClosed : S.globalSolutionExists

def SchrodingerGlobalExistenceClosed (S : SchrodingerGlobalExistencePackage) : Prop :=
  S.potentialBounded ∧ S.initialWavefunctionInL2 ∧ S.nonlinearitySubcritical ∧ S.conservationLaws ∧ S.globalSolutionExists

theorem schrodinger_global_existence_closed_from_evidence
    (S : SchrodingerGlobalExistencePackage) (E : SchrodingerGlobalExistenceEvidence S) :
    SchrodingerGlobalExistenceClosed S := by
  exact And.intro E.potentialBoundedClosed
    (And.intro E.initialWavefunctionInL2Closed
      (And.intro E.nonlinearitySubcriticalClosed
        (And.intro E.conservationLawsClosed E.globalSolutionExistsClosed)))

end ExistenceProblemsPdesGlobalExistenceCanonicalLaneLean
end HautevilleHouse