import VulcanologyMagmaLavaFlowCanonicalLaneLean.GasExsolutionLayer

namespace HautevilleHouse
namespace VulcanologyMagmaLavaFlowCanonicalLaneLean

structure VulcanologyCertificate where
  gasExsolution : GasExsolutionCertificate
  propertiesClosed : Prop
  rheologyClosed : Prop
  eruptionClosed : Prop
  emplacementClosed : Prop
  thermalClosed : Prop
  gasExsolutionClosed : Prop
  propertiesClosedProof : propertiesClosed
  rheologyClosedProof : rheologyClosed
  eruptionClosedProof : eruptionClosed
  emplacementClosedProof : emplacementClosed
  thermalClosedProof : thermalClosed
  gasExsolutionClosedProof : gasExsolutionClosed

def sourceVulcanologyCertificate : VulcanologyCertificate := {
  gasExsolution := sourceGasExsolutionCertificate
  propertiesClosed := MagmaIsLiquid primitiveMagma ∧ LavaFlowIsActive primitiveLavaFlow
  rheologyClosed := RheologyClosed sourceRheologyCertificate
  eruptionClosed := EruptionDynamicsClosed sourceEruptionDynamicsCertificate
  emplacementClosed := LavaFlowEmplacementClosed sourceLavaFlowEmplacementCertificate
  thermalClosed := ThermalEvolutionClosed sourceThermalEvolutionCertificate
  gasExsolutionClosed := GasExsolutionClosed sourceGasExsolutionCertificate
  propertiesClosedProof := And.intro primitive_magma_is_liquid primitive_lava_flow_is_active
  rheologyClosedProof := source_rheology_closed
  eruptionClosedProof := source_eruption_dynamics_closed
  emplacementClosedProof := source_lava_flow_emplacement_closed
  thermalClosedProof := source_thermal_evolution_closed
  gasExsolutionClosedProof := source_gas_exsolution_closed
}

def VulcanologyCertificateClosed (C : VulcanologyCertificate) : Prop :=
  C.propertiesClosed ∧
  C.rheologyClosed ∧
  C.eruptionClosed ∧
  C.emplacementClosed ∧
  C.thermalClosed ∧
  C.gasExsolutionClosed

theorem source_vulcanology_certificate_closed :
    VulcanologyCertificateClosed sourceVulcanologyCertificate := by
  exact And.intro sourceVulcanologyCertificate.propertiesClosedProof
    (And.intro sourceVulcanologyCertificate.rheologyClosedProof
      (And.intro sourceVulcanologyCertificate.eruptionClosedProof
        (And.intro sourceVulcanologyCertificate.emplacementClosedProof
          (And.intro sourceVulcanologyCertificate.thermalClosedProof
            sourceVulcanologyCertificate.gasExsolutionClosedProof))))

end HautevilleHouse
end VulcanologyMagmaLavaFlowCanonicalLaneLean