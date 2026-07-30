import VulcanologyMagmaLavaFlowCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace VulcanologyMagmaLavaFlowCanonicalLaneLean

abbrev Temperature := ℝ
abbrev Pressure := ℝ
abbrev StrainRate := ℝ
abbrev Stress := ℝ
abbrev Viscosity := ℝ

noncomputable def zeroTemperature : Temperature := 0
noncomputable def zeroPressure : Pressure := 0
noncomputable def zeroStrainRate : StrainRate := 0
noncomputable def zeroStress : Stress := 0
noncomputable def zeroViscosity : Viscosity := 0

structure MagmaRheology where
  temperature : Temperature
  pressure : Pressure
  strainRate : StrainRate
  stress : Stress
  viscosity : Viscosity

def primitiveMagmaRheology : MagmaRheology := {
  temperature := zeroTemperature
  pressure := zeroPressure
  strainRate := zeroStrainRate
  stress := zeroStress
  viscosity := zeroViscosity
}

structure ViscosityLaw where
  newtonian : Bool
  yieldStress : ℝ
  powerLawExponent : ℝ

def defaultViscosityLaw : ViscosityLaw := {
  newtonian := true
  yieldStress := 0
  powerLawExponent := 1
}

def ViscousFlow (rheo : MagmaRheology) (law : ViscosityLaw) : Prop :=
  rheo.stress = rheo.viscosity * rheo.strainRate

def NonNewtonianCorrection (rheo : MagmaRheology) (law : ViscosityLaw) : Prop :=
  rheo.viscosity = law.powerLawExponent * (rheo.strainRate ^ (law.powerLawExponent - 1))

theorem primitive_viscous_flow_checked : ViscousFlow primitiveMagmaRheology defaultViscosityLaw := by
  unfold ViscousFlow primitiveMagmaRheology defaultViscosityLaw
  unfold zeroStress zeroViscosity zeroStrainRate
  simp

theorem primitive_non_newtonian_checked : NonNewtonianCorrection primitiveMagmaRheology defaultViscosityLaw := by
  unfold NonNewtonianCorrection primitiveMagmaRheology defaultViscosityLaw
  unfold zeroViscosity zeroStrainRate
  simp

end VulcanologyMagmaLavaFlowCanonicalLaneLean
end HautevilleHouse