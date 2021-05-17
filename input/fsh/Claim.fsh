Profile: PASClaim
Parent: Claim
Id: profile-claim
Title: "PAS Claim"
Description: "PAS constraints on Claim resource mandating support for elements relevant to the prior authorization request"
* extension contains LevelOfServiceCode named levelOfServiceType 0..1 MS
* extension[levelOfServiceType] ^short = "A code specifying the level of service being requested (UM06)"
* identifier 1..1 MS
* identifier only PASIdentifier
* status = #active (exactly)
* use = #preauthorization (exactly)
* patient only Reference(PASBeneficiary)
* insurer MS
* insurer only Reference(PASInsurer)
* provider MS
* provider only Reference(PASRequestor)
* careTeam MS
* careTeam.sequence MS
* careTeam.provider MS
* careTeam.provider only Reference(PASPractitioner or PASOrganization)
* careTeam.role MS
* careTeam.role from https://valueset.x12.org/x217/005010/request/2010F/NM1/1/01/00/98 (required)
* careTeam.role  ^binding.description = "Codes identifying an organizational entity, a physical location, property or an individual. These codes are listed within an X12 implementation guide (TR3) and maintained by X12. All X12 work products are copyrighted. See their website for licensing terms and conditions."
* careTeam.qualification MS
* careTeam.qualification from https://valueset.x12.org/x217/005010/request/2010F/PRV/1/03/00/127 (required)
* careTeam.role  ^binding.description = "Codes identifying a provider specialty. These codes are listed within an X12 implementation guide (TR3) and maintained by X12. All X12 work products are copyrighted. See their website for licensing terms and conditions."
* supportingInfo MS
* supportingInfo.sequence MS
* supportingInfo.category MS
* supportingInfo.category from PASSupportingInfoType (extensible)
* diagnosis MS
* diagnosis.extension contains DiagnosisRecordedDate named recordedDate 0..1 MS
* diagnosis.extension[recordedDate] ^short = "The date that a diagnosis was recorded. (HIxx-4)"
* diagnosis.sequence MS
* diagnosis.diagnosis[x] MS
* diagnosis.diagnosis[x] only CodeableConcept
* diagnosis.diagnosisCodeableConcept from X12278DiagnosisCodes (required)
* diagnosis.type 0..1 MS
* diagnosis.type from X12278DiagnosisType (required)
* insurance MS
* insurance.sequence MS
* insurance.focal = true (exactly)
* insurance.coverage MS
* insurance.coverage only Reference(PASCoverage)
* accident MS
* accident.date MS
* accident.type MS
* accident.type from https://valueset.x12.org/x217/005010/request/2000E/UM/1/05/01/1362 (required)
* accident.type ^binding.description = "Codes identifying an accompanying cause of an illness, injury or an accident. These codes are listed within an X12 implementation guide (TR3) and maintained by X12. All X12 work products are copyrighted. See their website for licensing terms and conditions."
* accident.location[x] only Address
* item 1..* MS
* item.extension contains ItemTraceNumber named itemTraceNumber 0..1 MS and
	AuthorizationNumber named authorizationNumber 0..1 MS and
	AdministrationReferenceNumber named administrationReferenceNumber 0..1 MS and
	ServiceItemRequestType named requestType 0..1 MS and
	CertificationType named certificationType 0..1 MS and
	ProductOrServiceCodeEnd named productOrServiceCodeEnd 0..1 MS and
	EPSDTIndicator named epsdtIndicator 0..1 MS and
	NursingHomeResidentialStatus named nursingHomeResidentialStatus 0..1 MS and
	NursingHomeLevelOfCare named nursingHomeLevelOfCare 0..1 MS and
	RevenueUnitRateLimit named revenueUnitRateLimit 0..1 MS and
	RequestedService named requestedService 0..1 MS
