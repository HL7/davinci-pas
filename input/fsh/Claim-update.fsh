Extension: CareTeamClaimScope
Id: extension-careTeamClaimScope
Description: "A flag that indicates whether the care team applies to the entire claim or a single item."
* value[x] only boolean

Extension: CertificationType
Id: extension-certificationType
Description: "A code representing the type of certification being requested (UM02)"
* value[x] only CodeableConcept
* valueCodeableConcept from https://valueset.x12.org/x217/005010/request/2000F/UM/1/02/00/1322 (required)
* valueCodeableConcept ^binding.description = "Codes indicating the type of certification. These codes are listed within an X12 implementation guide (TR3) and maintained by X12. All X12 work products are copyrighted. See their website for licensing terms and conditions."

Extension: LevelOfServiceCode
Id: extension-levelOfServiceCode
Description: "A code specifying the level of service being requested (UM06)"
* value[x] only CodeableConcept
* valueCodeableConcept from https://valueset.x12.org/x217/005010/request/2000E/UM/1/06/00/1338 (required)
* valueCodeableConcept ^binding.description = "Codes specifying the level of service rendered. These codes are listed within an X12 implementation guide (TR3) and maintained by X12. All X12 work products are copyrighted. See their website for licensing terms and conditions."

Extension: DiagnosisRecordedDate
Id: extension-diagnosisRecordedDate
Description: "The date that a diagnosis was recorded. (HIxx-4)"
* value[x] only date
* valueDate obeys FullDateRule

Extension: ItemTraceNumber
Id: extension-itemTraceNumber
Description: "Uniquely identifies this claim item. (2000F-TRN)"
* value[x] only PASIdentifier

Extension: AuthorizationNumber
Id: extension-authorizationNumber
Description: "A string assigned by the UMO to an authorized review outcome associated with this service item."
* value[x] only string

Extension: AdministrationReferenceNumber
Id: extension-administrationReferenceNumber
Description: "A string assigned by the UMO to the original disallowed review outcome associated with this service item."
* value[x] only string

Extension: ServiceItemRequestType
Id: extension-serviceItemRequestType
Description: "A code that identifies the type of service being requested."
* value[x] only CodeableConcept
* valueCodeableConcept from https://valueset.x12.org/x217/005010/request/2000E/UM/1/01/00/1525 (required)
* valueCodeableConcept ^binding.description = "Codes indicating a type of request. These codes are listed within an X12 implementation guide (TR3) and maintained by X12. All X12 work products are copyrighted. See their website for licensing terms and conditions."

Extension: ProductOrServiceCodeEnd
Id: extension-productOrServiceCodeEnd
Description: "Used to provide the last code in a series of codes for the service being requested."
* value[x] only CodeableConcept
* valueCodeableConcept from X12278RequestedServiceType (required)

Extension: EPSDTIndicator
Id: extension-epsdtIndicator
Description: "An indicator of whether early and periodic screen for diagnosis and treatment of children is involved."
* value[x] only boolean

Extension: NursingHomeResidentialStatus
Id: extension-nursingHomeResidentialStatus
Description: "A code specifying the status of a nursing home resident at the time of service. (SV209)"
* value[x] only CodeableConcept

Extension: NursingHomeLevelOfCare
Id: extension-nursingHomeLevelOfCare
Description: "A code specifying the level of care provided by a nursing home facility. (SV120, SV210)"
* value[x] only CodeableConcept
* valueCodeableConcept from https://valueset.x12.org/x217/005010/request/2000F/SV1/1/20/00/1337 (required)
* valueCodeableConcept ^binding.description = "Codes specifying the level of care provided by a nursing home facility. These codes are listed within an X12 implementation guide (TR3) and maintained by X12. All X12 work products are copyrighted. See their website for licensing terms and conditions."

Extension: RevenueUnitRateLimit
Id: extension-revenueUnitRateLimit
Description: "The limit on the rate per unit of revenue for hospital accomodation. (SV206)"
* value[x] only decimal

Extension: RequestedService
Id: extension-requestedService
Description: "The details of the service being requested."
* value[x] only Reference(PASMedicationRequest or PASServiceRequest or PASDeviceRequest)

Profile: PASClaimUpdate
Parent: PASClaim
Id: profile-claim-update
Title: "PAS Claim Update"
Description: "PAS constraints on Claim resource when submitting an update to a previous PAS prior authorization request"
* supportingInfo.extension contains InfoChanged named infoChanged 0..1
* supportingInfo.extension[infoChanged] ^short = "A code indicating how the piece of information has changed."
* supportingInfo.modifierExtension contains InfoCancelledFlag named infoCancelledFlag 0..1
* supportingInfo.modifierExtension[infoCancelledFlag] ^short = "Indicates that this piece of information is not to be used."
* item.extension contains InfoChanged named infoChanged 0..1
* item.extension[infoChanged] ^short = "A code indicating how the piece of information has changed."
* item.modifierExtension contains InfoCancelledFlag named infoCancelledFlag 0..1
* item.modifierExtension[infoCancelledFlag] ^short = "Indicates that this piece of information is not to be used."

Extension: InfoChanged
Id: extension-infoChanged
Description: "A code indicating how the piece of information has changed."
* value[x] only code
* valueCode from PASInformationChangeMode (required)

Extension: InfoCancelledFlag
Id: modifierextension-infoCancelled
Description: "A flag indicating whether the piece of information was cancelled."
* . ^isModifier = true
* . ^isModifierReason = "Indicates that this piece of information is not to be used."
* value[x] only boolean

Extension: CertificationIssueDate
Id: extension-itemCertificationIssueDate
Description: "The specific date or period within which this item's preauthorization was issued."
* value[x] only date or Period
* valueDate obeys FullDateRule
* valuePeriod.start obeys FullDateRule
* valuePeriod.end obeys FullDateRule

Extension: CertificationExpirationDate
Id: extension-itemCertificationExpirationDate
Description: "The specific date or period within which this item's preauthorization expires."
* value[x] only date or Period
* valueDate obeys FullDateRule
* valuePeriod.start obeys FullDateRule
* valuePeriod.end obeys FullDateRule

Extension: CertificationEffectiveDate
Id: extension-itemCertificationEffectiveDate
Description: "The specific date or period within which this item's preauthorization became effective."
* value[x] only date or Period
* valueDate obeys FullDateRule
* valuePeriod.start obeys FullDateRule
* valuePeriod.end obeys FullDateRule

Invariant: FullDateRule
Description: "Dates need to be a full date - YYYY-MM-DD"
Expression: "this.empty() or this.length() = 10"
Severity: #error
