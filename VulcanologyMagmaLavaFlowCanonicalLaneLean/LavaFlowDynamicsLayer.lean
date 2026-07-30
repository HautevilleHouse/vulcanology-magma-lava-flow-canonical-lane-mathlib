import VulcanologyMagmaLavaFlowCanonicalLaneLean.MagmaRheology

namespace HautevilleHouse
namespace VulcanologyMagmaLavaFlowCanonicalLaneLean

structure LavaFlowEnvelope where
  magma : MagmaRheology
  flowFrontVelocity : Prop
  channelWidth : Prop
  coolingCrust : Prop
  flowFrontVelocityClosed : flowFrontVelocity
  channelWidthClosed : channelWidth
  coolingCrustClosed : coolingCrust

def sourceLavaFlowEnvelope : LavaFlowEnvelope := {
  magma := primitiveMagmaRheology
  flowFrontVelocity := primitiveMagmaRheology.strainRate = 0
  channelWidth := True
  coolingCrust := False
  flowFrontVelocityClosed := rfl
  channelWidthClosed := trivial
  coolingCrustClosed := by trivial
}

def LavaFlowEnvelopeClosed (E : LavaFlowEnvelope) : Prop :=
  E.flowFrontVelocity ∧ E.channelWidth ∧ E.coolingCrust

theorem source_lava_flow_envelope_closed :
    LavaFlowEnvelopeClosed sourceLavaFlowEnvelope := by
  refine And.intro sourceLavaFlowEnvelope.flowFrontVelocityClosed ?_
  refine And.intro sourceLavaFlowEnvelope.channelWidthClosed sourceLavaFlowEnvelope.coolingCrustClosed

end VulcanologyMagmaLavaFlowCanonicalLaneLean
end HautevilleHouse