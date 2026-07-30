import VulcanologyMagmaLavaFlowCanonicalLaneLean.MagmaGasExsolutionLayer

namespace HautevilleHouse
namespace VulcanologyMagmaLavaFlowCanonicalLaneLean

structure EruptionColumnCertificate where
  gasExsolution : GasExsolutionCertificate
  columnHeight : Prop
  entrainmentRate : Prop
  collapsePotential : Prop
  columnHeightClosed : columnHeight
  entrainmentRateClosed : entrainmentRate
  collapsePotentialClosed : collapsePotential

def sourceEruptionColumnCertificate : EruptionColumnCertificate := {
  gasExsolution := sourceGasExsolutionCertificate
  columnHeight := sourceGasExsolutionCertificate.solubilityModel
  entrainmentRate := sourceGasExsolutionCertificate.bubbleNucleation
  collapsePotential := sourceGasExsolutionCertificate.bubbleGrowth
  columnHeightClosed := sourceGasExsolutionCertificate.solubilityModelClosed
  entrainmentRateClosed := sourceGasExsolutionCertificate.bubbleNucleationClosed
  collapsePotentialClosed := sourceGasExsolutionCertificate.bubbleGrowthClosed
}

def EruptionColumnClosed (C : EruptionColumnCertificate) : Prop :=
  GasExsolutionClosed C.gasExsolution ∧
  C.columnHeight ∧
  C.entrainmentRate ∧
  C.collapsePotential

theorem source_eruption_column_closed :
    EruptionColumnClosed sourceEruptionColumnCertificate := by
  exact And.intro source_gas_exsolution_closed
    (And.intro sourceEruptionColumnCertificate.columnHeightClosed
      (And.intro sourceEruptionColumnCertificate.entrainmentRateClosed
        sourceEruptionColumnCertificate.collapsePotentialClosed))

end VulcanologyMagmaLavaFlowCanonicalLaneLean
end HautevilleHouse