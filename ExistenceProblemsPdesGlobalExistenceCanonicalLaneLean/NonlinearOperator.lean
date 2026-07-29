import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ExistenceProblemsPdesGlobalExistenceCanonicalLaneLean

structure NonlinearOperator (X Y : Type) [TopologicalSpace X] [TopologicalSpace Y] where
  domain : Set X
  codomain : Set Y
  mapping : X → Y
  continuity : Prop
  coercivity : Prop
  monotonicity : Prop

structure NonlinearOperatorEvidence (X Y : Type) [TopologicalSpace X] [TopologicalSpace Y]
    (A : NonlinearOperator X Y) where
  continuityClosed : A.continuity
  coercivityClosed : A.coercivity
  monotonicityClosed : A.monotonicity

def NonlinearOperatorClosed (X Y : Type) [TopologicalSpace X] [TopologicalSpace Y]
    (A : NonlinearOperator X Y) : Prop :=
  A.continuity ∧ A.coercivity ∧ A.monotonicity

theorem nonlinear_operator_closed_from_evidence (X Y : Type) [TopologicalSpace X] [TopologicalSpace Y]
    (A : NonlinearOperator X Y) (E : NonlinearOperatorEvidence X Y A) :
    NonlinearOperatorClosed X Y A := by
  exact And.intro E.continuityClosed (And.intro E.coercivityClosed E.monotonicityClosed)

end ExistenceProblemsPdesGlobalExistenceCanonicalLaneLean
end HautevilleHouse