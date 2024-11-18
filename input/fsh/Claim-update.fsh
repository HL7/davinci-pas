Extension: CareTeamClaimScope
Id: extension-careTeamClaimScope
Description: "A flag that indicates whether the care team applies to the entire claim or a single item."
* value[x] only boolean
* ^context[+].type = #element
* ^context[=].expression = "ExplanationOfBenefit"
* ^context[+].type = #element
* ^context[=].expression = "Claim.careTeam"

Extension: CertificationType
Id: extension-certificationType
Description: "A code representing the type of certification being requested (UM02)"
* value[x] only CodeableConcept
* valueCodeableConcept from https://valueset.x12.org/x217/005010/request/2000F/UM/1/02/00/1322 (required)
* valueCodeableConcept ^binding.description = "Codes indicating the type of certification. These codes are listed within an X12 implementation guide (TR3) and maintained by X12. All X12 work products are copyrighted. See their website for licensing terms and conditions."
* ^context[+].type = #element
* ^context[=].expression = "Claim"
* ^context[+].type = #element
* ^context[=].expression = "ExplanationOfBenefit"
* ^context[+].type = #element
* ^context[=].expression = "Claim.item"

Extension: LevelOfServiceCode
Id: extension-levelOfServiceCode
Description: "A code specifying the level of service being requested (UM06)"
* value[x] only CodeableConcept
* valueCodeableConcept from https://valueset.x12.org/x217/005010/request/2000E/UM/1/06/00/1338 (required)
* valueCodeableConcept ^binding.description = "Codes specifying the level of service rendered. These codes are listed within an X12 implementation guide (TR3) and maintained by X12. All X12 work products are copyrighted. See their website for licensing terms and conditions."
* ^context[+].type = #element
* ^context[=].expression = "Claim"

Extension: DiagnosisRecordedDate
Id: extension-diagnosisRecordedDate
Description: "The date that a diagnosis was recorded. (HIxx-4)"
* value[x] only date
* valueDate obeys FullDateRule
* ^context[+].type = #element
* ^context[=].expression = "Claim.diagnosis"

Extension: ItemTraceNumber
Id: extension-itemTraceNumber
Description: "Uniquely identifies this claim item. (2000F-TRN)"
* value[x] only PASIdentifier
* ^context[+].type = #element
* ^context[=].expression = "Claim.item"
* ^context[+].type = #element
* ^context[=].expression = "ClaimResponse.item"
* ^context[+].type = #element
* ^context[=].expression = "ClaimResponse.addItem"
* ^context[+].type = #element
* ^context[=].expression = "ExplanationOfBenefit"

Extension: AuthorizationNumber
Id: extension-authorizationNumber
Description: "A string assigned by the UMO to an authorized review outcome associated with this service item."
* value[x] only string
* ^context[+].type = #element
* ^context[=].expression = "Claim.item"
* ^context[+].type = #element
* ^context[=].expression = "ClaimResponse.item"
* ^context[+].type = #element
* ^context[=].expression = "ClaimResponse.addItem"
* ^context[+].type = #element
* ^context[=].expression = "ExplanationOfBenefit"

Extension: AdministrationReferenceNumber
Id: extension-administrationReferenceNumber
Description: "A string assigned by the UMO to the original disallowed review outcome associated with this service item."
* value[x] only string
* ^context[+].type = #element
* ^context[=].expression = "Claim.item"
* ^context[+].type = #element
* ^context[=].expression = "ClaimResponse.item"
* ^context[+].type = #element
* ^context[=].expression = "ClaimResponse.addItem"
* ^context[+].type = #element
* ^context[=].expression = "ExplanationOfBenefit"

Extension: ServiceItemRequestType
Id: extension-serviceItemRequestType
Description: "A code that identifies the type of service being requested."
* value[x] only CodeableConcept
* valueCodeableConcept from https://valueset.x12.org/x217/005010/request/2000E/UM/1/01/00/1525 (required)
* valueCodeableConcept ^binding.description = "Codes indicating a type of request. These codes are listed within an X12 implementation guide (TR3) and maintained by X12. All X12 work products are copyrighted. See their website for licensing terms and conditions."
* ^context[+].type = #element
* ^context[=].expression = "Claim.item"

Extension: ProductOrServiceCodeEnd
Id: extension-productOrServiceCodeEnd
Description: "Used to provide the last code in a series of codes for the service being requested."
* value[x] only CodeableConcept
* valueCodeableConcept from X12278RequestedServiceType (required)
* ^context[+].type = #element
* ^context[=].expression = "Claim.item"
* ^context[+].type = #element
* ^context[=].expression = "ClaimResponse"

