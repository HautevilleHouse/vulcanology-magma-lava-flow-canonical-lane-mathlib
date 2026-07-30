import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace VulcanologyMagmaLavaFlowCanonicalLaneLean

def MagmaLavaFlowAdmittedAnalyticClosure : Prop :=
  MagmaLavaFlowAnalyticCertificateClosed sourceMagmaLavaFlowAnalyticCertificate ∧
  ConstrainedTheoremClosure magmaAdmissibleClass

def UnrestrictedClassicalVulcanologyBoundaryCarried : Prop :=
  formalizationCertificate.theoremBoundaryOpen = true ∧
  magmaLavaFlowSubstrate.unrestrictedVulcanologyStackCarried = true

theorem magma_lava_flow_admitted_analytic_closure_checked :
    MagmaLavaFlowAdmittedAnalyticClosure := by
  exact And.intro source_magma_lava_flow_analytic_certificate_closed
    (constrained_theorem_closure magmaAdmissibleClass)

theorem unrestricted_classical_vulcanology_boundary_carried_checked :
    UnrestrictedClassicalVulcanologyBoundaryCarried := by
  exact And.intro rfl rfl

end VulcanologyMagmaLavaFlowCanonicalLaneLean
end HautevilleHouse
