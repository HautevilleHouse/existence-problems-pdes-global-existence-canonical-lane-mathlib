import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ExistenceProblemsPdesGlobalExistenceCanonicalLaneLean

structure NavierStokesGlobalRegularityPackage where
  weakSolutionExistence : Prop
  strongSolutionCriterion : Prop
  globalRegularity : Prop
  uniqueness : Prop

structure NavierStokesGlobalRegularityEvidence (N : NavierStokesGlobalRegularityPackage) where
  weakSolutionExistenceClosed : N.weakSolutionExistence
  strongSolutionCriterionClosed : N.strongSolutionCriterion
  globalRegularityClosed : N.globalRegularity
  uniquenessClosed : N.uniqueness

def NavierStokesGlobalRegularityClosed (N : NavierStokesGlobalRegularityPackage) : Prop :=
  N.weakSolutionExistence ∧ N.strongSolutionCriterion ∧ N.globalRegularity ∧ N.uniqueness

theorem navier_stokes_global_regularity_closed_from_evidence (N : NavierStokesGlobalRegularityPackage) (E : NavierStokesGlobalRegularityEvidence N) :
    NavierStokesGlobalRegularityClosed N := by
  exact And.intro E.weakSolutionExistenceClosed
    (And.intro E.strongSolutionCriterionClosed
      (And.intro E.globalRegularityClosed E.uniquenessClosed))

end ExistenceProblemsPdesGlobalExistenceCanonicalLaneLean
end HautevilleHouse