* item.extension[nursingHomeResidentialStatus].valueCodeableConcept from https://valueset.x12.org/x217/005010/request/2000F/SV2/1/09/00/1345 (required)
* item.extension[nursingHomeResidentialStatus].valueCodeableConcept  ^binding.description = "Codes specifying the status of a nursing home resident at the time of service. These codes are listed within an X12 implementation guide (TR3) and maintained by X12. All X12 work products are copyrighted. See their website for licensing terms and conditions."
* item.extension[itemTraceNumber] ^short = "Uniquely identifies this claim item. (2000F-TRN)"
* item.extension[authorizationNumber] ^short = "A string assigned by the UMO to an authorized review outcome associated with this service item."
* item.extension[administrationReferenceNumber] ^short = "A string assigned by the UMO to the original disallowed review outcome associated with this service item."
* item.extension[requestType] ^short = "A string assigned by the UMO to the original disallowed review outcome associated with this service item."
* item.extension[certificationType] ^short = "A code representing the type of certification being requested (UM02)"
* item.extension[productOrServiceCodeEnd] ^short = "Used to provide the last code in a series of codes for the service being requested."
* item.extension[epsdtIndicator] ^short = "An indicator of whether early and periodic screen for diagnosis and treatment of children is involved."
* item.extension[nursingHomeResidentialStatus] ^short = "A code specifying the status of a nursing home resident at the time of service. (SV209)"
* item.extension[nursingHomeLevelOfCare] ^short = "A code specifying the level of care provided by a nursing home facility. (SV120, SV210)"
* item.extension[revenueUnitRateLimit] ^short = "The limit on the rate per unit of revenue for hospital accomodation. (SV206)"
* item.extension[requestedService] ^short = "The details of the service being requested."

* item.sequence MS
* item.careTeamSequence MS
* item.diagnosisSequence MS
* item.informationSequence MS
* item.revenue MS
* item.revenue from AHANUBCRevenueCodes (required)
* item.category MS
* item.category from https://valueset.x12.org/x217/005010/request/2000F/UM/1/03/00/1365 (required)
* item.category ^binding.description = "Codes identifying the classification of service. These codes are listed within an X12 implementation guide (TR3) and maintained by X12. All X12 work products are copyrighted. See their website for licensing terms and conditions."
* item.productOrService MS
* item.productOrService from X12278RequestedServiceType (required)
* item.modifier MS
* item.modifier from X12278RequestedServiceModifierType (required)
* item.serviced[x] MS
* item.location[x] MS
* item.location[x] only CodeableConcept
* item.locationCodeableConcept from X12278LocationType (required)
* item.quantity MS
* item.unitPrice MS

* supportingInfo ^slicing.discriminator.type = #value
* supportingInfo ^slicing.discriminator.path = "category"
* supportingInfo ^slicing.rules = #open
* supportingInfo ^slicing.description = "Slice based on the different types of supporting information that can be included in a authorization request."
* supportingInfo contains PatientEvent 0..1 and AdmissionDates 0..1 and DischargeDates 0..1 and AdditionalInformation 0..1 and MessageText 0..1 and InstitutionalEncounter 0..1

* supportingInfo[PatientEvent] ^short = "Information about the dates of the event that are being requested."
* supportingInfo[PatientEvent].category = PASSupportingInfoType#patientEvent
* supportingInfo[PatientEvent].timing[x] 1..1 MS
* supportingInfo[PatientEvent].timingDate obeys FullDateRule
* supportingInfo[PatientEvent].timingPeriod.start obeys FullDateRule
* supportingInfo[PatientEvent].timingPeriod.end obeys FullDateRule
* supportingInfo[PatientEvent].value[x] 0..0

* supportingInfo[AdmissionDates] ^short = "Information about the admission dates of a hospital admission being requested."
* supportingInfo[AdmissionDates].category = PASSupportingInfoType#admissionDates
* supportingInfo[AdmissionDates].timing[x] 1..1 MS
* supportingInfo[AdmissionDates].timingDate obeys FullDateRule
* supportingInfo[AdmissionDates].timingPeriod.start obeys FullDateRule
* supportingInfo[AdmissionDates].timingPeriod.end obeys FullDateRule
* supportingInfo[AdmissionDates].value[x] 0..0

* supportingInfo[DischargeDates] ^short = "Information about the discharge dates of a hospital admission being requested."
* supportingInfo[DischargeDates].category = PASSupportingInfoType#dischargeDates
* supportingInfo[DischargeDates].timing[x] 1..1 MS
* supportingInfo[DischargeDates].timingDate obeys FullDateRule
* supportingInfo[DischargeDates].timingPeriod.start obeys FullDateRule
* supportingInfo[DischargeDates].timingPeriod.end obeys FullDateRule
* supportingInfo[DischargeDates].value[x] 0..0

* supportingInfo[AdditionalInformation] ^short = "Send additional paperwork or supporting information for the request.  This can be most commonly a PASDocumentReference profile although any type of information is allowed."
* supportingInfo[AdditionalInformation].category = PASSupportingInfoType#additionalInformation
* supportingInfo[AdditionalInformation].timing[x] 0..0
* supportingInfo[AdditionalInformation].value[x] 1..1 MS
* supportingInfo[AdditionalInformation].value[x] only Reference
* supportingInfo[AdditionalInformation].value[x] ^comment = "Although we allow of any type of information to be sent, when sending reference to documents, the PASDocumentReference profile should be used."

