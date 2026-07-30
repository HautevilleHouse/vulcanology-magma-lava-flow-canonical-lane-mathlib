import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace VulcanologyMagmaLavaFlowCanonicalLaneLean

abbrev Temperature := ℝ
abbrev Pressure := ℝ
abbrev Viscosity := ℝ
abbrev Density := ℝ
abbrev Velocity := ℝ

structure MagmaComposition where
  silicaContent : ℝ
  waterContent : ℝ
  gasContent : ℝ
  crystalFraction : ℝ

def defaultComposition : MagmaComposition := {
  silicaContent := 0.55,
  waterContent := 0.03,
  gasContent := 0.05,
  crystalFraction := 0.2
}

structure LavaFlowVariables where
  temperature : Temperature
  pressure : Pressure
  viscosity : Viscosity
  density : Density
  velocity : Velocity
  composition : MagmaComposition

def initialLavaFlow : LavaFlowVariables := {
  temperature := 1400,
  pressure := 1.0,
  viscosity := 100.0,
  density := 2700.0,
  velocity := 0.0,
  composition := defaultComposition
}

structure PhysicalPropertyOperators where
  viscosityFromTempComp : Temperature → MagmaComposition → Viscosity
  densityFromTempComp : Temperature → MagmaComposition → Density
  gasExsolutionRate : Temperature → Pressure → ℝ
  crystalGrowthRate : Temperature → ℝ

def defaultPhysicalPropertyOperators : PhysicalPropertyOperators := {
  viscosityFromTempComp := fun _ _ => 100.0,
  densityFromTempComp := fun _ _ => 2700.0,
  gasExsolutionRate := fun _ _ => 0.001,
  crystalGrowthRate := fun _ => 0.0001
}

structure ConstitutiveLaws (F : LavaFlowVariables) (O : PhysicalPropertyOperators) : Prop :=
  viscosityDetermined : O.viscosityFromTempComp F.temperature F.composition = F.viscosity
  densityDetermined : O.densityFromTempComp F.temperature F.composition = F.density

theorem default_constitutive_laws_checked : ConstitutiveLaws initialLavaFlow defaultPhysicalPropertyOperators := by
  exact {
    viscosityDetermined := rfl,
    densityDetermined := rfl
  }

end VulcanologyMagmaLavaFlowCanonicalLaneLean
end HautevilleHouse
