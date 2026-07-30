import VulcanologyMagmaLavaFlowCanonicalLaneLean.VolcanoRheologyLayer
import Mathlib.Data.Real.Basic

namespace HautevilleHouse
namespace VulcanologyMagmaLavaFlowCanonicalLaneLean

structure EruptionDynamicsCertificate where
  rheology : RheologyCertificate
  chamberPressure : ℝ
  conduitRadius : ℝ
  eruptionVelocity : ℝ
  fragmentationDepth : ℝ
  gasExsolutionRate : ℝ
  chamberPressureClosed : chamberPressure > 0
  conduitRadiusClosed : conduitRadius > 0
  fragmentationDepthClosed : fragmentationDepth ≥ 0
  gasExsolutionRateClosed : gasExsolutionRate ≥ 0

def sourceEruptionDynamicsCertificate : EruptionDynamicsCertificate := {
  rheology := sourceRheologyCertificate
  chamberPressure := 500
  conduitRadius := 10
  eruptionVelocity := 100
  fragmentationDepth := 200
  gasExsolutionRate := 0.5
  chamberPressureClosed := by native_decide
  conduitRadiusClosed := by native_decide
  fragmentationDepthClosed := by native_decide
  gasExsolutionRateClosed := by native_decide
}

def EruptionDynamicsClosed (C : EruptionDynamicsCertificate) : Prop :=
  RheologyClosed C.rheology ∧
  C.chamberPressureClosed ∧
  C.conduitRadiusClosed ∧
  C.fragmentationDepthClosed ∧
  C.gasExsolutionRateClosed

theorem source_eruption_dynamics_closed : EruptionDynamicsClosed sourceEruptionDynamicsCertificate := by
  exact And.intro source_rheology_closed
    (And.intro sourceEruptionDynamicsCertificate.chamberPressureClosed
      (And.intro sourceEruptionDynamicsCertificate.conduitRadiusClosed
        (And.intro sourceEruptionDynamicsCertificate.fragmentationDepthClosed
          sourceEruptionDynamicsCertificate.gasExsolutionRateClosed)))

def MagmaAscensionDriven (C : EruptionDynamicsCertificate) : Prop :=
  C.chamberPressure > 0 ∧ C.eruptionVelocity > 0

theorem magma_ascension_driven_checked : MagmaAscensionDriven sourceEruptionDynamicsCertificate := by
  unfold MagmaAscensionDriven; refine And.intro ?_ ?_ <;> native_decide

end HautevilleHouse
end VulcanologyMagmaLavaFlowCanonicalLaneLean