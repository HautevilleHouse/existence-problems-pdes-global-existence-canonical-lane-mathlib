import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ExistenceProblemsPdesGlobalExistenceCanonicalLaneLean

structure WaveEquationGlobalExistencePackage where
  localWellposedness : Prop
  energyConservation : Prop
  globalExistence : Prop
  scattering : Prop

structure WaveEquationGlobalExistenceEvidence (W : WaveEquationGlobalExistencePackage) where
  localWellposednessClosed : W.localWellposedness
  energyConservationClosed : W.energyConservation
  globalExistenceClosed : W.globalExistence
  scatteringClosed : W.scattering

def WaveEquationGlobalExistenceClosed (W : WaveEquationGlobalExistencePackage) : Prop :=
  W.localWellposedness ∧ W.energyConservation ∧ W.globalExistence ∧ W.scattering

theorem wave_equation_global_existence_closed_from_evidence (W : WaveEquationGlobalExistencePackage) (E : WaveEquationGlobalExistenceEvidence W) :
    WaveEquationGlobalExistenceClosed W := by
  exact And.intro E.localWellposednessClosed
    (And.intro E.energyConservationClosed
      (And.intro E.globalExistenceClosed E.scatteringClosed))

end ExistenceProblemsPdesGlobalExistenceCanonicalLaneLean
end HautevilleHouse