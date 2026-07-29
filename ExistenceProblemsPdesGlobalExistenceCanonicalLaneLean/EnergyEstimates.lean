import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ExistenceProblemsPdesGlobalExistenceCanonicalLaneLean

structure EnergyEstimatesPackage where
  conservationLaw : Prop
  monotonicity : Prop
  coercivity : Prop
  regularityGain : Prop

structure EnergyEstimatesEvidence (E : EnergyEstimatesPackage) where
  conservationLawClosed : E.conservationLaw
  monotonicityClosed : E.monotonicity
  coercivityClosed : E.coercivity
  regularityGainClosed : E.regularityGain

def EnergyEstimatesClosed (E : EnergyEstimatesPackage) : Prop :=
  E.conservationLaw ∧ E.monotonicity ∧ E.coercivity ∧ E.regularityGain

theorem energy_estimates_closed_from_evidence (E : EnergyEstimatesPackage) (Ev : EnergyEstimatesEvidence E) :
    EnergyEstimatesClosed E := by
  exact And.intro Ev.conservationLawClosed (And.intro Ev.monotonicityClosed (And.intro Ev.coercivityClosed Ev.regularityGainClosed))

end ExistenceProblemsPdesGlobalExistenceCanonicalLaneLean
end HautevilleHouse
