Extension: TransmissionIdentifiers
Id: extension-TransmissionIdentifiers
Title: "Transmission Identifiers"
Description: "Identifiers used for transmission tracking.  Used in the X12 GS and ISA header segments."
* ^context[+].type = #element
* ^context[=].expression = "Claim"
* ^context[+].type = #element
* ^context[=].expression = "ClaimResponse"
* extension contains applicationSenderCode 1..1 and applicationReceiverCode 1..1
    and interchangeSenderID 0..1 and interchangeReceiverID 0..1
* extension[applicationSenderCode].value[x] only string
* extension[applicationSenderCode] ^short = "Application Sender's Code (GS02)"
* extension[applicationReceiverCode].value[x] only string
* extension[applicationReceiverCode] ^short = "Application Receiver's Code (GS03)"
* extension[interchangeSenderID].value[x] only string
* extension[interchangeSenderID] ^short = "Interchange Sender ID (ISA06)"
* extension[interchangeReceiverID].value[x] only string
* extension[interchangeReceiverID] ^short = "Interchange Receiver ID (ISA08)"

Extension: CareTeamClaimScope
Id: extension-careTeamClaimScope
Title: "Care Team Claim Scope"
Description: "A flag that indicates whether the care team applies to the entire claim or a single item."
* value[x] only boolean
* ^context[+].type = #element
* ^context[=].expression = "Claim.careTeam"

Extension: CertificationType
Id: extension-certificationType
Title: "Certification Type"
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
Title: "Level of Service Code"
Description: "A code specifying the level of service being requested (UM06)"
* value[x] only CodeableConcept
* valueCodeableConcept from https://valueset.x12.org/x217/005010/request/2000E/UM/1/06/00/1338 (required)
* valueCodeableConcept ^binding.description = "Codes specifying the level of service rendered. These codes are listed within an X12 implementation guide (TR3) and maintained by X12. All X12 work products are copyrighted. See their website for licensing terms and conditions."
* ^context[+].type = #element
* ^context[=].expression = "Claim"

Extension: DiagnosisRecordedDate
Id: extension-diagnosisRecordedDate
Title: "Diagnosis Recorded Date"
Description: "The date that a diagnosis was recorded. (HIxx-4)"
* value[x] only date
* valueDate obeys FullDateRule
* ^context[+].type = #element
* ^context[=].expression = "Claim.diagnosis"

Extension: ItemTraceNumber
Id: extension-itemTraceNumber
Title: "Item Trace Number"
Description: "Uniquely identifies this claim item. (2000F-TRN)"
* value[x] only PASIdentifier
* ^context[+].type = #element
* ^context[=].expression = "Claim.item"
* ^context[+].type = #element
* ^context[=].expression = "ClaimResponse.item"
* ^context[+].type = #element
* ^context[=].expression = "ClaimResponse.addItem"
* ^context[+].type = #element
* ^context[=].expression = "ExplanationOfBenefit.item"

Extension: AuthorizationNumber
Id: extension-authorizationNumber
Title: "Authorization Number"
Description: "A string assigned by the UMO to an authorized review outcome associated with this service item."
* value[x] only string
* ^context[+].type = #element
* ^context[=].expression = "Claim.item"
* ^context[+].type = #element
* ^context[=].expression = "ClaimResponse.item"
* ^context[+].type = #element
* ^context[=].expression = "ClaimResponse.addItem"
* ^context[+].type = #element
* ^context[=].expression = "ExplanationOfBenefit.item"

Extension: AdministrationReferenceNumber
Id: extension-administrationReferenceNumber
Title: "Administration Reference Number"
Description: "A string assigned by the UMO to the original disallowed review outcome associated with this service item."
* value[x] only string
* ^context[+].type = #element
* ^context[=].expression = "Claim.item"
* ^context[+].type = #element
* ^context[=].expression = "ClaimResponse.item"
* ^context[+].type = #element
* ^context[=].expression = "ClaimResponse.addItem"
* ^context[+].type = #element
* ^context[=].expression = "ExplanationOfBenefit.item"

Extension: ServiceItemRequestType
Id: extension-serviceItemRequestType
Title: "Service Item Request Type"
Description: "A code that identifies the type of service being requested."
* value[x] only CodeableConcept
* valueCodeableConcept from https://valueset.x12.org/x217/005010/request/2000E/UM/1/01/00/1525 (required)
* valueCodeableConcept ^binding.description = "Codes indicating a type of request. These codes are listed within an X12 implementation guide (TR3) and maintained by X12. All X12 work products are copyrighted. See their website for licensing terms and conditions."
* ^context[+].type = #element
* ^context[=].expression = "Claim.item"

Extension: ProductOrServiceCodeEnd
Id: extension-productOrServiceCodeEnd
Title: "Product or Service Code End"
Description: "Used to provide the last code in a series of codes for the service being requested."
* value[x] only CodeableConcept
* valueCodeableConcept from X12278RequestedServiceType (required)
* ^context[+].type = #element
* ^context[=].expression = "Claim.item"
* ^context[+].type = #element
* ^context[=].expression = "ClaimResponse"

Extension: EPSDTIndicator
Id: extension-epsdtIndicator
Title: "EPSDT Indicator"
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
Title: "Nursing Home Residential Status"
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
Title: "Nursing Home Level of Care"
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
Title: "Revenue Unit Rate Limit"
Description: "The limit on the rate per unit of revenue for hospital accomodation. (SV206)"
* value[x] only decimal
* ^context[+].type = #element
* ^context[=].expression = "Claim.item"
* ^context[+].type = #element
* ^context[=].expression = "ClaimResponse"

Extension: RequestedService
Id: extension-requestedService
Title: "Requested Service"
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
Title: "Condition Code"
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
Title: "Home Health Care Information"
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
Description: """This profile defines constraints and extensions used when updating a previously submitted Claim instance."""
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
Title: "Information Change Mode"
Description: "A code indicating how the piece of information has changed."
* value[x] only code
* valueCode from PASInformationChangeMode (required)
* ^context[+].type = #element
* ^context[=].expression = "Claim.item"

//modified
Extension: InfoCancelledFlag
Id: modifierextension-infoCancelled
Title: "Information Cancelled Flag"
Description: "A flag indicating whether the piece of information was cancelled."
* . ^isModifier = true
* . ^isModifierReason = "Indicates that this piece of information is not to be used."
* value[x] only boolean
* ^context[+].type = #element
* ^context[=].expression = "Claim.item"

Extension: CertificationIssueDate
Id: extension-itemCertificationIssueDate
Title: "Certification Issue Date"
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
Title: "Certification Expiration Date"
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
Title: "Certification Effective Date"
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
