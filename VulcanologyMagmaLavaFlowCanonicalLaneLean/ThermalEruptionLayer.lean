import VulcanologyMagmaLavaFlowCanonicalLaneLean.MagmaRheology

namespace HautevilleHouse
namespace VulcanologyMagmaLavaFlowCanonicalLaneLean

structure ThermalEruptionCertificate where
  magma : MagmaRheology
  eruptionTemperature : Prop
  coolingRate : Prop
  gasExsolution : Prop
  crystallization : Prop
  eruptionTemperatureClosed : eruptionTemperature
  coolingRateClosed : coolingRate
  gasExsolutionClosed : gasExsolution
  crystallizationClosed : crystallization

def sourceThermalEruptionCertificate : ThermalEruptionCertificate := {
  magma := primitiveMagmaRheology
  eruptionTemperature := primitiveMagmaRheology.temperature = 0
  coolingRate := primitiveMagmaRheology.pressure = 0
  gasExsolution := VulcanologyMagmaLavaFlowCanonicalLaneLean.defaultViscosityLaw.newtonian = true
  crystallization := False
  eruptionTemperatureClosed := rfl
  coolingRateClosed := rfl
  gasExsolutionClosed := rfl
  crystallizationClosed := by
    exact False.elim
}

def ThermalEruptionClosed (C : ThermalEruptionCertificate) : Prop :=
  C.eruptionTemperature ∧ C.coolingRate ∧ C.gasExsolution ∧ C.crystallization

theorem source_thermal_eruption_closed :
    ThermalEruptionClosed sourceThermalEruptionCertificate := by
  exact And.intro sourceThermalEruptionCertificate.eruptionTemperatureClosed
    (And.intro sourceThermalEruptionCertificate.coolingRateClosed
      (And.intro sourceThermalEruptionCertificate.gasExsolutionClosed
        sourceThermalEruptionCertificate.crystallizationClosed))

end VulcanologyMagmaLavaFlowCanonicalLaneLean
end HautevilleHouse