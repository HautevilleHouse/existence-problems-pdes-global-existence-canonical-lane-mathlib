import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ExistenceProblemsPdesGlobalExistenceCanonicalLaneLean

structure CompacityPackage where
  precompactSequence : Prop
  limitFunction : Prop
  strongConvergence : Prop
  uniqueness : Prop

structure CompacityEvidence (C : CompacityPackage) where
  precompactSequenceClosed : C.precompactSequence
  limitFunctionClosed : C.limitFunction
  strongConvergenceClosed : C.strongConvergence
  uniquenessClosed : C.uniqueness

def CompacityClosed (C : CompacityPackage) : Prop :=
  C.precompactSequence ∧ C.limitFunction ∧ C.strongConvergence ∧ C.uniqueness

theorem compacity_closed_from_evidence (C : CompacityPackage) (Ev : CompacityEvidence C) :
    CompacityClosed C := by
  exact And.intro Ev.precompactSequenceClosed (And.intro Ev.limitFunctionClosed (And.intro Ev.strongConvergenceClosed Ev.uniquenessClosed))

end ExistenceProblemsPdesGlobalExistenceCanonicalLaneLean
end HautevilleHouse
