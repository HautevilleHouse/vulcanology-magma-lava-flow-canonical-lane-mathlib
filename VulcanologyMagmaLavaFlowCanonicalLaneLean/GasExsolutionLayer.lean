import VulcanologyMagmaLavaFlowCanonicalLaneLean.ThermalEvolutionLayer
import Mathlib.Data.Real.Basic

namespace HautevilleHouse
namespace VulcanologyMagmaLavaFlowCanonicalLaneLean

structure GasExsolutionCertificate where
  thermal : ThermalEvolutionCertificate
  volatileContent : ℝ
  exsolutionRate : ℝ
  bubbleNucleationRate : ℝ
  gasOverpressure : ℝ
  volatileContentClosed : volatileContent > 0
  exsolutionRateClosed : exsolutionRate > 0
  bubbleNucleationRateClosed : bubbleNucleationRate > 0
  gasOverpressureClosed : gasOverpressure > 0

def sourceGasExsolutionCertificate : GasExsolutionCertificate := {
  thermal := sourceThermalEvolutionCertificate
  volatileContent := 0.05
  exsolutionRate := 0.1
  bubbleNucleationRate := 0.01
  gasOverpressure := 10
  volatileContentClosed := by native_decide
  exsolutionRateClosed := by native_decide
  bubbleNucleationRateClosed := by native_decide
  gasOverpressureClosed := by native_decide
}

def GasExsolutionClosed (C : GasExsolutionCertificate) : Prop :=
  ThermalEvolutionClosed C.thermal ∧
  C.volatileContentClosed ∧
  C.exsolutionRateClosed ∧
  C.bubbleNucleationRateClosed ∧
  C.gasOverpressureClosed

theorem source_gas_exsolution_closed : GasExsolutionClosed sourceGasExsolutionCertificate := by
  exact And.intro source_thermal_evolution_closed
    (And.intro sourceGasExsolutionCertificate.volatileContentClosed
      (And.intro sourceGasExsolutionCertificate.exsolutionRateClosed
        (And.intro sourceGasExsolutionCertificate.bubbleNucleationRateClosed
          sourceGasExsolutionCertificate.gasOverpressureClosed)))

def GasDrivenEruption (C : GasExsolutionCertificate) : Prop :=
  C.gasOverpressure > 0 ∧ C.exsolutionRate > 0

theorem gas_driven_eruption_checked : GasDrivenEruption sourceGasExsolutionCertificate := by
  unfold GasDrivenEruption; refine And.intro ?_ ?_ <;> native_decide

end HautevilleHouse
end VulcanologyMagmaLavaFlowCanonicalLaneLean