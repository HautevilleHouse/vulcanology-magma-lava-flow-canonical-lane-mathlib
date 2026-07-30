import VulcanologyMagmaLavaFlowCanonicalLaneLean.LavaFlowEmplacementLayer
import Mathlib.Data.Real.Basic

namespace HautevilleHouse
namespace VulcanologyMagmaLavaFlowCanonicalLaneLean

structure ThermalEvolutionCertificate where
  emplacement : LavaFlowEmplacementCertificate
  initialTemperature : ℝ
  ambientTemperature : ℝ
  thermalDiffusivity : ℝ
  coolingTime : ℝ
  solidificationTemperature : ℝ
  initialTemperatureClosed : initialTemperature > ambientTemperature
  ambientTemperatureClosed : ambientTemperature > 0
  thermalDiffusivityClosed : thermalDiffusivity > 0
  coolingTimeClosed : coolingTime > 0
  solidificationTemperatureClosed : solidificationTemperature > ambientTemperature

def sourceThermalEvolutionCertificate : ThermalEvolutionCertificate := {
  emplacement := sourceLavaFlowEmplacementCertificate
  initialTemperature := 1200
  ambientTemperature := 300
  thermalDiffusivity := 0.01
  coolingTime := 1000
  solidificationTemperature := 800
  initialTemperatureClosed := by native_decide
  ambientTemperatureClosed := by native_decide
  thermalDiffusivityClosed := by native_decide
  coolingTimeClosed := by native_decide
  solidificationTemperatureClosed := by native_decide
}

def ThermalEvolutionClosed (C : ThermalEvolutionCertificate) : Prop :=
  LavaFlowEmplacementClosed C.emplacement ∧
  C.initialTemperatureClosed ∧
  C.ambientTemperatureClosed ∧
  C.thermalDiffusivityClosed ∧
  C.coolingTimeClosed ∧
  C.solidificationTemperatureClosed

theorem source_thermal_evolution_closed : ThermalEvolutionClosed sourceThermalEvolutionCertificate := by
  exact And.intro source_lava_flow_emplacement_closed
    (And.intro sourceThermalEvolutionCertificate.initialTemperatureClosed
      (And.intro sourceThermalEvolutionCertificate.ambientTemperatureClosed
        (And.intro sourceThermalEvolutionCertificate.thermalDiffusivityClosed
          (And.intro sourceThermalEvolutionCertificate.coolingTimeClosed
            sourceThermalEvolutionCertificate.solidificationTemperatureClosed))))

def CoolingOccurring (C : ThermalEvolutionCertificate) : Prop :=
  C.initialTemperature > C.ambientTemperature ∧ C.coolingTime > 0

theorem cooling_occurring_checked : CoolingOccurring sourceThermalEvolutionCertificate := by
  unfold CoolingOccurring; refine And.intro ?_ ?_ <;> native_decide

end HautevilleHouse
end VulcanologyMagmaLavaFlowCanonicalLaneLean