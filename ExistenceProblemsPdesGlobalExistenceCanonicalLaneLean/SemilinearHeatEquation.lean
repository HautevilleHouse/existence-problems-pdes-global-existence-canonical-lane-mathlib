import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ExistenceProblemsPdesGlobalExistenceCanonicalLaneLean

structure SemilinearHeatEquationPackage where
  localExistence : Prop
  blowupCriterion : Prop
  globalExistence : Prop
  energyEstimates : Prop

structure SemilinearHeatEquationEvidence (S : SemilinearHeatEquationPackage) where
  localExistenceClosed : S.localExistence
  blowupCriterionClosed : S.blowupCriterion
  globalExistenceClosed : S.globalExistence
  energyEstimatesClosed : S.energyEstimates

def SemilinearHeatEquationClosed (S : SemilinearHeatEquationPackage) : Prop :=
  S.localExistence ∧ S.blowupCriterion ∧ S.globalExistence ∧ S.energyEstimates

theorem semilinear_heat_equation_closed_from_evidence (S : SemilinearHeatEquationPackage) (E : SemilinearHeatEquationEvidence S) :
    SemilinearHeatEquationClosed S := by
  exact And.intro E.localExistenceClosed
    (And.intro E.blowupCriterionClosed
      (And.intro E.globalExistenceClosed E.energyEstimatesClosed))

end ExistenceProblemsPdesGlobalExistenceCanonicalLaneLean
end HautevilleHouse