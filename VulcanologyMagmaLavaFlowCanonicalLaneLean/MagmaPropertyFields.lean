import VulcanologyMagmaLavaFlowCanonicalLaneLean.AdmissibleClass
import Mathlib.Data.Real.Basic

namespace HautevilleHouse
namespace VulcanologyMagmaLavaFlowCanonicalLaneLean

abbrev Temperature := ℝ
abbrev Pressure := ℝ
abbrev Viscosity := ℝ
abbrev VolumeFraction := ℝ

def zeroTemperature : Temperature := 0
def zeroPressure : Pressure := 0
def zeroViscosity : Viscosity := 0
def zeroVolumeFraction : VolumeFraction := 0

structure MagmaProperties where
  temperature : Temperature
  pressure : Pressure
  viscosity : Viscosity
  crystalFraction : VolumeFraction
  bubbleFraction : VolumeFraction
  meltFraction : VolumeFraction

structure LavaFlowProperties where
  velocity : ℝ → ℝ
  flowRate : ℝ
  coolingRate : Temperature
  solidificationFront : ℝ → ℝ

def primitiveMagma : MagmaProperties := {
  temperature := 1200
  pressure := 300
  viscosity := 1000
  crystalFraction := 0.2
  bubbleFraction := 0.1
  meltFraction := 0.7
}

def primitiveLavaFlow : LavaFlowProperties := {
  velocity := λ x => if x < 0 then 0 else x
  flowRate := 5.0
  coolingRate := -0.1
  solidificationFront := λ t => if t < 10 then 0 else t - 10
}

def MagmaIsLiquid (m : MagmaProperties) : Prop :=
  m.meltFraction > 0.5 ∧ m.temperature > 800

def LavaFlowIsActive (f : LavaFlowProperties) : Prop :=
  f.flowRate > 0 ∧ f.coolingRate < 0

def SolidificationOccurring (m : MagmaProperties) (f : LavaFlowProperties) : Prop :=
  m.temperature ≤ 800 ∨ f.coolingRate ≥ 0

theorem primitive_magma_is_liquid : MagmaIsLiquid primitiveMagma := by
  refine And.intro ?_ ?_ <;> native_decide

theorem primitive_lava_flow_is_active : LavaFlowIsActive primitiveLavaFlow := by
  refine And.intro ?_ ?_ <;> native_decide

theorem primitive_no_solidification : ¬ SolidificationOccurring primitiveMagma primitiveLavaFlow := by
  unfold SolidificationOccurring
  apply not_or
  · exact by native_decide
  · exact by native_decide

end HautevilleHouse
end VulcanologyMagmaLavaFlowCanonicalLaneLean