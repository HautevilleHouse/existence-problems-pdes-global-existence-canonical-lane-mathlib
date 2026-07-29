import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ExistenceProblemsPdesGlobalExistenceCanonicalLaneLean

structure NavierStokesGlobalExistencePackage where
  viscosityPositive : Prop
  externalForceRegular : Prop
  initialVelocitySmooth : Prop
  reynoldsNumberFinite : Prop
  globalSolutionExists : Prop

structure NavierStokesGlobalExistenceEvidence (N : NavierStokesGlobalExistencePackage) where
  viscosityPositiveClosed : N.viscosityPositive
  externalForceRegularClosed : N.externalForceRegular
  initialVelocitySmoothClosed : N.initialVelocitySmooth
  reynoldsNumberFiniteClosed : N.reynoldsNumberFinite
  globalSolutionExistsClosed : N.globalSolutionExists

def NavierStokesGlobalExistenceClosed (N : NavierStokesGlobalExistencePackage) : Prop :=
  N.viscosityPositive ∧ N.externalForceRegular ∧ N.initialVelocitySmooth ∧ N.reynoldsNumberFinite ∧ N.globalSolutionExists

theorem navier_stokes_global_existence_closed_from_evidence
    (N : NavierStokesGlobalExistencePackage) (E : NavierStokesGlobalExistenceEvidence N) :
    NavierStokesGlobalExistenceClosed N := by
  exact And.intro E.viscosityPositiveClosed
    (And.intro E.externalForceRegularClosed
      (And.intro E.initialVelocitySmoothClosed
        (And.intro E.reynoldsNumberFiniteClosed E.globalSolutionExistsClosed)))

end ExistenceProblemsPdesGlobalExistenceCanonicalLaneLean
end HautevilleHouse