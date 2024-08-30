Profile: PASClaimBase
Parent: Claim
Id: profile-claim-base
Title: "PAS Claim Base"
Description: "PAS constraints on Claim resource that are common to both the request and the inquiry."
* ^abstract = true
* extension contains LevelOfServiceCode named levelOfServiceType 0..1 MS and
	ConditionCode named conditionCode 0..* MS and
	HomeHealthCareInformation named homeHealthCareInformation 0..1 MS
* extension[levelOfServiceType] ^short = "A code specifying the level of service being requested (UM06)"
* extension[conditionCode] ^short = "Used to indicate condition codes for various requests for service."
* extension[homeHealthCareInformation] ^short = "Used to provide required information about home health care services. (CR6)"
* identifier MS
* identifier only PASIdentifier
* identifier ^short = "Business identifier for claim"
* status MS
* status = #active
* use MS
* use = #preauthorization
* patient MS
* patient only Reference(PASBeneficiary)
* insurer 1..1 MS
* insurer only Reference(PASInsurer)
* provider MS
* provider only Reference(PASRequestor or PASPractitionerRole)
* careTeam MS
* careTeam.sequence MS
* careTeam.provider MS
* careTeam.provider only Reference(PASOrganization or PASPractitionerRole)
* careTeam.role MS
* careTeam.qualification MS
* careTeam ^slicing.discriminator.type = #value
* careTeam ^slicing.discriminator.path = "extension('http://hl7.org/fhir/us/davinci-pas/StructureDefinition/extension-careTeamClaimScope').value ofType(boolean)"
* careTeam ^slicing.rules = #open
* careTeam ^slicing.description = "Slice based on whether the care team member belongs to the overall claim or to an individual claim item."
* careTeam contains OverallClaimMember 0..* MS and ItemClaimMember 0..* MS
* careTeam[OverallClaimMember].extension contains CareTeamClaimScope named careTeamClaimScope 1..1 MS
* careTeam[OverallClaimMember].extension[careTeamClaimScope].valueBoolean MS
* careTeam[OverallClaimMember].extension[careTeamClaimScope].valueBoolean = true (exactly)
* careTeam[OverallClaimMember] ^short = "Care Team Providers that are applicable to all services being requested.  NOTE: Only the first 14 can be sent in the X12 Request."
* careTeam[OverallClaimMember] ^comment = "NOTE: Only the first 14 can be sent in the X12 Request."
* careTeam[ItemClaimMember] ^short = "Care Team Providers that are applicable to a specific item (as referenced by that item).  NOTE: Only the first 10 can be sent in the X12 Request."
* careTeam[ItemClaimMember] ^comment = "NOTE: Only the first 10 can be sent in the X12 Request."
* careTeam[ItemClaimMember].extension contains CareTeamClaimScope named careTeamClaimScope 1..1 MS
* careTeam[ItemClaimMember].extension[careTeamClaimScope].valueBoolean MS
* careTeam[ItemClaimMember].extension[careTeamClaimScope].valueBoolean = false (exactly)
* careTeam[OverallClaimMember].role MS
* careTeam[OverallClaimMember].role from https://valueset.x12.org/x217/005010/request/2010EA/NM1/1/01/00/98 (required)
* careTeam[OverallClaimMember].role  ^binding.description = "Codes identifying an organizational entity, a physical location, property or an individual. These codes are listed within an X12 implementation guide (TR3) and maintained by X12. All X12 work products are copyrighted. See their website for licensing terms and conditions."
* careTeam[OverallClaimMember].qualification MS
* careTeam[OverallClaimMember].qualification from https://valueset.x12.org/x217/005010/request/2010EA/PRV/1/03/00/127 (required)
* careTeam[OverallClaimMember].role  ^binding.description = "Codes identifying a provider specialty. These codes are listed within an X12 implementation guide (TR3) and maintained by X12. All X12 work products are copyrighted. See their website for licensing terms and conditions."
* careTeam[ItemClaimMember].role from https://valueset.x12.org/x217/005010/request/2010F/NM1/1/01/00/98 (required)
* careTeam[ItemClaimMember].role  ^binding.description = "Codes identifying an organizational entity, a physical location, property or an individual. These codes are listed within an X12 implementation guide (TR3) and maintained by X12. All X12 work products are copyrighted. See their website for licensing terms and conditions."
* careTeam[ItemClaimMember].qualification MS
* careTeam[ItemClaimMember].qualification from https://valueset.x12.org/x217/005010/request/2010F/PRV/1/03/00/127 (required)
* careTeam[ItemClaimMember].role  ^binding.description = "Codes identifying a provider specialty. These codes are listed within an X12 implementation guide (TR3) and maintained by X12. All X12 work products are copyrighted. See their website for licensing terms and conditions."
* careTeam.extension contains CareTeamClaimScope named careTeamClaimScope 1..1 MS
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
* insurance.focal = true
* insurance.coverage MS
* insurance.coverage only Reference(PASCoverage)
* accident MS
* accident.date MS
* accident.date ^comment = "Dates need to be a full date - YYYY-MM-DD"
* accident.type MS
* accident.type from https://valueset.x12.org/x217/005010/request/2000E/UM/1/05/01/1362 (required)
* accident.type ^binding.description = "Codes identifying an accompanying cause of an illness, injury or an accident. These codes are listed within an X12 implementation guide (TR3) and maintained by X12. All X12 work products are copyrighted. See their website for licensing terms and conditions."
* accident.location[x] MS
* accident.location[x] only Address
* item MS
* item.extension contains ItemTraceNumber named itemTraceNumber 0..* MS and
	AuthorizationNumber named authorizationNumber 0..1 MS and
	AdministrationReferenceNumber named administrationReferenceNumber 0..1 MS and
	ServiceItemRequestType named requestType 0..1 MS and
	CertificationType named certificationType 0..1 MS and
	ProductOrServiceCodeEnd named productOrServiceCodeEnd 0..1 MS