* supportingInfo[MessageText] ^short = "Send text messages to the UMO."
* supportingInfo[MessageText].category = PASSupportingInfoType#freeFormMessage
* supportingInfo[MessageText].timing[x] 0..0
* supportingInfo[MessageText].value[x] 1..1 MS
* supportingInfo[MessageText].value[x] only string

* supportingInfo[InstitutionalEncounter] ^short = "Information about a hospital claim being requested."
* supportingInfo[InstitutionalEncounter].category = PASSupportingInfoType#institutionalEncounter
* supportingInfo[InstitutionalEncounter].timing[x] 0..0
* supportingInfo[InstitutionalEncounter].value[x] 1..1 MS
* supportingInfo[InstitutionalEncounter].value[x] only Reference(PASEncounter)

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


Profile: PASClaimInquiry
Parent: Claim
Id: profile-claim-inquiry
Title: "PAS Claim Inquiry"
Description: "PAS constraints on Claim resource when submitting an inquiry for existing authorizations."
* extension contains CertificationType named certificationType 0..1 MS and
	LevelOfServiceCode named levelOfServiceType 0..1 MS
* extension[levelOfServiceType] ^short = "A code specifying the level of service being requested (UM06)"
* extension[certificationType] ^short = "A code representing the type of certification being requested (UM02)"
* identifier 0..1 MS
* identifier only PASIdentifier
* use = #preauthorization (exactly)
* patient only Reference(PASBeneficiary)
* billablePeriod MS
* insurer MS
* insurer only Reference(PASInsurer)
* provider MS
* provider only Reference(PASRequestor)
* careTeam MS
* careTeam.sequence MS
* careTeam.provider MS
* careTeam.provider only Reference(PASPractitioner or PASOrganization)
* careTeam.role MS
* careTeam.role from https://valueset.x12.org/x217/005010/request/2010F/NM1/1/01/00/98 (required)
* careTeam.role  ^binding.description = "Codes identifying an organizational entity, a physical location, property or an individual. These codes are listed within an X12 implementation guide (TR3) and maintained by X12. All X12 work products are copyrighted. See their website for licensing terms and conditions."
* careTeam.qualification MS
* careTeam.qualification from https://valueset.x12.org/x217/005010/request/2010F/PRV/1/03/00/127 (required)
* careTeam.role  ^binding.description = "Codes identifying a provider specialty. These codes are listed within an X12 implementation guide (TR3) and maintained by X12. All X12 work products are copyrighted. See their website for licensing terms and conditions."
* supportingInfo MS
* supportingInfo.sequence MS
* supportingInfo.category MS
* supportingInfo.category from PASSupportingInfoType (extensible)
* diagnosis MS
* diagnosis.sequence MS
* diagnosis.diagnosis[x] MS
* diagnosis.diagnosis[x] only CodeableConcept
* diagnosis.diagnosisCodeableConcept from X12278DiagnosisCodes (required)
* diagnosis.type 0..1 MS
* diagnosis.type from X12278DiagnosisType (required)
* insurance MS
* insurance.sequence MS
* insurance.focal = true (exactly)
* insurance.coverage MS
* insurance.coverage only Reference(PASCoverage)
* accident MS
* accident.date MS
* accident.type MS
* accident.type from https://valueset.x12.org/x217/005010/request/2000E/UM/1/05/01/1362 (required)
* accident.type ^binding.description = "Codes identifying an accompanying cause of an illness, injury or an accident. These codes are listed within an X12 implementation guide (TR3) and maintained by X12. All X12 work products are copyrighted. See their website for licensing terms and conditions."
* accident.location[x] only Address
* item 1..* MS
* item.extension contains ItemTraceNumber named itemTraceNumber 0..1 MS and
	AuthorizationNumber named authorizationNumber 0..1 MS and
	AdministrationReferenceNumber named administrationReferenceNumber 0..1 MS and
	CertificationIssueDate named certIssueDate 0..1 MS and
	CertificationExpirationDate named certExpirationDate 0..1 MS and
	CertificationEffectiveDate named certEffectiveDate 0..1 MS and
	ServiceItemRequestType named requestType 0..1 MS and
	CertificationType named certificationType 0..1 MS and
	ReviewActionCode named reviewActionCode 0..1 MS and
	ProductOrServiceCodeEnd named productOrServiceCodeEnd 0..1
