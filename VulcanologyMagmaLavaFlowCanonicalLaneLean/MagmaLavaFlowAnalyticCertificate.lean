import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace VulcanologyMagmaLavaFlowCanonicalLaneLean

structure MagmaLavaFlowAnalyticCertificate where
  substrate : MagmaLavaFlowSubstrate
  operatorsClosed : Prop
  weakLayerClosed : Prop
  thermalLayerClosed : Prop
  rheologyLayerClosed : Prop
  endpointLayerClosed : Prop
  canonicalCarriageImported : Prop
  operatorsClosedProof : operatorsClosed
  weakLayerClosedProof : weakLayerClosed
  thermalLayerClosedProof : thermalLayerClosed
  rheologyLayerClosedProof : rheologyLayerClosed
  endpointLayerClosedProof : endpointLayerClosed
  canonicalCarriageImportedProof : canonicalCarriageImported

def sourceMagmaLavaFlowAnalyticCertificate : MagmaLavaFlowAnalyticCertificate := {
  substrate := magmaLavaFlowSubstrate
  operatorsClosed := MagmaLavaFlowEquationClosed magmaLavaFlowObject
  weakLayerClosed := WeakMagmaLavaFlowClosure sourceWeakMagmaLavaFlowEnvelope
  thermalLayerClosed := ThermalLayerClosed sourceThermalLayerCertificate
  rheologyLayerClosed := RheologyLayerClosed sourceRheologyLayerCertificate
  endpointLayerClosed := MagmaEndpointClosed sourceMagmaEndpointCertificate
  canonicalCarriageImported := commonCoreProjectionLawAvailable ∧ commonCoreCarriageLawAvailable ∧ commonCoreIdempotenceAvailable
  operatorsClosedProof := magma_lava_flow_equation_closed_checked
  weakLayerClosedProof := source_weak_magma_lava_flow_closed
  thermalLayerClosedProof := source_thermal_layer_closed
  rheologyLayerClosedProof := source_rheology_layer_closed
  endpointLayerClosedProof := source_magma_endpoint_closed
  canonicalCarriageImportedProof := And.intro mathlib_common_core_projection_law_checked
    (And.intro mathlib_common_core_carriage_law_checked mathlib_common_core_idempotence_checked)
}

def MagmaLavaFlowAnalyticCertificateClosed (C : MagmaLavaFlowAnalyticCertificate) : Prop :=
  C.operatorsClosed ∧
  C.weakLayerClosed ∧
  C.thermalLayerClosed ∧
  C.rheologyLayerClosed ∧
  C.endpointLayerClosed ∧
  C.canonicalCarriageImported

theorem source_magma_lava_flow_analytic_certificate_closed :
    MagmaLavaFlowAnalyticCertificateClosed sourceMagmaLavaFlowAnalyticCertificate := by
  exact And.intro sourceMagmaLavaFlowAnalyticCertificate.operatorsClosedProof
    (And.intro sourceMagmaLavaFlowAnalyticCertificate.weakLayerClosedProof
      (And.intro sourceMagmaLavaFlowAnalyticCertificate.thermalLayerClosedProof
        (And.intro sourceMagmaLavaFlowAnalyticCertificate.rheologyLayerClosedProof
          (And.intro sourceMagmaLavaFlowAnalyticCertificate.endpointLayerClosedProof
            sourceMagmaLavaFlowAnalyticCertificate.canonicalCarriageImportedProof))))

end VulcanologyMagmaLavaFlowCanonicalLaneLean
end HautevilleHouse
