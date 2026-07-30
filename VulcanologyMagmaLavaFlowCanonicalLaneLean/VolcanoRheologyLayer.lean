import VulcanologyMagmaLavaFlowCanonicalLaneLean.MagmaPropertyFields
import Mathlib.Data.Real.Basic

namespace HautevilleHouse
namespace VulcanologyMagmaLavaFlowCanonicalLaneLean

structure RheologyCertificate where
  magma : MagmaProperties
  flow : LavaFlowProperties
  nonNewtonianIndex : ℝ
  yieldStress : ℝ
  strainRate : ℝ → ℝ
  viscosityModel : ℝ → ℝ
  nonNewtonianIndexClosed : nonNewtonianIndex > 0 ∧ nonNewtonianIndex < 1
  yieldStressClosed : yieldStress ≥ 0
  strainRateClosed : ∀ t, strainRate t ≥ 0

def sourceRheologyCertificate : RheologyCertificate := {
  magma := primitiveMagma
  flow := primitiveLavaFlow
  nonNewtonianIndex := 0.5
  yieldStress := 100
  strainRate := λ _ => 0.01
  viscosityModel := λ τ => if τ ≤ 100 then 1000 else 1000 / (τ / 100)
  nonNewtonianIndexClosed := by
    refine And.intro ?_ ?_ <;> native_decide
  yieldStressClosed := by native_decide
  strainRateClosed := by intro t; native_decide
}

def RheologyClosed (C : RheologyCertificate) : Prop :=
  C.nonNewtonianIndexClosed ∧ C.yieldStressClosed ∧ C.strainRateClosed

theorem source_rheology_closed : RheologyClosed sourceRheologyCertificate := by
  unfold RheologyClosed
  refine And.intro ?_ ?_
  · exact sourceRheologyCertificate.nonNewtonianIndexClosed
  · refine And.intro ?_ ?_
    · exact sourceRheologyCertificate.yieldStressClosed
    · exact sourceRheologyCertificate.strainRateClosed

def ShearThinning (C : RheologyCertificate) : Prop :=
  C.nonNewtonianIndex < 1

def YieldStressExceeded (C : RheologyCertificate) (appliedStress : ℝ) : Prop :=
  appliedStress > C.yieldStress

theorem source_shear_thinning_checked : ShearThinning sourceRheologyCertificate := by
  unfold ShearThinning; native_decide

end HautevilleHouse
end VulcanologyMagmaLavaFlowCanonicalLaneLean