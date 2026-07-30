import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace VulcanologyMagmaLavaFlowCanonicalLaneLean

structure HazardRiskCertificate where
  eruptionIntensity : ℝ
  impactedArea : ℝ
  populationExposed : ℕ
  infrastructureValue : ℝ
  hazardLevel : ℝ
  riskScore : ℝ
  intensityClosed : eruptionIntensity > 0.0
  areaClosed : impactedArea > 0.0
  populationClosed : populationExposed > 0
  infrastructureClosed : infrastructureValue > 0.0
  hazardClosed : hazardLevel > 0.0
  riskClosed : riskScore > 0.0

def sourceHazardRiskCertificate : HazardRiskCertificate := {
  eruptionIntensity := 5.0,
  impactedArea := 100.0,
  populationExposed := 50000,
  infrastructureValue := 1.0e9,
  hazardLevel := 0.8,
  riskScore := 0.6,
  intensityClosed := by norm_num,
  areaClosed := by norm_num,
  populationClosed := by norm_num,
  infrastructureClosed := by norm_num,
  hazardClosed := by norm_num,
  riskClosed := by norm_num
}

structure HazardModel (C : HazardRiskCertificate) : Prop where
  intensityScale : C.eruptionIntensity > 0.0 ∧ C.eruptionIntensity ≤ 10.0
  areaScale : C.impactedArea > 0.0 ∧ C.impactedArea ≤ 1000.0
  riskProportional : C.riskScore = C.hazardLevel * (C.populationExposed.toNat / 100000 + C.infrastructureValue / 1.0e9)

default instance : HazardModel sourceHazardRiskCertificate := by
  refine {
    intensityScale := by
      constructor <;> norm_num,
    areaScale := by
      constructor <;> norm_num,
    riskProportional := by
      simp [sourceHazardRiskCertificate]
      norm_num
  }

structure RiskAssessmentClosed (C : HazardRiskCertificate) : Prop :=
  hazardPos : C.hazardLevel > 0.0
  riskPos : C.riskScore > 0.0
  modelConsistent : HazardModel C

theorem source_risk_assessment_closed : RiskAssessmentClosed sourceHazardRiskCertificate := by
  refine {
    hazardPos := by norm_num,
    riskPos := by norm_num,
    modelConsistent := inferInstance
  }

end VulcanologyMagmaLavaFlowCanonicalLaneLean
end HautevilleHouse