Extension: EPSDTIndicator
Id: extension-epsdtIndicator
Description: "An indicator of whether early and periodic screen for diagnosis and treatment of children is involved."
* value[x] only boolean
* ^context[+].type = #element
* ^context[=].expression = "Claim.item"
* ^context[+].type = #element
* ^context[=].expression = "ClaimResponse"
* ^context[+].type = #element
* ^context[=].expression = "ClaimResponse.addItem"

Extension: NursingHomeResidentialStatus
Id: extension-nursingHomeResidentialStatus
Description: "A code specifying the status of a nursing home resident at the time of service. (SV209)"
* value[x] only CodeableConcept
* ^context[+].type = #element
* ^context[=].expression = "Claim.item"
* ^context[+].type = #element
* ^context[=].expression = "ClaimResponse.addItem"
* ^context[+].type = #element
* ^context[=].expression = "Encounter"

Extension: NursingHomeLevelOfCare
Id: extension-nursingHomeLevelOfCare
Description: "A code specifying the level of care provided by a nursing home facility. (SV120, SV210)"
* value[x] only CodeableConcept
* valueCodeableConcept from https://valueset.x12.org/x217/005010/request/2000F/SV1/1/20/00/1337 (required)
* valueCodeableConcept ^binding.description = "Codes specifying the level of care provided by a nursing home facility. These codes are listed within an X12 implementation guide (TR3) and maintained by X12. All X12 work products are copyrighted. See their website for licensing terms and conditions."
* ^context[+].type = #element
* ^context[=].expression = "Claim.item"
* ^context[+].type = #element
* ^context[=].expression = "ClaimResponse.addItem"
* ^context[+].type = #element
* ^context[=].expression = "ClaimResponse"

Extension: RevenueUnitRateLimit
Id: extension-revenueUnitRateLimit
Description: "The limit on the rate per unit of revenue for hospital accomodation. (SV206)"
* value[x] only decimal
* ^context[+].type = #element
* ^context[=].expression = "Claim.item"
* ^context[+].type = #element
* ^context[=].expression = "ClaimResponse"

Extension: RequestedService
Id: extension-requestedService
Description: "The details of the service being requested."
* ^context[+].type = #element
* ^context[=].expression = "Claim.item"
* ^context[+].type = #element
* ^context[=].expression = "ClaimResponse.item"
* ^context[+].type = #element
* ^context[=].expression = "ClaimResponse.addItem"
* value[x] only Reference(PASMedicationRequest or PASServiceRequest or PASDeviceRequest or PASNutritionOrder)

Extension: ConditionCode
Id: extension-conditionCode
Description: "Information to supply various patient conditions."
* ^context[+].type = #element
* ^context[=].expression = "Claim"
* extension contains category 1..1 and indicator 1..1 and code 1..*
* extension[category].value[x] only CodeableConcept
* extension[category].valueCodeableConcept from X12278ConditionCategory (required)
* extension[category] ^short = "Condition Code Category (CRC01)"
* extension[indicator] ^short = "Certification Condition Indicator (CRC02)"
* extension[indicator].value[x] only boolean
* extension[code].value[x] only CodeableConcept
* extension[code].valueCodeableConcept from X12278ConditionCode (required)
* extension[code] ^short = "Condition Code (CRC03)"

Extension: HomeHealthCareInformation
Id: extension-homeHealthCareInformation
Description: "Information needed for home health care requests."
* ^context[+].type = #element
* ^context[=].expression = "Claim"
* extension contains prognosis 1..1 and date 1..1
* extension[prognosis].value[x] only CodeableConcept
* extension[prognosis].valueCodeableConcept from https://valueset.x12.org/x217/005010/request/2000E/CR6/1/01/00/923 (required)
* extension[prognosis] ^short = "Prognosis Code (CR601)"
* extension[date].value[x] only date
* extension[date].valueDate obeys FullDateRule
* extension[date] ^short = "Home Health Start Date"


