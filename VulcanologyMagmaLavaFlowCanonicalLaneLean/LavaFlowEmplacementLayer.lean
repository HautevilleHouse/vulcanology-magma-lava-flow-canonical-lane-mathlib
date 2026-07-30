import VulcanologyMagmaLavaFlowCanonicalLaneLean.EruptionDynamicsLayer
import Mathlib.Data.Real.Basic

namespace HautevilleHouse
namespace VulcanologyMagmaLavaFlowCanonicalLaneLean

structure LavaFlowEmplacementCertificate where
  eruption : EruptionDynamicsCertificate
  slopeAngle : ℝ
  flowLength : ℝ
  coolingRate : ℝ
  flowWidth : ℝ
  leveeHeight : ℝ
  slopeAngleClosed : slopeAngle > 0 ∧ slopeAngle < 90
  flowLengthClosed : flowLength > 0
  coolingRateClosed : coolingRate < 0

def sourceLavaFlowEmplacementCertificate : LavaFlowEmplacementCertificate := {
  eruption := sourceEruptionDynamicsCertificate
  slopeAngle := 15
  flowLength := 1000
  coolingRate := -0.05
  flowWidth := 50
  leveeHeight := 10
  slopeAngleClosed := by refine And.intro ?_ ?_ <;> native_decide
  flowLengthClosed := by native_decide
  coolingRateClosed := by native_decide
}

def LavaFlowEmplacementClosed (C : LavaFlowEmplacementCertificate) : Prop :=
  EruptionDynamicsClosed C.eruption ∧
  C.slopeAngleClosed ∧
  C.flowLengthClosed ∧
  C.coolingRateClosed

theorem source_lava_flow_emplacement_closed : LavaFlowEmplacementClosed sourceLavaFlowEmplacementCertificate := by
  exact And.intro source_eruption_dynamics_closed
    (And.intro sourceLavaFlowEmplacementCertificate.slopeAngleClosed
      (And.intro sourceLavaFlowEmplacementCertificate.flowLengthClosed
        sourceLavaFlowEmplacementCertificate.coolingRateClosed))

def LavaFlowAdvancing (C : LavaFlowEmplacementCertificate) : Prop :=
  C.slopeAngle > 0 ∧ C.flowLength > 0

theorem lava_flow_advancing_checked : LavaFlowAdvancing sourceLavaFlowEmplacementCertificate := by
  unfold LavaFlowAdvancing; refine And.intro ?_ ?_ <;> native_decide

end HautevilleHouse
end VulcanologyMagmaLavaFlowCanonicalLaneLean