* item.extension[itemTraceNumber] ^short = "Uniquely identifies this claim item. (2000F-TRN)"
* item.extension[authorizationNumber] ^short = "A string assigned by the UMO to an authorized review outcome associated with this service item."
* item.extension[administrationReferenceNumber] ^short = "A string assigned by the UMO to the original disallowed review outcome associated with this service item."
* item.extension[requestType] ^short = "A code that identifies the type of service being requested."
* item.extension[certificationType] ^short = "A code representing the type of certification being requested (UM02)"
* item.extension[productOrServiceCodeEnd] ^short = "Used to provide the last code in a series of codes for the service being requested."
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
* item.quantity ^comment = "For any exchange that must be converted to an X12 request, units SHALL be restricted to international units, days, units, minutes, hours, months, or visits."
* supportingInfo ^slicing.discriminator.type = #value
* supportingInfo ^slicing.discriminator.path = "category"
* supportingInfo ^slicing.rules = #open
* supportingInfo ^slicing.description = "Slice based on the different types of supporting information that can be included in a authorization request."
* supportingInfo contains PatientEvent 0..1 MS and AdmissionDates 0..1 MS and DischargeDates 0..1 MS

* supportingInfo[PatientEvent] ^short = "Information about the dates of the event that are being requested."
* supportingInfo[PatientEvent].category = PASTempCodes#patientEvent
* supportingInfo[PatientEvent].timing[x] 1..1 MS
* supportingInfo[PatientEvent].timingDate MS
* supportingInfo[PatientEvent].timingDate obeys FullDateRule
* supportingInfo[PatientEvent].timingPeriod MS
* supportingInfo[PatientEvent].timingPeriod.start MS
* supportingInfo[PatientEvent].timingPeriod.start obeys FullDateRule
* supportingInfo[PatientEvent].timingPeriod.end MS
* supportingInfo[PatientEvent].timingPeriod.end obeys FullDateRule
* supportingInfo[PatientEvent].value[x] 0..0

* supportingInfo[AdmissionDates] ^short = "Information about the admission dates of a hospital admission being requested."
* supportingInfo[AdmissionDates].category = PASTempCodes#admissionDates
* supportingInfo[AdmissionDates].timing[x] 1..1 MS
* supportingInfo[AdmissionDates].timingDate MS
* supportingInfo[AdmissionDates].timingDate obeys FullDateRule
* supportingInfo[AdmissionDates].timingPeriod MS
* supportingInfo[AdmissionDates].timingPeriod.start MS
* supportingInfo[AdmissionDates].timingPeriod.start obeys FullDateRule
* supportingInfo[AdmissionDates].timingPeriod.end MS
* supportingInfo[AdmissionDates].timingPeriod.end obeys FullDateRule
* supportingInfo[AdmissionDates].value[x] 0..0

* supportingInfo[DischargeDates] ^short = "Information about the discharge dates of a hospital admission being requested."
* supportingInfo[DischargeDates].category = PASTempCodes#dischargeDates
* supportingInfo[DischargeDates].timing[x] 1..1 MS
* supportingInfo[DischargeDates].timingDate MS
* supportingInfo[DischargeDates].timingDate obeys FullDateRule
* supportingInfo[DischargeDates].timingPeriod MS
* supportingInfo[DischargeDates].timingPeriod.start MS
* supportingInfo[DischargeDates].timingPeriod.start obeys FullDateRule
* supportingInfo[DischargeDates].timingPeriod.end MS
* supportingInfo[DischargeDates].timingPeriod.end obeys FullDateRule
* supportingInfo[DischargeDates].value[x] 0..0