Profile: PASClaimUpdate
Parent: PASClaimBase
Id: profile-claim-update
Title: "PAS Claim Update"
Description: """This profile defines constraints and extensions used when update a previously submitted Claim instance.

* The Claim instance of the update Bundle SHALL reference the updated Claim instance within the `Claim.related.claim` element. Note that the presence of this reference and the requirement that referenced instances be included in the submitted Bundle implies that the instance representing the prior version of the Claim SHALL be included in the update Bundle.
* The Claim instance of the update Bundle SHALL contain within the `Claim.item` element each item requested in the updated claim and any prior versions of the claim, including requested items that have been added, modified, deleted, or left unchanged during this or previous updates.
* The Claim instance of the update Bundle SHALL contain within the `Claim.supportingInfo` element each piece of supporting documentation submitted with the updated claim and any prior versions of claim, including supporting documentation that has been added, modified, deleted, or left unchanged during this or previous updates.
* Each `Claim.item` entry that represents an item no longer being requested, whether removed in this update or a previous one, SHALL be flagged using the infoCancelledFlag modifierExtension and SHALL have the code `3` (Cancel) in the Certification Type extension.
* Each `Claim.supportingInfo` entry that is no longer to be used when evaluating the request, whether removed in this update or a previous one, SHALL be flagged using the infoCancelledFlag modifierExtension.
* Each `Claim.item` and `Claim.supportingInfo` entry that has been changed as a part of this most recent update, including removal, SHALL be flagged using the changed extension with a value of `changed`.
* Each `Claim.item` and `Claim.supportingInfo` entry that has been added as a part of this most recent update, SHALL be flagged using the changed extension with a value of `added`.
"""
* insert CommonClaimElements
* extension contains CertificationType named certificationType 0..1 MS
* extension[certificationType] ^short = "A code representing the type of certification being requested (UM02)"

* supportingInfo.extension contains InfoChanged named infoChanged 0..1 MS
* supportingInfo.extension[infoChanged] ^short = "A code indicating how the piece of information has changed."
* supportingInfo.modifierExtension contains InfoCancelledFlag named infoCancelledFlag 0..1 MS
* supportingInfo.modifierExtension[infoCancelledFlag] ^short = "Indicates that this piece of information is not to be used."
* item.extension contains InfoChanged named infoChanged 0..1 MS
* item.extension[infoChanged] ^short = "A code indicating how the piece of information has changed."
* item.modifierExtension contains InfoCancelledFlag named infoCancelledFlag 0..1 MS
* item.modifierExtension[infoCancelledFlag] ^short = "Indicates that this piece of information is not to be used."
* related 1..1 MS
* related.relationship 1..1 MS
* related.relationship = http://terminology.hl7.org/CodeSystem/ex-relatedclaimrelationship#prior
* related.claim 1..1 MS

//modified
Extension: InfoChanged
Id: extension-infoChanged
Description: "A code indicating how the piece of information has changed."
* value[x] only code
* valueCode from PASInformationChangeMode (required)
* ^context[+].type = #element
* ^context[=].expression = "Claim-update.item"
* ^context[+].type = #element
* ^context[=].expression = "ExplanationOfBenefit"
* ^context[+].type = #element
* ^context[=].expression = "Claim.item"

//modified
Extension: InfoCancelledFlag
Id: modifierextension-infoCancelled
Description: "A flag indicating whether the piece of information was cancelled."
* . ^isModifier = true
* . ^isModifierReason = "Indicates that this piece of information is not to be used."
* value[x] only boolean
* ^context[+].type = #element
* ^context[=].expression = "Claim-update.item"
* ^context[+].type = #element
* ^context[=].expression = "ExplanationOfBenefit"
* ^context[+].type = #element
* ^context[=].expression = "Claim.item"

Extension: CertificationIssueDate
Id: extension-itemCertificationIssueDate
Description: "The specific date or period within which this item's preauthorization was issued."
* value[x] only date or Period
* valueDate obeys FullDateRule
* valuePeriod.start obeys FullDateRule
* valuePeriod.end obeys FullDateRule
* ^context[+].type = #element
* ^context[=].expression = "Claim"
* ^context[+].type = #element
* ^context[=].expression = "Claim.item"

Extension: CertificationExpirationDate
Id: extension-itemCertificationExpirationDate
Description: "The specific date or period within which this item's preauthorization expires."
* value[x] only date or Period
* valueDate obeys FullDateRule
* valuePeriod.start obeys FullDateRule
* valuePeriod.end obeys FullDateRule
* ^context[+].type = #element
* ^context[=].expression = "Claim"
* ^context[+].type = #element
* ^context[=].expression = "Claim.item"

Extension: CertificationEffectiveDate
Id: extension-itemCertificationEffectiveDate
Description: "The specific date or period within which this item's preauthorization became effective."
* value[x] only date or Period
* valueDate obeys FullDateRule
* valuePeriod.start obeys FullDateRule
* valuePeriod.end obeys FullDateRule
* ^context[+].type = #element
* ^context[=].expression = "Claim"
* ^context[+].type = #element
* ^context[=].expression = "Claim.item"

Invariant: FullDateRule
Description: "Dates need to be a full date - YYYY-MM-DD"
Expression: "$this.toString().length() = 10"
Severity: #error