* item.extension[itemTraceNumber] ^short = "Uniquely identifies this claim item. (2000F-TRN)"
* item.extension[authorizationNumber] ^short = "A string assigned by the UMO to an authorized review outcome associated with this service item."
* item.extension[administrationReferenceNumber] ^short = "A string assigned by the UMO to the original disallowed review outcome associated with this service item."
* item.extension[certIssueDate] ^short = "The date/period when this item's preauthorization was issued."
* item.extension[certExpirationDate] ^short = "The date/period by which the item that is pre-authorized must be completed.)"
* item.extension[certEffectiveDate] ^short = "The date/period when this item's preauthorization is valid."
* item.extension[requestType] ^short = "A string assigned by the UMO to the original disallowed review outcome associated with this service item."
* item.extension[reviewActionCode] ^short = "The code describing the result of the review."
* item.extension[certificationType] ^short = "A code representing the type of certification being requested (UM02)"
* item.extension[productOrServiceCodeEnd] ^short = "Used to provide the last code in a series of codes for the service being requested."

* item.sequence MS
* item.careTeamSequence MS
* item.diagnosisSequence MS
* item.informationSequence MS
* item.revenue MS
* item.revenue from AHANUBCRevenueCodes (required)
* item.category from https://valueset.x12.org/x217/005010/request/2000F/UM/1/03/00/1365 (required)
* item.category ^binding.description = "Codes identifying the classification of service. These codes are listed within an X12 implementation guide (TR3) and maintained by X12. All X12 work products are copyrighted. See their website for licensing terms and conditions."
* item.productOrService MS
* item.productOrService from X12278RequestedServiceType (required)
* item.modifier MS
* item.modifier from X12278RequestedServiceModifierType (required)
* item.serviced[x] MS
* item.location[x] MS
* item.location[x] only CodeableConcept
* item.locationCodeableConcept from X12278LocationType (required)
* item.quantity MS

* supportingInfo ^slicing.discriminator.type = #value
* supportingInfo ^slicing.discriminator.path = "category"
* supportingInfo ^slicing.rules = #open
* supportingInfo ^slicing.description = "Slice based on the different types of supporting information that can be included in a authorization request."
* supportingInfo contains PatientEvent 0..1 and AdmissionDates 0..1 and DischargeDates 0..1

* supportingInfo[PatientEvent] ^short = "Information about the dates of the event that are being requested."
* supportingInfo[PatientEvent].category = PASSupportingInfoType#patientEvent
* supportingInfo[PatientEvent].timing[x] 1..1 MS
* supportingInfo[PatientEvent].timingDate obeys FullDateRule
* supportingInfo[PatientEvent].timingPeriod.start obeys FullDateRule
* supportingInfo[PatientEvent].timingPeriod.end obeys FullDateRule
* supportingInfo[PatientEvent].value[x] 0..0

* supportingInfo[AdmissionDates] ^short = "Information about the admission dates of a hospital admission being requested."
* supportingInfo[AdmissionDates].category = PASSupportingInfoType#admissionDates
* supportingInfo[AdmissionDates].timing[x] 1..1 MS
* supportingInfo[AdmissionDates].timingDate obeys FullDateRule
* supportingInfo[AdmissionDates].timingPeriod.start obeys FullDateRule
* supportingInfo[AdmissionDates].timingPeriod.end obeys FullDateRule
* supportingInfo[AdmissionDates].value[x] 0..0

* supportingInfo[DischargeDates] ^short = "Information about the discharge dates of a hospital admission being requested."
* supportingInfo[DischargeDates].category = PASSupportingInfoType#dischargeDates
* supportingInfo[DischargeDates].timing[x] 1..1 MS
* supportingInfo[DischargeDates].timingDate obeys FullDateRule
* supportingInfo[DischargeDates].timingPeriod.start obeys FullDateRule
* supportingInfo[DischargeDates].timingPeriod.end obeys FullDateRule
* supportingInfo[DischargeDates].value[x] 0..0

Extension: CertificationIssueDate
Id: extension-itemCertificationIssueDate
Description: "The date/period when this item's preauthorization was issued."
* value[x] only date or Period
* valueDate obeys FullDateRule
* valuePeriod.start obeys FullDateRule
* valuePeriod.end obeys FullDateRule

Extension: CertificationExpirationDate
Id: extension-itemCertificationExpirationDate
Description: "The date/period by which the item that is pre-authorized must be completed."
* value[x] only date or Period
* valueDate obeys FullDateRule
* valuePeriod.start obeys FullDateRule
* valuePeriod.end obeys FullDateRule

Extension: CertificationEffectiveDate
Id: extension-itemCertificationEffectiveDate
Description: "The date/period when this item's preauthorization is valid."
* value[x] only date or Period
* valueDate obeys FullDateRule
* valuePeriod.start obeys FullDateRule
* valuePeriod.end obeys FullDateRule

Invariant: FullDateRule
Description: "Dates need to be a full date - YYYY-MM-DD"
Expression: "not(this.exists()) or this.length() == 10"
Severity: #error