Profile: PASClaim
Parent: PASClaimBase
Id: profile-claim
Title: "PAS Claim"
Description: "PAS constraints on Claim resource mandating support for elements relevant to the prior authorization request"
* . ^short = "Pre-Authorization"
* extension contains http://hl7.org/fhir/5.0/StructureDefinition/extension-Claim.encounter named encounter 0..1 MS
* extension[encounter] ^short = "Information about a hospital claim being requested."
* extension[encounter].valueReference only Reference(PASEncounter)
* identifier 1..2 MS
* diagnosis MS
* diagnosis.extension contains DiagnosisRecordedDate named recordedDate 0..1 MS
* diagnosis.extension[recordedDate] ^short = "The date that a diagnosis was recorded. (HIxx-4)"
* item 1..* MS
* item.extension contains 
	EPSDTIndicator named epsdtIndicator 0..1 MS and
	NursingHomeResidentialStatus named nursingHomeResidentialStatus 0..1 MS and
	NursingHomeLevelOfCare named nursingHomeLevelOfCare 0..1 MS and
	RevenueUnitRateLimit named revenueUnitRateLimit 0..1 MS and
	RequestedService named requestedService 0..1 MS
* diagnosis ^short = "Pertinent diagnosis information.  NOTE: Only the first 12 diagnoses can be sent in the X12 request."
* item.extension[nursingHomeResidentialStatus].valueCodeableConcept MS
* item.extension[nursingHomeResidentialStatus].valueCodeableConcept from https://valueset.x12.org/x217/005010/request/2000F/SV2/1/09/00/1345 (required)
* item.extension[nursingHomeResidentialStatus].valueCodeableConcept  ^binding.description = "Codes specifying the status of a nursing home resident at the time of service. These codes are listed within an X12 implementation guide (TR3) and maintained by X12. All X12 work products are copyrighted. See their website for licensing terms and conditions."
* item.extension[epsdtIndicator] ^short = "An indicator of whether early and periodic screen for diagnosis and treatment of children is involved."
* item.extension[nursingHomeResidentialStatus] ^short = "A code specifying the status of a nursing home resident at the time of service. (SV209)"
* item.extension[nursingHomeLevelOfCare] ^short = "A code specifying the level of care provided by a nursing home facility. (SV120, SV210)"
* item.extension[revenueUnitRateLimit] ^short = "The limit on the rate per unit of revenue for hospital accomodation. (SV206)"
* item.extension[requestedService] ^short = "The details of the service being requested."
* item.category 1..1 MS
* item.category ^short = "Since PAS requests only have item-level information, a category is required for conformance with the X12 278 request."
* item.unitPrice MS

* supportingInfo contains AdditionalInformation 0..* MS and MessageText 0..* MS

* supportingInfo[AdditionalInformation] ^short = "Send additional paperwork or supporting information for the request.  This can be most commonly a DocumentReference profile although any type of information is allowed."
* supportingInfo[AdditionalInformation].category = PASTempCodes#additionalInformation
* supportingInfo[AdditionalInformation].timing[x] 0..0
* supportingInfo[AdditionalInformation].value[x] 1..1 MS
* supportingInfo[AdditionalInformation].value[x] only Reference($USCoreDocumentReference or Resource)
* supportingInfo[AdditionalInformation].value[x] ^comment = "Although we allow of any type of information to be sent, when sending reference to documents, the PASDocumentReference profile should be used."

* supportingInfo[MessageText] ^short = "Send text messages to the UMO."
* supportingInfo[MessageText].category = PASTempCodes#freeFormMessage
* supportingInfo[MessageText].timing[x] 0..0
* supportingInfo[MessageText].value[x] 1..1 MS
* supportingInfo[MessageText].value[x] only string

Profile: PASClaimInquiry
Parent: PASClaimBase
Id: profile-claim-inquiry
Title: "PAS Claim Inquiry"
Description: "PAS constraints on Claim resource when submitting an inquiry for existing authorizations."
* . ^short = "Pre-Authorization"
* extension contains CertificationType named certificationType 0..1 MS
* extension[certificationType] ^short = "A code representing the type of certification being requested (UM02)"
* identifier 1..1 MS
* provider ^short = "This is the submitter of the inquiry."
* billablePeriod MS
* diagnosis ^comment = "When multiple diagnoses are sent, the intermediary will need to convert the single inquiry into multiple X12 278 inquiries - one for each diagnosis code - and then make the union of the returned Prior Authorization responses."
* item.extension contains 
	CertificationIssueDate named certIssueDate 0..1 MS and
	CertificationExpirationDate named certExpirationDate 0..1 MS and
	CertificationEffectiveDate named certEffectiveDate 0..1 MS and
	ReviewActionCode named reviewActionCode 0..1 MS
* item.extension[certIssueDate] ^short = "The specific date or period within when which item's preauthorization was issued."
* item.extension[certExpirationDate] ^short = "The specific date or period within which this item's preauthorization expires."
* item.extension[certEffectiveDate] ^short = "The specific date or period within which this item's preauthorization became effective."
* item.extension[reviewActionCode] ^short = "The code describing the result of the review."

