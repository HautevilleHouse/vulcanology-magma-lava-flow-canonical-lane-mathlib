import VulcanologyMagmaLavaFlowCanonicalLaneLean.EruptionColumnDynamics

namespace HautevilleHouse
namespace VulcanologyMagmaLavaFlowCanonicalLaneLean

structure PyroclasticFlowCertificate where
  eruptionColumn : EruptionColumnCertificate
  flowVelocity : Prop
  temperatureProfile : Prop
  runoutDistance : Prop
  flowVelocityClosed : flowVelocity
  temperatureProfileClosed : temperatureProfile
  runoutDistanceClosed : runoutDistance

def sourcePyroclasticFlowCertificate : PyroclasticFlowCertificate := {
  eruptionColumn := sourceEruptionColumnCertificate
  flowVelocity := sourceEruptionColumnCertificate.columnHeight
  temperatureProfile := sourceEruptionColumnCertificate.entrainmentRate
  runoutDistance := sourceEruptionColumnCertificate.collapsePotential
  flowVelocityClosed := sourceEruptionColumnCertificate.columnHeightClosed
  temperatureProfileClosed := sourceEruptionColumnCertificate.entrainmentRateClosed
  runoutDistanceClosed := sourceEruptionColumnCertificate.collapsePotentialClosed
}

def PyroclasticFlowClosed (C : PyroclasticFlowCertificate) : Prop :=
  EruptionColumnClosed C.eruptionColumn ∧
  C.flowVelocity ∧
  C.temperatureProfile ∧
  C.runoutDistance

theorem source_pyroclastic_flow_closed :
    PyroclasticFlowClosed sourcePyroclasticFlowCertificate := by
  exact And.intro source_eruption_column_closed
    (And.intro sourcePyroclasticFlowCertificate.flowVelocityClosed
      (And.intro sourcePyroclasticFlowCertificate.temperatureProfileClosed
        sourcePyroclasticFlowCertificate.runoutDistanceClosed))

end VulcanologyMagmaLavaFlowCanonicalLaneLean
end HautevilleHouse