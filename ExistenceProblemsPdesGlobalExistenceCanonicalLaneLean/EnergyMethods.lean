import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ExistenceProblemsPdesGlobalExistenceCanonicalLaneLean

structure EnergyMethodsPackage where
  energyFunctional : Prop
  dissipativeEstimate : Prop
  monotonicity : Prop
  criticality : Prop

structure EnergyMethodsEvidence (E : EnergyMethodsPackage) where
  energyFunctionalClosed : E.energyFunctional
  dissipativeEstimateClosed : E.dissipativeEstimate
  monotonicityClosed : E.monotonicity
  criticalityClosed : E.criticality

def EnergyMethodsClosed (E : EnergyMethodsPackage) : Prop :=
  E.energyFunctional ∧ E.dissipativeEstimate ∧ E.monotonicity ∧ E.criticality

theorem energy_methods_closed_from_evidence (E : EnergyMethodsPackage) (Ev : EnergyMethodsEvidence E) :
    EnergyMethodsClosed E := by
  exact And.intro Ev.energyFunctionalClosed
    (And.intro Ev.dissipativeEstimateClosed
      (And.intro Ev.monotonicityClosed Ev.criticalityClosed))

end ExistenceProblemsPdesGlobalExistenceCanonicalLaneLean
end HautevilleHouse