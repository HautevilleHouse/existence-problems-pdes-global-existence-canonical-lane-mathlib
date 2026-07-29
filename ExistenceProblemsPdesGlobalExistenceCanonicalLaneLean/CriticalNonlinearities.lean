import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ExistenceProblemsPdesGlobalExistenceCanonicalLaneLean

structure CriticalNonlinearitiesPackage where
  scalingInvariance : Prop
  subcriticalEstimates : Prop
  criticalWellposedness : Prop
  supercriticalBlowup : Prop

structure CriticalNonlinearitiesEvidence (C : CriticalNonlinearitiesPackage) where
  scalingInvarianceClosed : C.scalingInvariance
  subcriticalEstimatesClosed : C.subcriticalEstimates
  criticalWellposednessClosed : C.criticalWellposedness
  supercriticalBlowupClosed : C.supercriticalBlowup

def CriticalNonlinearitiesClosed (C : CriticalNonlinearitiesPackage) : Prop :=
  C.scalingInvariance ∧ C.subcriticalEstimates ∧ C.criticalWellposedness ∧ C.supercriticalBlowup

theorem critical_nonlinearities_closed_from_evidence (C : CriticalNonlinearitiesPackage) (E : CriticalNonlinearitiesEvidence C) :
    CriticalNonlinearitiesClosed C := by
  exact And.intro E.scalingInvarianceClosed
    (And.intro E.subcriticalEstimatesClosed
      (And.intro E.criticalWellposednessClosed E.supercriticalBlowupClosed))

end ExistenceProblemsPdesGlobalExistenceCanonicalLaneLean
end HautevilleHouse