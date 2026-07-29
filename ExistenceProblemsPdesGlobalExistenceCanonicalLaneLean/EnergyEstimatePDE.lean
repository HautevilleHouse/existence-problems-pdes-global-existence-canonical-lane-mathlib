import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ExistenceProblemsPdesGlobalExistenceCanonicalLaneLean

structure EnergyEstimatePackage where
  initialEnergyFinite : Prop
  dissipationTerm : Prop
  energyInequalityHolds : Prop
  criticalExponent : Prop
  sobolevEmbeddingUsed : Prop

structure EnergyEstimateEvidence (E : EnergyEstimatePackage) where
  initialEnergyFiniteClosed : E.initialEnergyFinite
  dissipationTermClosed : E.dissipationTerm
  energyInequalityHoldsClosed : E.energyInequalityHolds
  criticalExponentClosed : E.criticalExponent
  sobolevEmbeddingUsedClosed : E.sobolevEmbeddingUsed

def EnergyEstimateClosed (E : EnergyEstimatePackage) : Prop :=
  E.initialEnergyFinite ∧ E.dissipationTerm ∧ E.energyInequalityHolds ∧ E.criticalExponent ∧ E.sobolevEmbeddingUsed

theorem energy_estimate_closed_from_evidence
    (E : EnergyEstimatePackage) (Ev : EnergyEstimateEvidence E) :
    EnergyEstimateClosed E := by
  exact And.intro Ev.initialEnergyFiniteClosed
    (And.intro Ev.dissipationTermClosed
      (And.intro Ev.energyInequalityHoldsClosed
        (And.intro Ev.criticalExponentClosed Ev.sobolevEmbeddingUsedClosed)))

end ExistenceProblemsPdesGlobalExistenceCanonicalLaneLean
end HautevilleHouse