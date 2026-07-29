import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ExistenceProblemsPdesGlobalExistenceCanonicalLaneLean

structure EulerEquationGlobalExistencePackage where
  domainSmooth : Prop
  initialVelocitySolenoidal : Prop
  boundaryCondition : Prop
  vorticityRegular : Prop
  globalSolutionExists : Prop

structure EulerEquationGlobalExistenceEvidence (E : EulerEquationGlobalExistencePackage) where
  domainSmoothClosed : E.domainSmooth
  initialVelocitySolenoidalClosed : E.initialVelocitySolenoidal
  boundaryConditionClosed : E.boundaryCondition
  vorticityRegularClosed : E.vorticityRegular
  globalSolutionExistsClosed : E.globalSolutionExists

def EulerEquationGlobalExistenceClosed (E : EulerEquationGlobalExistencePackage) : Prop :=
  E.domainSmooth ∧ E.initialVelocitySolenoidal ∧ E.boundaryCondition ∧ E.vorticityRegular ∧ E.globalSolutionExists

theorem euler_equation_global_existence_closed_from_evidence
    (E : EulerEquationGlobalExistencePackage) (Ev : EulerEquationGlobalExistenceEvidence E) :
    EulerEquationGlobalExistenceClosed E := by
  exact And.intro Ev.domainSmoothClosed
    (And.intro Ev.initialVelocitySolenoidalClosed
      (And.intro Ev.boundaryConditionClosed
        (And.intro Ev.vorticityRegularClosed Ev.globalSolutionExistsClosed)))

end ExistenceProblemsPdesGlobalExistenceCanonicalLaneLean
end HautevilleHouse