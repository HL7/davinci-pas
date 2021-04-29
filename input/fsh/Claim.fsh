Profile: PASClaim
Parent: Claim
Id: profile-claim
Title: "PAS Claim"
Description: "PAS constraints on Claim resource mandating support for elements relevant to the prior authorization request"
* extension contains LevelOfServiceCode named levelOfServiceType 0..1 MS
* identifier 1..1 MS
* identifier.extension contains IdentifierSubDepartment named subDepartment 0..1 MS
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
* careTeam.provider only Reference(PASPractitioner or $USCoreOrganization)
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
* supportingInfo contains PatientEvent 0..1 and AdmissionReview 0..1 and AdditionalInformation 0..1 and MessageText 0..1 and InstitutionalEncounter 0..1

* supportingInfo[PatientEvent].category = PASSupportingInfoType#patientEvent
* supportingInfo[PatientEvent].timing[x] 1..1 MS
* supportingInfo[PatientEvent].value[x] 0..0

* supportingInfo[AdmissionReview].category = PASSupportingInfoType#admissionReview
* supportingInfo[AdmissionReview].timing[x] 1..1 MS
* supportingInfo[AdmissionReview].value[x] 0..0

* supportingInfo[AdditionalInformation].category = PASSupportingInfoType#additionalInformation
* supportingInfo[AdditionalInformation].timing[x] 0..0
* supportingInfo[AdditionalInformation].value[x] 1..1 MS
* supportingInfo[AdditionalInformation].value[x] only Reference

* supportingInfo[MessageText].category = PASSupportingInfoType#freeFormMessage
* supportingInfo[MessageText].timing[x] 0..0
* supportingInfo[MessageText].value[x] 1..1 MS
* supportingInfo[MessageText].value[x] only string

* supportingInfo[InstitutionalEncounter].category = PASSupportingInfoType#institutionalEncounter
* supportingInfo[InstitutionalEncounter].timing[x] 0..0
* supportingInfo[InstitutionalEncounter].value[x] 1..1 MS
* supportingInfo[InstitutionalEncounter].value[x] only Reference(PASEncounter)

Extension: IdentifierSubDepartment
Id: extension-identifierSubDepartment
Description: "An additional element that provides the subdepartment that created the authorization request."
* value[x] only string

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

Extension: ItemTraceNumber
Id: extension-itemTraceNumber
Description: "Uniquely identifies this claim item. (2000F-TRN)"
* value[x] only Identifier

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
* supportingInfo.modifierExtension contains InfoCancelledFlag named infoCancelledFlag 0..1
* item.extension contains InfoChanged named infoChanged 0..1
* item.modifierExtension contains InfoCancelledFlag named infoCancelledFlag 0..1


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
* identifier 1..1 MS
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
* careTeam.provider only Reference(PASPractitioner or $USCoreOrganization)
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
	PreAuthIssueDate named preAuthIssueDate 0..1 MS and
	PreAuthPeriod named preAuthPeriod 0..1 MS and
	ServiceItemRequestType named requestType 0..1 MS and
	CertificationType named certificationType 0..1 MS and
	ReviewActionCode named reviewActionCode 0..1 MS and
	ProductOrServiceCodeEnd named productOrServiceCodeEnd 0..1
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
* supportingInfo contains PatientEvent 0..1 and AdmissionReview 0..1

* supportingInfo[PatientEvent].category = PASSupportingInfoType#patientEvent
* supportingInfo[PatientEvent].timing[x] 1..1 MS
* supportingInfo[PatientEvent].value[x] 0..0

* supportingInfo[AdmissionReview].category = PASSupportingInfoType#admissionReview
* supportingInfo[AdmissionReview].timing[x] 1..1 MS
* supportingInfo[AdmissionReview].value[x] 0..0
