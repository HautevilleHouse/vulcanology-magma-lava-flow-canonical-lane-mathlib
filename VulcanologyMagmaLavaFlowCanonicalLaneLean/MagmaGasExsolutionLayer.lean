import VulcanologyMagmaLavaFlowCanonicalLaneLean.ThermalEruptionLayer

namespace HautevilleHouse
namespace VulcanologyMagmaLavaFlowCanonicalLaneLean

structure GasExsolutionCertificate where
  thermal : ThermalEruptionCertificate
  solubilityModel : Prop
  bubbleNucleation : Prop
  bubbleGrowth : Prop
  pressureRelease : Prop
  solubilityModelClosed : solubilityModel
  bubbleNucleationClosed : bubbleNucleation
  bubbleGrowthClosed : bubbleGrowth
  pressureReleaseClosed : pressureRelease

def sourceGasExsolutionCertificate : GasExsolutionCertificate := {
  thermal := sourceThermalEruptionCertificate
  solubilityModel := sourceThermalEruptionCertificate.coolingRate
  bubbleNucleation := sourceThermalEruptionCertificate.gasExsolution
  bubbleGrowth := sourceThermalEruptionCertificate.eruptionTemperature
  pressureRelease := True
  solubilityModelClosed := sourceThermalEruptionCertificate.coolingRateClosed
  bubbleNucleationClosed := sourceThermalEruptionCertificate.gasExsolutionClosed
  bubbleGrowthClosed := sourceThermalEruptionCertificate.eruptionTemperatureClosed
  pressureReleaseClosed := trivial
}

def GasExsolutionClosed (C : GasExsolutionCertificate) : Prop :=
  ThermalEruptionClosed C.thermal ∧
  C.solubilityModel ∧
  C.bubbleNucleation ∧
  C.bubbleGrowth ∧
  C.pressureRelease

theorem source_gas_exsolution_closed :
    GasExsolutionClosed sourceGasExsolutionCertificate := by
  exact And.intro source_thermal_eruption_closed
    (And.intro sourceGasExsolutionCertificate.solubilityModelClosed
      (And.intro sourceGasExsolutionCertificate.bubbleNucleationClosed
        (And.intro sourceGasExsolutionCertificate.bubbleGrowthClosed
          sourceGasExsolutionCertificate.pressureReleaseClosed)))

end VulcanologyMagmaLavaFlowCanonicalLaneLean
end HautevilleHouse