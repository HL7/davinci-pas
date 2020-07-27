Profile: PASClaim
Parent: Claim
Id: profile-claim
Title: "PAS Claim"
Description: "PAS constraints on Claim resource mandating support for elements relevant to the prior authorization request"
* extension contains CertificationType named certificationType 0..1
* extension contains LevelOfServiceCode named levelOfServiceType 0..1
* identifier 1..1 MS
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
* careTeam.role MS
* careTeam.qualification MS
* supportingInfo MS
* supportingInfo.sequence MS
* supportingInfo.category MS
* supportingInfo.category from PASSupportingInfoType (extensible)
* diagnosis MS
* diagnosis.extension contains DiagnosisRecordedDate named recordedDate 0..1
* diagnosis.sequence MS
* diagnosis.diagnosis[x] MS
* diagnosis.diagnosis[x] only CodeableConcept
* diagnosis.type MS
* insurance MS
* insurance.sequence MS
* insurance.focal = true (exactly)
* insurance.coverage MS
* accident MS
* accident.date MS
* accident.type MS
* accident.location[x] only Address
* item 1..* MS
* item.extension contains ItemTraceNumber named itemTraceNumber 0..1
* item.extension contains AuthorizationNumber named authorizationNumber 0..1
* item.extension contains AdministrationReferenceNumber named administrationReferenceNumber 0..1
* item.extension contains ServiceItemRequestType named requestType 0..1
* item.extension contains CertificationType named certificationType 0..1
* item.extension contains ProductOrServiceCodeEnd named productOrServiceCodeEnd 0..1
* item.extension contains EPSDTIndicator named epsdtIndicator 0..1
* item.extension contains NursingHomeResidentialStatus named nursingHomeResidentialStatus 0..1
* item.extension contains NursingHomeLevelOfCare named nursingHomeLevelOfCare 0..1
* item.extension contains RevenueUnitRateLimit named revenueUnitRateLimit 0..1
* item.extension contains RequestedService named requestedService 0..1
* item.sequence MS
* item.careTeamSequence MS
* item.diagnosisSequence MS
* item.informationSequence MS
* item.revenue MS
* item.category MS
* item.productOrService MS
* item.modifier MS
* item.serviced[x] MS
* item.location[x] MS
* item.location[x] only CodeableConcept
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
* supportingInfo[AdditionalInformation].value[x] only Reference(DocumentReference)

* supportingInfo[MessageText].category = PASSupportingInfoType#freeFormMessage
* supportingInfo[MessageText].timing[x] 0..0
* supportingInfo[MessageText].value[x] 1..1 MS
* supportingInfo[MessageText].value[x] only string

* supportingInfo[InstitutionalEncounter].category = PASSupportingInfoType#institutionalEncounter
* supportingInfo[InstitutionalEncounter].timing[x] 0..0
* supportingInfo[InstitutionalEncounter].value[x] 1..1 MS
* supportingInfo[InstitutionalEncounter].value[x] only Reference(PASEncounter)

Extension: CertificationType
Id: extension-certificationType
Description: "A code representing the type of certification being requested (UM02)"
* value[x] only CodeableConcept

Extension: LevelOfServiceCode
Id: extension-levelOfServiceCode
Description: "A code specifying the level of service being requested (UM06)"
* value[x] only CodeableConcept

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
Id: extension-serviceItemReqestType
Description: "A code that identifies the type of service being requested."
* value[x] only CodeableConcept

Extension: ProductOrServiceCodeEnd
Id: extension-productOrServiceCodeEnd
Description: "Used to provide the last code in a series of codes for the service being requested."
* value[x] only CodeableConcept

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
* extension contains InfoChanged named infoChanged 0..1
* modifierExtension contains InfoCancelledFlag named infoCancelledFlag 0..1
* supportingInfo.extension contains InfoChanged named infoChanged 0..1

Extension: InfoChanged
Id: extension-infoChanged
Description: "A code indicating how the piece of information has changed."
* value[x] only code
* valueCode from PASInformationChangeMode (required)

Extension: InfoCancelledFlag
Id: extension-infoCancelled
Description: "A flag indicating whether the piece of information was cancelled."
* value[x] only boolean
