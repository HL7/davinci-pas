Profile: PASClaimResponseBase
Parent: ClaimResponse
Id: profile-claimresponse-base
Title: "PAS Claim Response Base"
Description: "PAS constraints on ClaimResponse resource that are common to both the request and the inquiry."
* ^abstract = true
* . ^short = "Response to a preauthorization"
* extension contains TransmissionIdentifiers named transmissionIdentifiers 0..1 MS and
	AdministrationReferenceNumber named administrationReferenceNumber 0..1 MS and 
  CommunicatedDiagnosis named communicatedDiagnosis 0..1 MS
* extension[transmissionIdentifiers] ^extension[http://hl7.org/fhir/StructureDefinition/obligation][+].extension[code].valueCode = #SHALL:able-to-populate
* extension[transmissionIdentifiers] ^extension[http://hl7.org/fhir/StructureDefinition/obligation][=].extension[actor].valueCanonical = "http://hl7.org/fhir/us/davinci-pas/ActorDefinition/payer"
* extension[transmissionIdentifiers] ^extension[http://hl7.org/fhir/StructureDefinition/obligation][+].extension[code].valueCode = #SHALL:process
* extension[transmissionIdentifiers] ^extension[http://hl7.org/fhir/StructureDefinition/obligation][=].extension[actor].valueCanonical = "http://hl7.org/fhir/us/davinci-pas/ActorDefinition/client"
* extension[administrationReferenceNumber] ^extension[http://hl7.org/fhir/StructureDefinition/obligation][+].extension[code].valueCode = #SHALL:able-to-populate
* extension[administrationReferenceNumber] ^extension[http://hl7.org/fhir/StructureDefinition/obligation][=].extension[actor].valueCanonical = "http://hl7.org/fhir/us/davinci-pas/ActorDefinition/payer"
* extension[administrationReferenceNumber] ^extension[http://hl7.org/fhir/StructureDefinition/obligation][+].extension[code].valueCode = #SHALL:process
* extension[administrationReferenceNumber] ^extension[http://hl7.org/fhir/StructureDefinition/obligation][=].extension[actor].valueCanonical = "http://hl7.org/fhir/us/davinci-pas/ActorDefinition/client"
* extension[communicatedDiagnosis] ^extension[http://hl7.org/fhir/StructureDefinition/obligation][+].extension[code].valueCode = #SHALL:able-to-populate
* extension[communicatedDiagnosis] ^extension[http://hl7.org/fhir/StructureDefinition/obligation][=].extension[actor].valueCanonical = "http://hl7.org/fhir/us/davinci-pas/ActorDefinition/payer"
* extension[communicatedDiagnosis] ^extension[http://hl7.org/fhir/StructureDefinition/obligation][+].extension[code].valueCode = #SHALL:process
* extension[communicatedDiagnosis] ^extension[http://hl7.org/fhir/StructureDefinition/obligation][=].extension[actor].valueCanonical = "http://hl7.org/fhir/us/davinci-pas/ActorDefinition/client"
* identifier MS
* identifier ^extension[http://hl7.org/fhir/StructureDefinition/obligation][+].extension[code].valueCode = #SHALL:able-to-populate
* identifier ^extension[http://hl7.org/fhir/StructureDefinition/obligation][=].extension[actor].valueCanonical = "http://hl7.org/fhir/us/davinci-pas/ActorDefinition/payer"
* identifier ^extension[http://hl7.org/fhir/StructureDefinition/obligation][+].extension[code].valueCode = #SHALL:process
* identifier ^extension[http://hl7.org/fhir/StructureDefinition/obligation][=].extension[actor].valueCanonical = "http://hl7.org/fhir/us/davinci-pas/ActorDefinition/client"
* identifier only PASIdentifier
* identifier.system ^short = "Should use a scheme of 'urn:trnorg:<TRN03>'"
* status MS
* status ^extension[http://hl7.org/fhir/StructureDefinition/obligation][+].extension[code].valueCode = #SHALL:able-to-populate
* status ^extension[http://hl7.org/fhir/StructureDefinition/obligation][=].extension[actor].valueCanonical = "http://hl7.org/fhir/us/davinci-pas/ActorDefinition/payer"
* status ^extension[http://hl7.org/fhir/StructureDefinition/obligation][+].extension[code].valueCode = #SHALL:process
* status ^extension[http://hl7.org/fhir/StructureDefinition/obligation][=].extension[actor].valueCanonical = "http://hl7.org/fhir/us/davinci-pas/ActorDefinition/client"
* status = #active
* use = #preauthorization
* patient MS
* patient ^extension[http://hl7.org/fhir/StructureDefinition/obligation][+].extension[code].valueCode = #SHALL:able-to-populate
* patient ^extension[http://hl7.org/fhir/StructureDefinition/obligation][=].extension[actor].valueCanonical = "http://hl7.org/fhir/us/davinci-pas/ActorDefinition/payer"
* patient ^extension[http://hl7.org/fhir/StructureDefinition/obligation][+].extension[code].valueCode = #SHALL:process
* patient ^extension[http://hl7.org/fhir/StructureDefinition/obligation][=].extension[actor].valueCanonical = "http://hl7.org/fhir/us/davinci-pas/ActorDefinition/client"
* patient only Reference(PASBeneficiary)
* created MS
* created ^extension[http://hl7.org/fhir/StructureDefinition/obligation][+].extension[code].valueCode = #SHALL:able-to-populate
* created ^extension[http://hl7.org/fhir/StructureDefinition/obligation][=].extension[actor].valueCanonical = "http://hl7.org/fhir/us/davinci-pas/ActorDefinition/payer"
* created ^extension[http://hl7.org/fhir/StructureDefinition/obligation][+].extension[code].valueCode = #SHALL:process
* created ^extension[http://hl7.org/fhir/StructureDefinition/obligation][=].extension[actor].valueCanonical = "http://hl7.org/fhir/us/davinci-pas/ActorDefinition/client"
* insurer MS
* insurer ^extension[http://hl7.org/fhir/StructureDefinition/obligation][+].extension[code].valueCode = #SHALL:able-to-populate
* insurer ^extension[http://hl7.org/fhir/StructureDefinition/obligation][=].extension[actor].valueCanonical = "http://hl7.org/fhir/us/davinci-pas/ActorDefinition/payer"
* insurer ^extension[http://hl7.org/fhir/StructureDefinition/obligation][+].extension[code].valueCode = #SHALL:process
* insurer ^extension[http://hl7.org/fhir/StructureDefinition/obligation][=].extension[actor].valueCanonical = "http://hl7.org/fhir/us/davinci-pas/ActorDefinition/client"
* insurer only Reference(PASInsurer)
* requestor MS
* requestor ^extension[http://hl7.org/fhir/StructureDefinition/obligation][+].extension[code].valueCode = #SHALL:able-to-populate
* requestor ^extension[http://hl7.org/fhir/StructureDefinition/obligation][=].extension[actor].valueCanonical = "http://hl7.org/fhir/us/davinci-pas/ActorDefinition/payer"
* requestor ^extension[http://hl7.org/fhir/StructureDefinition/obligation][+].extension[code].valueCode = #SHALL:process
* requestor ^extension[http://hl7.org/fhir/StructureDefinition/obligation][=].extension[actor].valueCanonical = "http://hl7.org/fhir/us/davinci-pas/ActorDefinition/client"
* requestor only Reference(PASRequestor or PASPractitionerRole)
* request 1..1 MS
* request ^extension[http://hl7.org/fhir/StructureDefinition/obligation][+].extension[code].valueCode = #SHALL:able-to-populate
* request ^extension[http://hl7.org/fhir/StructureDefinition/obligation][=].extension[actor].valueCanonical = "http://hl7.org/fhir/us/davinci-pas/ActorDefinition/payer"
* request ^extension[http://hl7.org/fhir/StructureDefinition/obligation][+].extension[code].valueCode = #SHALL:process
* request ^extension[http://hl7.org/fhir/StructureDefinition/obligation][=].extension[actor].valueCanonical = "http://hl7.org/fhir/us/davinci-pas/ActorDefinition/client"
* request.extension contains http://hl7.org/fhir/StructureDefinition/data-absent-reason named DataAbsentReason 0..1 MS
* request.extension[DataAbsentReason] ^extension[http://hl7.org/fhir/StructureDefinition/obligation][+].extension[code].valueCode = #SHALL:able-to-populate
* request.extension[DataAbsentReason] ^extension[http://hl7.org/fhir/StructureDefinition/obligation][=].extension[actor].valueCanonical = "http://hl7.org/fhir/us/davinci-pas/ActorDefinition/payer"
* request.extension[DataAbsentReason] ^extension[http://hl7.org/fhir/StructureDefinition/obligation][+].extension[code].valueCode = #SHALL:process
* request.extension[DataAbsentReason] ^extension[http://hl7.org/fhir/StructureDefinition/obligation][=].extension[actor].valueCanonical = "http://hl7.org/fhir/us/davinci-pas/ActorDefinition/client"
* request only Reference(PASClaim)
* outcome MS
* outcome ^extension[http://hl7.org/fhir/StructureDefinition/obligation][+].extension[code].valueCode = #SHALL:able-to-populate
* outcome ^extension[http://hl7.org/fhir/StructureDefinition/obligation][=].extension[actor].valueCanonical = "http://hl7.org/fhir/us/davinci-pas/ActorDefinition/payer"
* outcome ^extension[http://hl7.org/fhir/StructureDefinition/obligation][+].extension[code].valueCode = #SHALL:process
* outcome ^extension[http://hl7.org/fhir/StructureDefinition/obligation][=].extension[actor].valueCanonical = "http://hl7.org/fhir/us/davinci-pas/ActorDefinition/client"
* outcome from ClaimResponseOutcome (required) 
* outcome ^short = "complete | error | partial"
* outcome.extension contains OutcomeCode named outcomeCode 0..* MS
* outcome.extension[OutcomeCode] ^extension[http://hl7.org/fhir/StructureDefinition/obligation][+].extension[code].valueCode = #SHALL:able-to-populate
* outcome.extension[OutcomeCode] ^extension[http://hl7.org/fhir/StructureDefinition/obligation][=].extension[actor].valueCanonical = "http://hl7.org/fhir/us/davinci-pas/ActorDefinition/payer"
* outcome.extension[OutcomeCode] ^extension[http://hl7.org/fhir/StructureDefinition/obligation][+].extension[code].valueCode = #SHALL:process
* outcome.extension[OutcomeCode] ^extension[http://hl7.org/fhir/StructureDefinition/obligation][=].extension[actor].valueCanonical = "http://hl7.org/fhir/us/davinci-pas/ActorDefinition/client"
* preAuthRef MS
* preAuthRef ^extension[http://hl7.org/fhir/StructureDefinition/obligation][+].extension[code].valueCode = #SHALL:able-to-populate
* preAuthRef ^extension[http://hl7.org/fhir/StructureDefinition/obligation][=].extension[actor].valueCanonical = "http://hl7.org/fhir/us/davinci-pas/ActorDefinition/payer"
* preAuthRef ^extension[http://hl7.org/fhir/StructureDefinition/obligation][+].extension[code].valueCode = #SHALL:process
* preAuthRef ^extension[http://hl7.org/fhir/StructureDefinition/obligation][=].extension[actor].valueCanonical = "http://hl7.org/fhir/us/davinci-pas/ActorDefinition/client"
* preAuthPeriod MS 
* preAuthPeriod ^extension[http://hl7.org/fhir/StructureDefinition/obligation][+].extension[code].valueCode = #SHALL:able-to-populate
* preAuthPeriod ^extension[http://hl7.org/fhir/StructureDefinition/obligation][=].extension[actor].valueCanonical = "http://hl7.org/fhir/us/davinci-pas/ActorDefinition/payer"
* preAuthPeriod ^extension[http://hl7.org/fhir/StructureDefinition/obligation][+].extension[code].valueCode = #SHALL:process
* preAuthPeriod ^extension[http://hl7.org/fhir/StructureDefinition/obligation][=].extension[actor].valueCanonical = "http://hl7.org/fhir/us/davinci-pas/ActorDefinition/client"
* preAuthPeriod ^short = "The patient-level administrationReferenceNumber (REF-NT) is mapped to this element"
* item MS
* item ^extension[http://hl7.org/fhir/StructureDefinition/obligation][+].extension[code].valueCode = #SHALL:able-to-populate
* item ^extension[http://hl7.org/fhir/StructureDefinition/obligation][=].extension[actor].valueCanonical = "http://hl7.org/fhir/us/davinci-pas/ActorDefinition/payer"
* item ^extension[http://hl7.org/fhir/StructureDefinition/obligation][+].extension[code].valueCode = #SHALL:process
* item ^extension[http://hl7.org/fhir/StructureDefinition/obligation][=].extension[actor].valueCanonical = "http://hl7.org/fhir/us/davinci-pas/ActorDefinition/client"
* item.extension contains ItemTraceNumber named itemTraceNumber 0..* MS and
	ItemPreAuthIssueDate named preAuthIssueDate 0..1 MS and
	ItemPreAuthPeriod named preAuthPeriod 0..1 MS and
	AuthorizationNumber named previousAuthorizationNumber 0..1 MS and
	AdministrationReferenceNumber named administrationReferenceNumber 0..1 MS and
	ItemRequestedServiceDate named requestedServiceDate 0..1 MS and
	ItemAuthorizedProvider named authorizedProvider 0..* MS and
	ItemAuthorizedDetail named authorizedItemDetail 0..1 MS and
  AdmissionDates named admissionDates 0..1 MS and
  DischargeDate named dischargeDate 0..1 MS
* item.extension[itemTraceNumber] ^short = "Uniquely identifies this claim item. (2000F-TRN)" 
* item.extension[itemTraceNumber] ^extension[http://hl7.org/fhir/StructureDefinition/obligation][+].extension[code].valueCode = #SHALL:able-to-populate
* item.extension[itemTraceNumber] ^extension[http://hl7.org/fhir/StructureDefinition/obligation][=].extension[actor].valueCanonical = "http://hl7.org/fhir/us/davinci-pas/ActorDefinition/payer"
* item.extension[itemTraceNumber] ^extension[http://hl7.org/fhir/StructureDefinition/obligation][+].extension[code].valueCode = #SHALL:process
* item.extension[itemTraceNumber] ^extension[http://hl7.org/fhir/StructureDefinition/obligation][=].extension[actor].valueCanonical = "http://hl7.org/fhir/us/davinci-pas/ActorDefinition/client"
* item.extension[preAuthIssueDate] ^short = "The date when this item's preauthorization was issued."
* item.extension[preAuthIssueDate] ^extension[http://hl7.org/fhir/StructureDefinition/obligation][+].extension[code].valueCode = #SHALL:able-to-populate
* item.extension[preAuthIssueDate] ^extension[http://hl7.org/fhir/StructureDefinition/obligation][=].extension[actor].valueCanonical = "http://hl7.org/fhir/us/davinci-pas/ActorDefinition/payer"
* item.extension[preAuthIssueDate] ^extension[http://hl7.org/fhir/StructureDefinition/obligation][+].extension[code].valueCode = #SHALL:process
* item.extension[preAuthIssueDate] ^extension[http://hl7.org/fhir/StructureDefinition/obligation][=].extension[actor].valueCanonical = "http://hl7.org/fhir/us/davinci-pas/ActorDefinition/client"
* item.extension[preAuthPeriod] ^short = "The date/period when this item's preauthorization is valid."
* item.extension[preAuthPeriod] ^extension[http://hl7.org/fhir/StructureDefinition/obligation][+].extension[code].valueCode = #SHALL:able-to-populate
* item.extension[preAuthPeriod] ^extension[http://hl7.org/fhir/StructureDefinition/obligation][=].extension[actor].valueCanonical = "http://hl7.org/fhir/us/davinci-pas/ActorDefinition/payer"
* item.extension[preAuthPeriod] ^extension[http://hl7.org/fhir/StructureDefinition/obligation][+].extension[code].valueCode = #SHALL:process
* item.extension[preAuthPeriod] ^extension[http://hl7.org/fhir/StructureDefinition/obligation][=].extension[actor].valueCanonical = "http://hl7.org/fhir/us/davinci-pas/ActorDefinition/client"
* item.extension[previousAuthorizationNumber] ^short = "A string assigned by the UMO to an authorized review outcome associated with this service item."
* item.extension[previousAuthorizationNumber] ^extension[http://hl7.org/fhir/StructureDefinition/obligation][+].extension[code].valueCode = #SHALL:able-to-populate
* item.extension[previousAuthorizationNumber] ^extension[http://hl7.org/fhir/StructureDefinition/obligation][=].extension[actor].valueCanonical = "http://hl7.org/fhir/us/davinci-pas/ActorDefinition/payer"
* item.extension[previousAuthorizationNumber] ^extension[http://hl7.org/fhir/StructureDefinition/obligation][+].extension[code].valueCode = #SHALL:process
* item.extension[previousAuthorizationNumber] ^extension[http://hl7.org/fhir/StructureDefinition/obligation][=].extension[actor].valueCanonical = "http://hl7.org/fhir/us/davinci-pas/ActorDefinition/client"
* item.extension[administrationReferenceNumber] ^short = "A string assigned by the UMO to the original disallowed review outcome associated with this service item."
* item.extension[administrationReferenceNumber] ^extension[http://hl7.org/fhir/StructureDefinition/obligation][+].extension[code].valueCode = #SHALL:able-to-populate
* item.extension[administrationReferenceNumber] ^extension[http://hl7.org/fhir/StructureDefinition/obligation][=].extension[actor].valueCanonical = "http://hl7.org/fhir/us/davinci-pas/ActorDefinition/payer"
* item.extension[administrationReferenceNumber] ^extension[http://hl7.org/fhir/StructureDefinition/obligation][+].extension[code].valueCode = #SHALL:process
* item.extension[administrationReferenceNumber] ^extension[http://hl7.org/fhir/StructureDefinition/obligation][=].extension[actor].valueCanonical = "http://hl7.org/fhir/us/davinci-pas/ActorDefinition/client"
* item.extension[requestedServiceDate] ^short = "The original date/period that was requested by the submitter for this item."
* item.extension[requestedServiceDate] ^extension[http://hl7.org/fhir/StructureDefinition/obligation][+].extension[code].valueCode = #SHALL:able-to-populate
* item.extension[requestedServiceDate] ^extension[http://hl7.org/fhir/StructureDefinition/obligation][=].extension[actor].valueCanonical = "http://hl7.org/fhir/us/davinci-pas/ActorDefinition/payer"
* item.extension[requestedServiceDate] ^extension[http://hl7.org/fhir/StructureDefinition/obligation][+].extension[code].valueCode = #SHALL:process
* item.extension[requestedServiceDate] ^extension[http://hl7.org/fhir/StructureDefinition/obligation][=].extension[actor].valueCanonical = "http://hl7.org/fhir/us/davinci-pas/ActorDefinition/client"
* item.extension[authorizedProvider] ^short = "The specific provider who has been authorized to provide this item."
* item.extension[authorizedProvider] ^extension[http://hl7.org/fhir/StructureDefinition/obligation][+].extension[code].valueCode = #SHALL:able-to-populate
* item.extension[authorizedProvider] ^extension[http://hl7.org/fhir/StructureDefinition/obligation][=].extension[actor].valueCanonical = "http://hl7.org/fhir/us/davinci-pas/ActorDefinition/payer"
* item.extension[authorizedProvider] ^extension[http://hl7.org/fhir/StructureDefinition/obligation][+].extension[code].valueCode = #SHALL:process
* item.extension[authorizedProvider] ^extension[http://hl7.org/fhir/StructureDefinition/obligation][=].extension[actor].valueCanonical = "http://hl7.org/fhir/us/davinci-pas/ActorDefinition/client"
* item.extension[authorizedItemDetail] ^short = "The details of what has been authorized for this item."
* item.extension[authorizedItemDetail] ^extension[http://hl7.org/fhir/StructureDefinition/obligation][+].extension[code].valueCode = #SHALL:able-to-populate
* item.extension[authorizedItemDetail] ^extension[http://hl7.org/fhir/StructureDefinition/obligation][=].extension[actor].valueCanonical = "http://hl7.org/fhir/us/davinci-pas/ActorDefinition/payer"
* item.extension[authorizedItemDetail] ^extension[http://hl7.org/fhir/StructureDefinition/obligation][+].extension[code].valueCode = #SHALL:process
* item.extension[authorizedItemDetail] ^extension[http://hl7.org/fhir/StructureDefinition/obligation][=].extension[actor].valueCanonical = "http://hl7.org/fhir/us/davinci-pas/ActorDefinition/client"
* item.extension[admissionDates] ^short = "The authorized admission dates for this item."
* item.extension[admissionDates] ^extension[http://hl7.org/fhir/StructureDefinition/obligation][+].extension[code].valueCode = #SHALL:able-to-populate
* item.extension[admissionDates] ^extension[http://hl7.org/fhir/StructureDefinition/obligation][=].extension[actor].valueCanonical = "http://hl7.org/fhir/us/davinci-pas/ActorDefinition/payer"
* item.extension[admissionDates] ^extension[http://hl7.org/fhir/StructureDefinition/obligation][+].extension[code].valueCode = #SHALL:process
* item.extension[admissionDates] ^extension[http://hl7.org/fhir/StructureDefinition/obligation][=].extension[actor].valueCanonical = "http://hl7.org/fhir/us/davinci-pas/ActorDefinition/client"
* item.extension[dischargeDate] ^short = "The authorized discharge date for this item."
* item.extension[dischargeDate] ^extension[http://hl7.org/fhir/StructureDefinition/obligation][+].extension[code].valueCode = #SHALL:able-to-populate
* item.extension[dischargeDate] ^extension[http://hl7.org/fhir/StructureDefinition/obligation][=].extension[actor].valueCanonical = "http://hl7.org/fhir/us/davinci-pas/ActorDefinition/payer"
* item.extension[dischargeDate] ^extension[http://hl7.org/fhir/StructureDefinition/obligation][+].extension[code].valueCode = #SHALL:process
* item.extension[dischargeDate] ^extension[http://hl7.org/fhir/StructureDefinition/obligation][=].extension[actor].valueCanonical = "http://hl7.org/fhir/us/davinci-pas/ActorDefinition/client"
* item.itemSequence MS
  * ^short = "Sequence numbers SHALL stay the same across all instances of the Prior Authorization, eg the Claim, ClaimResponse, ClaimUpdate, ClaimUpdateResponse"
  * ^comment = "Each item returned on the PAS ClaimResponse SHALL echo the same item sequence number as that same item had on the Claim. The item.sequence element SHALL serve as the main tracing identifier of items throughout requests and responses."
* item.itemSequence ^extension[http://hl7.org/fhir/StructureDefinition/obligation][+].extension[code].valueCode = #SHALL:able-to-populate
* item.itemSequence ^extension[http://hl7.org/fhir/StructureDefinition/obligation][=].extension[actor].valueCanonical = "http://hl7.org/fhir/us/davinci-pas/ActorDefinition/payer"
* item.itemSequence ^extension[http://hl7.org/fhir/StructureDefinition/obligation][+].extension[code].valueCode = #SHALL:process
* item.itemSequence ^extension[http://hl7.org/fhir/StructureDefinition/obligation][=].extension[actor].valueCanonical = "http://hl7.org/fhir/us/davinci-pas/ActorDefinition/client"
* item.adjudication MS
* item.adjudication ^extension[http://hl7.org/fhir/StructureDefinition/obligation][+].extension[code].valueCode = #SHALL:able-to-populate
* item.adjudication ^extension[http://hl7.org/fhir/StructureDefinition/obligation][=].extension[actor].valueCanonical = "http://hl7.org/fhir/us/davinci-pas/ActorDefinition/payer"
* item.adjudication ^extension[http://hl7.org/fhir/StructureDefinition/obligation][+].extension[code].valueCode = #SHALL:process
* item.adjudication ^extension[http://hl7.org/fhir/StructureDefinition/obligation][=].extension[actor].valueCanonical = "http://hl7.org/fhir/us/davinci-pas/ActorDefinition/client"
* item.adjudication.extension contains ReviewAction named reviewAction 0..1 MS
* item.adjudication.extension[reviewAction] ^extension[http://hl7.org/fhir/StructureDefinition/obligation][+].extension[code].valueCode = #SHALL:able-to-populate
* item.adjudication.extension[reviewAction] ^extension[http://hl7.org/fhir/StructureDefinition/obligation][=].extension[actor].valueCanonical = "http://hl7.org/fhir/us/davinci-pas/ActorDefinition/payer"
* item.adjudication.extension[reviewAction] ^extension[http://hl7.org/fhir/StructureDefinition/obligation][+].extension[code].valueCode = #SHALL:process
* item.adjudication.extension[reviewAction] ^extension[http://hl7.org/fhir/StructureDefinition/obligation][=].extension[actor].valueCanonical = "http://hl7.org/fhir/us/davinci-pas/ActorDefinition/client"
* item.adjudication.extension[reviewAction] ^short = "The details of the review action that is necessary for the authorization."
* item.adjudication.category = http://terminology.hl7.org/CodeSystem/adjudication#submitted
* item.adjudication.category ^short = "This code is fixed to 'submitted' to indicate that the adjudication result is on what was submitted."
* addItem MS
  * extension contains ItemTraceNumber named itemTraceNumber 0..* MS and
    ItemPreAuthIssueDate named preAuthIssueDate 0..1 MS and
    ItemPreAuthPeriod named preAuthPeriod 0..1 MS and
    AuthorizationNumber named previousAuthorizationNumber 0..1 MS and
    AdministrationReferenceNumber named administrationReferenceNumber 0..1 MS and
    EPSDTIndicator named epsdtIndicator 0..1 MS and
    NursingHomeResidentialStatus named nursingHomeResidentialStatus 0..1 MS and
    NursingHomeLevelOfCare named nursingHomeLevelOfCare 0..1 MS and
    ProductOrServiceCodeEnd named productOrServiceCodeEnd 0..1 MS and
    RevenueCode named revenue 0..1 MS and
    RevenueUnitRateLimit named revenueUnitRateLimit 0..1 MS and
    RequestedService named requestedService 0..1 MS and
    ServiceItemRequestType named requestType 0..1 MS and
    CertificationType named certificationType 0..1 MS and
    ClaimResponseItemCategory named category 0..1 and
    AdmissionDates named admissionDates 0..1 MS and
    DischargeDate named dischargeDate 0..1 MS and
    CommunicatedDiagnosis named communicatedDiagnosis 0..* MS
* addItem ^extension[http://hl7.org/fhir/StructureDefinition/obligation][+].extension[code].valueCode = #SHALL:able-to-populate
* addItem ^extension[http://hl7.org/fhir/StructureDefinition/obligation][=].extension[actor].valueCanonical = "http://hl7.org/fhir/us/davinci-pas/ActorDefinition/payer"
* addItem ^extension[http://hl7.org/fhir/StructureDefinition/obligation][+].extension[code].valueCode = #SHALL:process
* addItem ^extension[http://hl7.org/fhir/StructureDefinition/obligation][=].extension[actor].valueCanonical = "http://hl7.org/fhir/us/davinci-pas/ActorDefinition/client"
  * extension[itemTraceNumber] ^extension[http://hl7.org/fhir/StructureDefinition/obligation][+].extension[code].valueCode = #SHALL:able-to-populate
  * extension[itemTraceNumber] ^extension[http://hl7.org/fhir/StructureDefinition/obligation][=].extension[actor].valueCanonical = "http://hl7.org/fhir/us/davinci-pas/ActorDefinition/payer"
  * extension[itemTraceNumber] ^extension[http://hl7.org/fhir/StructureDefinition/obligation][+].extension[code].valueCode = #SHALL:process
  * extension[itemTraceNumber] ^extension[http://hl7.org/fhir/StructureDefinition/obligation][=].extension[actor].valueCanonical = "http://hl7.org/fhir/us/davinci-pas/ActorDefinition/client"
  * extension[preAuthIssueDate] ^extension[http://hl7.org/fhir/StructureDefinition/obligation][+].extension[code].valueCode = #SHALL:able-to-populate
  * extension[preAuthIssueDate] ^extension[http://hl7.org/fhir/StructureDefinition/obligation][=].extension[actor].valueCanonical = "http://hl7.org/fhir/us/davinci-pas/ActorDefinition/payer"
  * extension[preAuthIssueDate] ^extension[http://hl7.org/fhir/StructureDefinition/obligation][+].extension[code].valueCode = #SHALL:process
  * extension[preAuthIssueDate] ^extension[http://hl7.org/fhir/StructureDefinition/obligation][=].extension[actor].valueCanonical = "http://hl7.org/fhir/us/davinci-pas/ActorDefinition/client"
  * extension[preAuthPeriod] ^extension[http://hl7.org/fhir/StructureDefinition/obligation][+].extension[code].valueCode = #SHALL:able-to-populate
  * extension[preAuthPeriod] ^extension[http://hl7.org/fhir/StructureDefinition/obligation][=].extension[actor].valueCanonical = "http://hl7.org/fhir/us/davinci-pas/ActorDefinition/payer"
  * extension[preAuthPeriod] ^extension[http://hl7.org/fhir/StructureDefinition/obligation][+].extension[code].valueCode = #SHALL:process
  * extension[preAuthPeriod] ^extension[http://hl7.org/fhir/StructureDefinition/obligation][=].extension[actor].valueCanonical = "http://hl7.org/fhir/us/davinci-pas/ActorDefinition/client"
  * extension[previousAuthorizationNumber] ^extension[http://hl7.org/fhir/StructureDefinition/obligation][+].extension[code].valueCode = #SHALL:able-to-populate
  * extension[previousAuthorizationNumber] ^extension[http://hl7.org/fhir/StructureDefinition/obligation][=].extension[actor].valueCanonical = "http://hl7.org/fhir/us/davinci-pas/ActorDefinition/payer"
  * extension[previousAuthorizationNumber] ^extension[http://hl7.org/fhir/StructureDefinition/obligation][+].extension[code].valueCode = #SHALL:process
  * extension[previousAuthorizationNumber] ^extension[http://hl7.org/fhir/StructureDefinition/obligation][=].extension[actor].valueCanonical = "http://hl7.org/fhir/us/davinci-pas/ActorDefinition/client"
  * extension[administrationReferenceNumber] ^extension[http://hl7.org/fhir/StructureDefinition/obligation][+].extension[code].valueCode = #SHALL:able-to-populate
  * extension[administrationReferenceNumber] ^extension[http://hl7.org/fhir/StructureDefinition/obligation][=].extension[actor].valueCanonical = "http://hl7.org/fhir/us/davinci-pas/ActorDefinition/payer"
  * extension[administrationReferenceNumber] ^extension[http://hl7.org/fhir/StructureDefinition/obligation][+].extension[code].valueCode = #SHALL:process
  * extension[administrationReferenceNumber] ^extension[http://hl7.org/fhir/StructureDefinition/obligation][=].extension[actor].valueCanonical = "http://hl7.org/fhir/us/davinci-pas/ActorDefinition/client"
  * extension[epsdtIndicator] ^extension[http://hl7.org/fhir/StructureDefinition/obligation][+].extension[code].valueCode = #SHALL:able-to-populate
  * extension[epsdtIndicator] ^extension[http://hl7.org/fhir/StructureDefinition/obligation][=].extension[actor].valueCanonical = "http://hl7.org/fhir/us/davinci-pas/ActorDefinition/payer"
  * extension[epsdtIndicator] ^extension[http://hl7.org/fhir/StructureDefinition/obligation][+].extension[code].valueCode = #SHALL:process
  * extension[epsdtIndicator] ^extension[http://hl7.org/fhir/StructureDefinition/obligation][=].extension[actor].valueCanonical = "http://hl7.org/fhir/us/davinci-pas/ActorDefinition/client"
  * extension[nursingHomeResidentialStatus] ^extension[http://hl7.org/fhir/StructureDefinition/obligation][+].extension[code].valueCode = #SHALL:able-to-populate
  * extension[nursingHomeResidentialStatus] ^extension[http://hl7.org/fhir/StructureDefinition/obligation][=].extension[actor].valueCanonical = "http://hl7.org/fhir/us/davinci-pas/ActorDefinition/payer"
  * extension[nursingHomeResidentialStatus] ^extension[http://hl7.org/fhir/StructureDefinition/obligation][+].extension[code].valueCode = #SHALL:process
  * extension[nursingHomeResidentialStatus] ^extension[http://hl7.org/fhir/StructureDefinition/obligation][=].extension[actor].valueCanonical = "http://hl7.org/fhir/us/davinci-pas/ActorDefinition/client"
  * extension[nursingHomeLevelOfCare] ^extension[http://hl7.org/fhir/StructureDefinition/obligation][+].extension[code].valueCode = #SHALL:able-to-populate
  * extension[nursingHomeLevelOfCare] ^extension[http://hl7.org/fhir/StructureDefinition/obligation][=].extension[actor].valueCanonical = "http://hl7.org/fhir/us/davinci-pas/ActorDefinition/payer"
  * extension[nursingHomeLevelOfCare] ^extension[http://hl7.org/fhir/StructureDefinition/obligation][+].extension[code].valueCode = #SHALL:process
  * extension[nursingHomeLevelOfCare] ^extension[http://hl7.org/fhir/StructureDefinition/obligation][=].extension[actor].valueCanonical = "http://hl7.org/fhir/us/davinci-pas/ActorDefinition/client"
  * extension[productOrServiceCodeEnd] ^extension[http://hl7.org/fhir/StructureDefinition/obligation][+].extension[code].valueCode = #SHALL:able-to-populate
  * extension[productOrServiceCodeEnd] ^extension[http://hl7.org/fhir/StructureDefinition/obligation][=].extension[actor].valueCanonical = "http://hl7.org/fhir/us/davinci-pas/ActorDefinition/payer"
  * extension[productOrServiceCodeEnd] ^extension[http://hl7.org/fhir/StructureDefinition/obligation][+].extension[code].valueCode = #SHALL:process
  * extension[productOrServiceCodeEnd] ^extension[http://hl7.org/fhir/StructureDefinition/obligation][=].extension[actor].valueCanonical = "http://hl7.org/fhir/us/davinci-pas/ActorDefinition/client"
  * extension[revenue] ^extension[http://hl7.org/fhir/StructureDefinition/obligation][+].extension[code].valueCode = #SHALL:able-to-populate
  * extension[revenue] ^extension[http://hl7.org/fhir/StructureDefinition/obligation][=].extension[actor].valueCanonical = "http://hl7.org/fhir/us/davinci-pas/ActorDefinition/payer"
  * extension[revenue] ^extension[http://hl7.org/fhir/StructureDefinition/obligation][+].extension[code].valueCode = #SHALL:process
  * extension[revenue] ^extension[http://hl7.org/fhir/StructureDefinition/obligation][=].extension[actor].valueCanonical = "http://hl7.org/fhir/us/davinci-pas/ActorDefinition/client"
  * extension[revenueUnitRateLimit] ^extension[http://hl7.org/fhir/StructureDefinition/obligation][+].extension[code].valueCode = #SHALL:able-to-populate
  * extension[revenueUnitRateLimit] ^extension[http://hl7.org/fhir/StructureDefinition/obligation][=].extension[actor].valueCanonical = "http://hl7.org/fhir/us/davinci-pas/ActorDefinition/payer"
  * extension[revenueUnitRateLimit] ^extension[http://hl7.org/fhir/StructureDefinition/obligation][+].extension[code].valueCode = #SHALL:process
  * extension[revenueUnitRateLimit] ^extension[http://hl7.org/fhir/StructureDefinition/obligation][=].extension[actor].valueCanonical = "http://hl7.org/fhir/us/davinci-pas/ActorDefinition/client"
  * extension[requestedService] ^extension[http://hl7.org/fhir/StructureDefinition/obligation][+].extension[code].valueCode = #SHALL:able-to-populate
  * extension[requestedService] ^extension[http://hl7.org/fhir/StructureDefinition/obligation][=].extension[actor].valueCanonical = "http://hl7.org/fhir/us/davinci-pas/ActorDefinition/payer"
  * extension[requestedService] ^extension[http://hl7.org/fhir/StructureDefinition/obligation][+].extension[code].valueCode = #SHALL:process
  * extension[requestedService] ^extension[http://hl7.org/fhir/StructureDefinition/obligation][=].extension[actor].valueCanonical = "http://hl7.org/fhir/us/davinci-pas/ActorDefinition/client"
  * extension[requestType] ^extension[http://hl7.org/fhir/StructureDefinition/obligation][+].extension[code].valueCode = #SHALL:able-to-populate
  * extension[requestType] ^extension[http://hl7.org/fhir/StructureDefinition/obligation][=].extension[actor].valueCanonical = "http://hl7.org/fhir/us/davinci-pas/ActorDefinition/payer"
  * extension[requestType] ^extension[http://hl7.org/fhir/StructureDefinition/obligation][+].extension[code].valueCode = #SHALL:process
  * extension[requestType] ^extension[http://hl7.org/fhir/StructureDefinition/obligation][=].extension[actor].valueCanonical = "http://hl7.org/fhir/us/davinci-pas/ActorDefinition/client"
  * extension[certificationType] ^extension[http://hl7.org/fhir/StructureDefinition/obligation][+].extension[code].valueCode = #SHALL:able-to-populate
  * extension[certificationType] ^extension[http://hl7.org/fhir/StructureDefinition/obligation][=].extension[actor].valueCanonical = "http://hl7.org/fhir/us/davinci-pas/ActorDefinition/payer"
  * extension[certificationType] ^extension[http://hl7.org/fhir/StructureDefinition/obligation][+].extension[code].valueCode = #SHALL:process
  * extension[certificationType] ^extension[http://hl7.org/fhir/StructureDefinition/obligation][=].extension[actor].valueCanonical = "http://hl7.org/fhir/us/davinci-pas/ActorDefinition/client"
  * extension[admissionDates] ^extension[http://hl7.org/fhir/StructureDefinition/obligation][+].extension[code].valueCode = #SHALL:able-to-populate
  * extension[admissionDates] ^extension[http://hl7.org/fhir/StructureDefinition/obligation][=].extension[actor].valueCanonical = "http://hl7.org/fhir/us/davinci-pas/ActorDefinition/payer"
  * extension[admissionDates] ^extension[http://hl7.org/fhir/StructureDefinition/obligation][+].extension[code].valueCode = #SHALL:process
  * extension[admissionDates] ^extension[http://hl7.org/fhir/StructureDefinition/obligation][=].extension[actor].valueCanonical = "http://hl7.org/fhir/us/davinci-pas/ActorDefinition/client"
  * extension[dischargeDate] ^extension[http://hl7.org/fhir/StructureDefinition/obligation][+].extension[code].valueCode = #SHALL:able-to-populate
  * extension[dischargeDate] ^extension[http://hl7.org/fhir/StructureDefinition/obligation][=].extension[actor].valueCanonical = "http://hl7.org/fhir/us/davinci-pas/ActorDefinition/payer"
  * extension[dischargeDate] ^extension[http://hl7.org/fhir/StructureDefinition/obligation][+].extension[code].valueCode = #SHALL:process
  * extension[dischargeDate] ^extension[http://hl7.org/fhir/StructureDefinition/obligation][=].extension[actor].valueCanonical = "http://hl7.org/fhir/us/davinci-pas/ActorDefinition/client"
  * extension[communicatedDiagnosis] ^extension[http://hl7.org/fhir/StructureDefinition/obligation][+].extension[code].valueCode = #SHALL:able-to-populate
  * extension[communicatedDiagnosis] ^extension[http://hl7.org/fhir/StructureDefinition/obligation][=].extension[actor].valueCanonical = "http://hl7.org/fhir/us/davinci-pas/ActorDefinition/payer"
  * extension[communicatedDiagnosis] ^extension[http://hl7.org/fhir/StructureDefinition/obligation][+].extension[code].valueCode = #SHALL:process
  * extension[communicatedDiagnosis] ^extension[http://hl7.org/fhir/StructureDefinition/obligation][=].extension[actor].valueCanonical = "http://hl7.org/fhir/us/davinci-pas/ActorDefinition/client"
* addItem.itemSequence 1..1 MS
* addItem.itemSequence ^extension[http://hl7.org/fhir/StructureDefinition/obligation][+].extension[code].valueCode = #SHALL:able-to-populate
* addItem.itemSequence ^extension[http://hl7.org/fhir/StructureDefinition/obligation][=].extension[actor].valueCanonical = "http://hl7.org/fhir/us/davinci-pas/ActorDefinition/payer"
* addItem.itemSequence ^extension[http://hl7.org/fhir/StructureDefinition/obligation][+].extension[code].valueCode = #SHALL:process
* addItem.itemSequence ^extension[http://hl7.org/fhir/StructureDefinition/obligation][=].extension[actor].valueCanonical = "http://hl7.org/fhir/us/davinci-pas/ActorDefinition/client"
* addItem.provider MS
* addItem.provider ^extension[http://hl7.org/fhir/StructureDefinition/obligation][+].extension[code].valueCode = #SHALL:able-to-populate
* addItem.provider ^extension[http://hl7.org/fhir/StructureDefinition/obligation][=].extension[actor].valueCanonical = "http://hl7.org/fhir/us/davinci-pas/ActorDefinition/payer"
* addItem.provider ^extension[http://hl7.org/fhir/StructureDefinition/obligation][+].extension[code].valueCode = #SHALL:process
* addItem.provider ^extension[http://hl7.org/fhir/StructureDefinition/obligation][=].extension[actor].valueCanonical = "http://hl7.org/fhir/us/davinci-pas/ActorDefinition/client"
* addItem.provider only Reference(PASPractitioner or PASOrganization)
* addItem.provider.extension contains AuthorizedProviderType named providerType 0..1 MS
* addItem.provider.extension[providerType] ^extension[http://hl7.org/fhir/StructureDefinition/obligation][+].extension[code].valueCode = #SHALL:able-to-populate
* addItem.provider.extension[providerType] ^extension[http://hl7.org/fhir/StructureDefinition/obligation][=].extension[actor].valueCanonical = "http://hl7.org/fhir/us/davinci-pas/ActorDefinition/payer"
* addItem.provider.extension[providerType] ^extension[http://hl7.org/fhir/StructureDefinition/obligation][+].extension[code].valueCode = #SHALL:process
* addItem.provider.extension[providerType] ^extension[http://hl7.org/fhir/StructureDefinition/obligation][=].extension[actor].valueCanonical = "http://hl7.org/fhir/us/davinci-pas/ActorDefinition/client"
* addItem.productOrService MS
* addItem.productOrService ^extension[http://hl7.org/fhir/StructureDefinition/obligation][+].extension[code].valueCode = #SHALL:able-to-populate
* addItem.productOrService ^extension[http://hl7.org/fhir/StructureDefinition/obligation][=].extension[actor].valueCanonical = "http://hl7.org/fhir/us/davinci-pas/ActorDefinition/payer"
* addItem.productOrService ^extension[http://hl7.org/fhir/StructureDefinition/obligation][+].extension[code].valueCode = #SHALL:process
* addItem.productOrService ^extension[http://hl7.org/fhir/StructureDefinition/obligation][=].extension[actor].valueCanonical = "http://hl7.org/fhir/us/davinci-pas/ActorDefinition/client"
* addItem.productOrService from X12278RequestedServiceType (required)
* addItem.modifier MS
* addItem.modifier ^extension[http://hl7.org/fhir/StructureDefinition/obligation][+].extension[code].valueCode = #SHALL:able-to-populate
* addItem.modifier ^extension[http://hl7.org/fhir/StructureDefinition/obligation][=].extension[actor].valueCanonical = "http://hl7.org/fhir/us/davinci-pas/ActorDefinition/payer"
* addItem.modifier ^extension[http://hl7.org/fhir/StructureDefinition/obligation][+].extension[code].valueCode = #SHALL:process
* addItem.modifier ^extension[http://hl7.org/fhir/StructureDefinition/obligation][=].extension[actor].valueCanonical = "http://hl7.org/fhir/us/davinci-pas/ActorDefinition/client"
* addItem.modifier from X12278RequestedServiceModifierType (required)
* addItem.serviced[x] MS
* addItem.serviced[x] ^extension[http://hl7.org/fhir/StructureDefinition/obligation][+].extension[code].valueCode = #SHALL:able-to-populate
* addItem.serviced[x] ^extension[http://hl7.org/fhir/StructureDefinition/obligation][=].extension[actor].valueCanonical = "http://hl7.org/fhir/us/davinci-pas/ActorDefinition/payer"
* addItem.serviced[x] ^extension[http://hl7.org/fhir/StructureDefinition/obligation][+].extension[code].valueCode = #SHALL:process
* addItem.serviced[x] ^extension[http://hl7.org/fhir/StructureDefinition/obligation][=].extension[actor].valueCanonical = "http://hl7.org/fhir/us/davinci-pas/ActorDefinition/client"
* addItem.location[x] MS
* addItem.location[x] ^extension[http://hl7.org/fhir/StructureDefinition/obligation][+].extension[code].valueCode = #SHALL:able-to-populate
* addItem.location[x] ^extension[http://hl7.org/fhir/StructureDefinition/obligation][=].extension[actor].valueCanonical = "http://hl7.org/fhir/us/davinci-pas/ActorDefinition/payer"
* addItem.location[x] ^extension[http://hl7.org/fhir/StructureDefinition/obligation][+].extension[code].valueCode = #SHALL:process
* addItem.location[x] ^extension[http://hl7.org/fhir/StructureDefinition/obligation][=].extension[actor].valueCanonical = "http://hl7.org/fhir/us/davinci-pas/ActorDefinition/client"
* addItem.quantity MS
* addItem.quantity ^extension[http://hl7.org/fhir/StructureDefinition/obligation][+].extension[code].valueCode = #SHALL:able-to-populate
* addItem.quantity ^extension[http://hl7.org/fhir/StructureDefinition/obligation][=].extension[actor].valueCanonical = "http://hl7.org/fhir/us/davinci-pas/ActorDefinition/payer"
* addItem.quantity ^extension[http://hl7.org/fhir/StructureDefinition/obligation][+].extension[code].valueCode = #SHALL:process
* addItem.quantity ^extension[http://hl7.org/fhir/StructureDefinition/obligation][=].extension[actor].valueCanonical = "http://hl7.org/fhir/us/davinci-pas/ActorDefinition/client"
* addItem.quantity only PASQuantity
* addItem.unitPrice MS
* addItem.unitPrice ^extension[http://hl7.org/fhir/StructureDefinition/obligation][+].extension[code].valueCode = #SHALL:able-to-populate
* addItem.unitPrice ^extension[http://hl7.org/fhir/StructureDefinition/obligation][=].extension[actor].valueCanonical = "http://hl7.org/fhir/us/davinci-pas/ActorDefinition/payer"
* addItem.unitPrice ^extension[http://hl7.org/fhir/StructureDefinition/obligation][+].extension[code].valueCode = #SHALL:process
* addItem.unitPrice ^extension[http://hl7.org/fhir/StructureDefinition/obligation][=].extension[actor].valueCanonical = "http://hl7.org/fhir/us/davinci-pas/ActorDefinition/client"
* addItem.adjudication MS
* addItem.adjudication ^extension[http://hl7.org/fhir/StructureDefinition/obligation][+].extension[code].valueCode = #SHALL:able-to-populate
* addItem.adjudication ^extension[http://hl7.org/fhir/StructureDefinition/obligation][=].extension[actor].valueCanonical = "http://hl7.org/fhir/us/davinci-pas/ActorDefinition/payer"
* addItem.adjudication ^extension[http://hl7.org/fhir/StructureDefinition/obligation][+].extension[code].valueCode = #SHALL:process
* addItem.adjudication ^extension[http://hl7.org/fhir/StructureDefinition/obligation][=].extension[actor].valueCanonical = "http://hl7.org/fhir/us/davinci-pas/ActorDefinition/client"
* addItem.adjudication.extension contains ReviewAction named reviewAction 0..1 MS
* addItem.adjudication.extension[reviewAction] ^extension[http://hl7.org/fhir/StructureDefinition/obligation][+].extension[code].valueCode = #SHALL:able-to-populate
* addItem.adjudication.extension[reviewAction] ^extension[http://hl7.org/fhir/StructureDefinition/obligation][=].extension[actor].valueCanonical = "http://hl7.org/fhir/us/davinci-pas/ActorDefinition/payer"
* addItem.adjudication.extension[reviewAction] ^extension[http://hl7.org/fhir/StructureDefinition/obligation][+].extension[code].valueCode = #SHALL:process
* addItem.adjudication.extension[reviewAction] ^extension[http://hl7.org/fhir/StructureDefinition/obligation][=].extension[actor].valueCanonical = "http://hl7.org/fhir/us/davinci-pas/ActorDefinition/client"
* addItem.adjudication.extension[reviewAction] ^short = "The details of the review action that is necessary for the authorization."
* addItem.adjudication.category = http://terminology.hl7.org/CodeSystem/adjudication#submitted
* addItem.adjudication.category ^short = "This code is fixed to 'submitted' to indicate that the adjudication result is on what was submitted."
* adjudication MS
* adjudication ^extension[http://hl7.org/fhir/StructureDefinition/obligation][+].extension[code].valueCode = #SHALL:able-to-populate
* adjudication ^extension[http://hl7.org/fhir/StructureDefinition/obligation][=].extension[actor].valueCanonical = "http://hl7.org/fhir/us/davinci-pas/ActorDefinition/payer"
* adjudication ^extension[http://hl7.org/fhir/StructureDefinition/obligation][+].extension[code].valueCode = #SHALL:process
* adjudication ^extension[http://hl7.org/fhir/StructureDefinition/obligation][=].extension[actor].valueCanonical = "http://hl7.org/fhir/us/davinci-pas/ActorDefinition/client"
* adjudication.extension contains ReviewAction named reviewAction 0..1 MS
* adjudication.extension[reviewAction] ^extension[http://hl7.org/fhir/StructureDefinition/obligation][+].extension[code].valueCode = #SHALL:able-to-populate
* adjudication.extension[reviewAction] ^extension[http://hl7.org/fhir/StructureDefinition/obligation][=].extension[actor].valueCanonical = "http://hl7.org/fhir/us/davinci-pas/ActorDefinition/payer"
* adjudication.extension[reviewAction] ^extension[http://hl7.org/fhir/StructureDefinition/obligation][+].extension[code].valueCode = #SHALL:process
* adjudication.extension[reviewAction] ^extension[http://hl7.org/fhir/StructureDefinition/obligation][=].extension[actor].valueCanonical = "http://hl7.org/fhir/us/davinci-pas/ActorDefinition/client"
* adjudication.extension[reviewAction] ^short = "The details of the review action that is necessary for the authorization."
* adjudication.category = http://terminology.hl7.org/CodeSystem/adjudication#submitted
* adjudication.category ^short = "This code is fixed to 'submitted' to indicate that the adjudication result is on what was submitted."
* item.noteNumber MS
* item.noteNumber ^extension[http://hl7.org/fhir/StructureDefinition/obligation][+].extension[code].valueCode = #SHALL:able-to-populate
* item.noteNumber ^extension[http://hl7.org/fhir/StructureDefinition/obligation][=].extension[actor].valueCanonical = "http://hl7.org/fhir/us/davinci-pas/ActorDefinition/payer"
* item.noteNumber ^extension[http://hl7.org/fhir/StructureDefinition/obligation][+].extension[code].valueCode = #SHALL:process
* item.noteNumber ^extension[http://hl7.org/fhir/StructureDefinition/obligation][=].extension[actor].valueCanonical = "http://hl7.org/fhir/us/davinci-pas/ActorDefinition/client"
* processNote MS
* processNote ^extension[http://hl7.org/fhir/StructureDefinition/obligation][+].extension[code].valueCode = #SHALL:able-to-populate
* processNote ^extension[http://hl7.org/fhir/StructureDefinition/obligation][=].extension[actor].valueCanonical = "http://hl7.org/fhir/us/davinci-pas/ActorDefinition/payer"
* processNote ^extension[http://hl7.org/fhir/StructureDefinition/obligation][+].extension[code].valueCode = #SHALL:process
* processNote ^extension[http://hl7.org/fhir/StructureDefinition/obligation][=].extension[actor].valueCanonical = "http://hl7.org/fhir/us/davinci-pas/ActorDefinition/client"
* processNote.number 1..1 MS
* processNote.number ^extension[http://hl7.org/fhir/StructureDefinition/obligation][+].extension[code].valueCode = #SHALL:able-to-populate
* processNote.number ^extension[http://hl7.org/fhir/StructureDefinition/obligation][=].extension[actor].valueCanonical = "http://hl7.org/fhir/us/davinci-pas/ActorDefinition/payer"
* processNote.number ^extension[http://hl7.org/fhir/StructureDefinition/obligation][+].extension[code].valueCode = #SHALL:process
* processNote.number ^extension[http://hl7.org/fhir/StructureDefinition/obligation][=].extension[actor].valueCanonical = "http://hl7.org/fhir/us/davinci-pas/ActorDefinition/client"
* processNote.text MS
* processNote.text ^extension[http://hl7.org/fhir/StructureDefinition/obligation][+].extension[code].valueCode = #SHALL:able-to-populate
* processNote.text ^extension[http://hl7.org/fhir/StructureDefinition/obligation][=].extension[actor].valueCanonical = "http://hl7.org/fhir/us/davinci-pas/ActorDefinition/payer"
* processNote.text ^extension[http://hl7.org/fhir/StructureDefinition/obligation][+].extension[code].valueCode = #SHALL:process
* processNote.text ^extension[http://hl7.org/fhir/StructureDefinition/obligation][=].extension[actor].valueCanonical = "http://hl7.org/fhir/us/davinci-pas/ActorDefinition/client"

* error MS
* error ^extension[http://hl7.org/fhir/StructureDefinition/obligation][+].extension[code].valueCode = #SHALL:able-to-populate
* error ^extension[http://hl7.org/fhir/StructureDefinition/obligation][=].extension[actor].valueCanonical = "http://hl7.org/fhir/us/davinci-pas/ActorDefinition/payer"
* error ^extension[http://hl7.org/fhir/StructureDefinition/obligation][+].extension[code].valueCode = #SHALL:process
* error ^extension[http://hl7.org/fhir/StructureDefinition/obligation][=].extension[actor].valueCanonical = "http://hl7.org/fhir/us/davinci-pas/ActorDefinition/client"
* error.extension contains ErrorFollowupAction named followupAction 0..1 MS and ErrorElement named errorElement 0..1 MS and ErrorPath named errorPath 0..1 MS
* error.extension[followupAction] ^short = "A code representing what action must occur to resolve this error."
* error.extension[followupAction] ^extension[http://hl7.org/fhir/StructureDefinition/obligation][+].extension[code].valueCode = #SHALL:able-to-populate
* error.extension[followupAction] ^extension[http://hl7.org/fhir/StructureDefinition/obligation][=].extension[actor].valueCanonical = "http://hl7.org/fhir/us/davinci-pas/ActorDefinition/payer"
* error.extension[followupAction] ^extension[http://hl7.org/fhir/StructureDefinition/obligation][+].extension[code].valueCode = #SHALL:process
* error.extension[followupAction] ^extension[http://hl7.org/fhir/StructureDefinition/obligation][=].extension[actor].valueCanonical = "http://hl7.org/fhir/us/davinci-pas/ActorDefinition/client"
* error.extension[errorElement] ^short = "The specific X12 loop, segment, or element that this error information is about."
* error.extension[errorElement] ^extension[http://hl7.org/fhir/StructureDefinition/obligation][+].extension[code].valueCode = #SHALL:able-to-populate
* error.extension[errorElement] ^extension[http://hl7.org/fhir/StructureDefinition/obligation][=].extension[actor].valueCanonical = "http://hl7.org/fhir/us/davinci-pas/ActorDefinition/payer"
* error.extension[errorElement] ^extension[http://hl7.org/fhir/StructureDefinition/obligation][+].extension[code].valueCode = #SHALL:process
* error.extension[errorElement] ^extension[http://hl7.org/fhir/StructureDefinition/obligation][=].extension[actor].valueCanonical = "http://hl7.org/fhir/us/davinci-pas/ActorDefinition/client"
* error.extension[errorPath] ^short = "The FHIRPath expression that indicates which FHIR element that this error information is about."
* error.extension[errorPath] ^extension[http://hl7.org/fhir/StructureDefinition/obligation][+].extension[code].valueCode = #SHALL:able-to-populate
* error.extension[errorPath] ^extension[http://hl7.org/fhir/StructureDefinition/obligation][=].extension[actor].valueCanonical = "http://hl7.org/fhir/us/davinci-pas/ActorDefinition/payer"
* error.extension[errorPath] ^extension[http://hl7.org/fhir/StructureDefinition/obligation][+].extension[code].valueCode = #SHALL:process
* error.extension[errorPath] ^extension[http://hl7.org/fhir/StructureDefinition/obligation][=].extension[actor].valueCanonical = "http://hl7.org/fhir/us/davinci-pas/ActorDefinition/client"
* error.code MS
* error.code ^extension[http://hl7.org/fhir/StructureDefinition/obligation][+].extension[code].valueCode = #SHALL:able-to-populate
* error.code ^extension[http://hl7.org/fhir/StructureDefinition/obligation][=].extension[actor].valueCanonical = "http://hl7.org/fhir/us/davinci-pas/ActorDefinition/payer"
* error.code ^extension[http://hl7.org/fhir/StructureDefinition/obligation][+].extension[code].valueCode = #SHALL:process
* error.code ^extension[http://hl7.org/fhir/StructureDefinition/obligation][=].extension[actor].valueCanonical = "http://hl7.org/fhir/us/davinci-pas/ActorDefinition/client"
* error.code from X12278RejectReasonCodes (required)

* extension contains ClaimResponseReviewer named claimResponseReviewer 0..1 MS
* extension[claimResponseReviewer] ^short = "The responsible practitioner who reviewed to the request"
* extension[claimResponseReviewer] ^extension[http://hl7.org/fhir/StructureDefinition/obligation][+].extension[code].valueCode = #SHALL:able-to-populate
* extension[claimResponseReviewer] ^extension[http://hl7.org/fhir/StructureDefinition/obligation][=].extension[actor].valueCanonical = "http://hl7.org/fhir/us/davinci-pas/ActorDefinition/payer"
* extension[claimResponseReviewer] ^extension[http://hl7.org/fhir/StructureDefinition/obligation][+].extension[code].valueCode = #SHALL:process
* extension[claimResponseReviewer] ^extension[http://hl7.org/fhir/StructureDefinition/obligation][=].extension[actor].valueCanonical = "http://hl7.org/fhir/us/davinci-pas/ActorDefinition/client"

* extension contains ItemAuthorizedProvider named authorizedProvider 0..* MS
* extension[authorizedProvider] ^extension[http://hl7.org/fhir/StructureDefinition/obligation][+].extension[code].valueCode = #SHALL:able-to-populate
* extension[authorizedProvider] ^extension[http://hl7.org/fhir/StructureDefinition/obligation][=].extension[actor].valueCanonical = "http://hl7.org/fhir/us/davinci-pas/ActorDefinition/payer"
* extension[authorizedProvider] ^extension[http://hl7.org/fhir/StructureDefinition/obligation][+].extension[code].valueCode = #SHALL:process
* extension[authorizedProvider] ^extension[http://hl7.org/fhir/StructureDefinition/obligation][=].extension[actor].valueCanonical = "http://hl7.org/fhir/us/davinci-pas/ActorDefinition/client"
* extension contains AuthorizationNumber named authorizationNumber 0..1 MS
* extension[authorizationNumber] ^extension[http://hl7.org/fhir/StructureDefinition/obligation][+].extension[code].valueCode = #SHALL:able-to-populate
* extension[authorizationNumber] ^extension[http://hl7.org/fhir/StructureDefinition/obligation][=].extension[actor].valueCanonical = "http://hl7.org/fhir/us/davinci-pas/ActorDefinition/payer"
* extension[authorizationNumber] ^extension[http://hl7.org/fhir/StructureDefinition/obligation][+].extension[code].valueCode = #SHALL:process
* extension[authorizationNumber] ^extension[http://hl7.org/fhir/StructureDefinition/obligation][=].extension[actor].valueCanonical = "http://hl7.org/fhir/us/davinci-pas/ActorDefinition/client"

Profile: PASClaimResponse
Parent: PASClaimResponseBase
Id: profile-claimresponse
Title: "PAS Claim Response"
Description: "PAS constraints on Claim resource mandating support for elements relevant to the response of a prior authorization request"
* . ^short = "Response to a preauthorization"
* item.extension contains CommunicatedDiagnosis named communicatedDiagnosis 0..* MS
* item.extension[communicatedDiagnosis] ^extension[http://hl7.org/fhir/StructureDefinition/obligation][+].extension[code].valueCode = #SHALL:able-to-populate
* item.extension[communicatedDiagnosis] ^extension[http://hl7.org/fhir/StructureDefinition/obligation][=].extension[actor].valueCanonical = "http://hl7.org/fhir/us/davinci-pas/ActorDefinition/payer"
* item.extension[communicatedDiagnosis] ^extension[http://hl7.org/fhir/StructureDefinition/obligation][+].extension[code].valueCode = #SHALL:process
* item.extension[communicatedDiagnosis] ^extension[http://hl7.org/fhir/StructureDefinition/obligation][=].extension[actor].valueCanonical = "http://hl7.org/fhir/us/davinci-pas/ActorDefinition/client"
* item.extension[communicatedDiagnosis] ^short = "A code representing the diagnosis that is relevant to the preauthorization."
* communicationRequest MS
* communicationRequest ^extension[http://hl7.org/fhir/StructureDefinition/obligation][+].extension[code].valueCode = #SHALL:able-to-populate
* communicationRequest ^extension[http://hl7.org/fhir/StructureDefinition/obligation][=].extension[actor].valueCanonical = "http://hl7.org/fhir/us/davinci-pas/ActorDefinition/payer"
* communicationRequest ^extension[http://hl7.org/fhir/StructureDefinition/obligation][+].extension[code].valueCode = #SHALL:process
* communicationRequest ^extension[http://hl7.org/fhir/StructureDefinition/obligation][=].extension[actor].valueCanonical = "http://hl7.org/fhir/us/davinci-pas/ActorDefinition/client"
* communicationRequest only Reference(PASCommunicationRequest)

Extension: ReviewAction
Id: extension-reviewAction
Title: "Review Action"
Description: "The details of the review action that is necessary for the authorization."
* extension contains ReviewActionCode named code 0..1 and number 0..1 and reasonCode 0..* and secondSurgicalOpinionFlag 0..1
* extension[code] ^short = "Healthcare Services Outcome"
* extension[number].value[x] only string
* extension[number] ^short = "Item Level Review Number"
* extension[reasonCode].value[x] only CodeableConcept
* extension[reasonCode].valueCodeableConcept from X12278ReviewDecisionReasonCode (required)
* extension[reasonCode] ^short = "Certification Action Code: indicates the reason for the approved, denied, or pended services"
* extension[secondSurgicalOpinionFlag].value[x] only boolean
* extension[secondSurgicalOpinionFlag] ^short = "Whether a second surgical opinion is need for approval"
* ^context[+].type = #element
* ^context[=].expression = "ClaimResponse.adjudication"
* ^context[+].type = #element
* ^context[=].expression = "ClaimResponse.item.adjudication"
* ^context[+].type = #element
* ^context[=].expression = "ClaimResponse.addItem.adjudication"

Extension: ReviewActionCode
Id: extension-reviewActionCode
Title: "Review Action Code"
Description: "The code describing the result of the review."
* value[x] only CodeableConcept
* valueCodeableConcept from https://valueset.x12.org/x217/005010/response/2000E/HCR/1/01/00/306 (required)
* valueCodeableConcept ^binding.description = "Codes indicating type of action. These codes are listed within an X12 implementation guide (TR3) and maintained by X12. All X12 work products are copyrighted. See their website for licensing terms and conditions."
* ^context[+].type = #element
* ^context[=].expression = "ClaimResponse.addItem.adjudication.extension"
* ^context[+].type = #element
* ^context[=].expression = "ClaimResponse.item.adjudication.extension"
* ^context[+].type = #element
* ^context[=].expression = "ClaimResponse.adjudication.extension"
* ^context[+].type = #element
* ^context[=].expression = "Claim.item"

Extension: ItemPreAuthIssueDate
Id: extension-itemPreAuthIssueDate
Title: "Item Preauthorization Issue Date"
Description: "The date when this item's preauthorization was issued."
* value[x] only date
* ^context[+].type = #element
* ^context[=].expression = "ClaimResponse.item"
* ^context[+].type = #element
* ^context[=].expression = "ClaimResponse.addItem"
* ^context[+].type = #element
* ^context[=].expression = "ExplanationOfBenefit.item"

Extension: ItemRequestedServiceDate
Id: extension-itemRequestedServiceDate
Title: "Item Requested Service Date"
Description: "The original date/period that was requested by the submitter for this item."
* value[x] only dateTime or Period
* ^context[+].type = #element
* ^context[=].expression = "ClaimResponse.item"
* ^context[+].type = #element
* ^context[=].expression = "ClaimResponse.addItem"

Extension: ItemPreAuthPeriod
Id: extension-itemPreAuthPeriod
Title: "Item Preauthorization Period"
Description: "The date/period when this item's preauthorization is valid."
* value[x] only Period
* ^context[+].type = #element
* ^context[=].expression = "ClaimResponse.item"
* ^context[+].type = #element
* ^context[=].expression = "ClaimResponse.addItem"
* ^context[+].type = #element
* ^context[=].expression = "ExplanationOfBenefit.item"

Extension: RevenueCode
Id: extension-revenueCode
Title: "Revenue Code"
Description: "A revenue code that expresses what was approved which maps to X12 SV201"
* value[x] only CodeableConcept
* valueCodeableConcept from AHANUBCRevenueCodes (required)
* ^context[+].type = #element
* ^context[=].expression = "ClaimResponse.addItem"

Extension: ErrorElement
Id: extension-errorElement
Title: "Error Element"
Description: "The specific loop, segment, or element that this error information is about.  The string will follow the X12 format for specifying elements and is returned from the Payer.  Example: 2010A-NM103"
* extension contains processNote 0..1 and error 0..1
* extension[processNote].value[x] only positiveInt
* extension[error].value[x] only string
* ^context[+].type = #element
* ^context[=].expression = "ClaimResponse.error"

Extension: ErrorPath
Id: extension-errorPath
Title: "Error Path"
Description: """The [FHIRPath](https://www.hl7.org/fhirpath/) expression that indicates which FHIR element that this error information is about.  The expression will start with the Bundle and can be followed to determine the specific element.

STU NOTE: We would like feedback during the STU period on whether this extension is sufficient for implementers to determine and display the errored element.

Examples: Bundle.entry[1].resource.name, Bundle.entry[0].resource.identifier[0].value
"""
* value[x] only string
* ^context[+].type = #element
* ^context[=].expression = "ClaimResponse.error"

Extension: ErrorFollowupAction
Id: extension-errorFollowupAction
Title: "Error Follow-up Action"
Description: "A code representing what action must occur to resolve this error."
* value[x] only CodeableConcept
* valueCodeableConcept from X12278FollowUpActionCodes (required)
* ^context[+].type = #element
* ^context[=].expression = "ClaimResponse.error"

Extension: ItemAuthorizedDetail
Id: extension-itemAuthorizedDetail
Title: "Item Authorized Detail"
Description: "The details of what has been authorized for this item."
* extension contains productOrServiceCode 0..1 and ProductOrServiceCodeEnd named productOrServiceCodeEnd 0..1 and modifier 0..* and unitPrice 0..1 and quantity 0..1 and EPSDTIndicator named epsdtIndicator 0..1 and NursingHomeLevelOfCare named nursingHomeLevelOfCare 0..1 and RevenueCode named revenue 0..1 and RevenueUnitRateLimit named revenueUnitRateLimit 0..1 and RequestedService named authorizedService 0..1
* extension[productOrServiceCode].value[x] only CodeableConcept
* extension[productOrServiceCode].valueCodeableConcept from X12278RequestedServiceType (required)
* extension[modifier].value[x] only CodeableConcept
* extension[modifier].valueCodeableConcept from X12278RequestedServiceModifierType (required)
* extension[unitPrice].value[x] only Money
* extension[quantity].value[x] only PASQuantity
* ^context[+].type = #element
* ^context[=].expression = "ExplanationOfBenefit"
* ^context[+].type = #element
* ^context[=].expression = "ExplanationOfBenefit.item"
* ^context[+].type = #element
* ^context[=].expression = "ClaimResponse.item"

Extension: AuthorizedProviderType
Id: extension-authorizedProviderType
Title: "Authorized Provider Type"
Description: "The type of provider who has been authorized to provide this item."
* value[x] only CodeableConcept
* valueCodeableConcept from https://valueset.x12.org/x217/005010/response/2010EA/NM1/1/01/00/98 (required)
* valueCodeableConcept ^binding.description = "Code identifying an organization entity, a physical location, property or an individual. These codes are listed within an X12 implementation guide (TR3) and maintained by X12. All X12 work products are copyrighted. See their website for licensing terms and conditions."
* ^context[+].type = #element
* ^context[=].expression = "ClaimResponse.addItem.provider"
* ^context[+].type = #element
* ^context[=].expression = "ClaimResponse.item.extension"

Extension: ItemAuthorizedProvider
Id: extension-itemAuthorizedProvider
Title: "Item Authorized Provider"
Description: "The specific provider who has been authorized to provide this item."
* extension contains provider 0..1 and 
                     AuthorizedProviderType named providerType 1..1 and
                     role 0..1 and
                     qualification 0..1
* extension[provider].value[x] only Reference(PASPractitioner or PASOrganization)
* extension[role].value[x] only CodeableConcept
* extension[role].valueCodeableConcept from http://hl7.org/fhir/ValueSet/claim-careteamrole (required)
* extension[qualification].value[x] only CodeableConcept
* extension[qualification].valueCodeableConcept from http://hl7.org/fhir/ValueSet/provider-qualification (example)
* ^context[+].type = #element
* ^context[=].expression = "ExplanationOfBenefit"
* ^context[+].type = #element
* ^context[=].expression = "ExplanationOfBenefit.item"
* ^context[+].type = #element
* ^context[=].expression = "ClaimResponse"
* ^context[+].type = #element
* ^context[=].expression = "ClaimResponse.item"

Profile: PASClaimInquiryResponse
Parent: PASClaimResponseBase
Id: profile-claiminquiryresponse
Title: "PAS Claim Inquiry Response"
Description: "PAS constraints on Claim resource mandating support for elements relevant to the response of an inquiry for details of previous authorizations."
* . ^short = "Response to a preauthorization query"
* extension[communicatedDiagnosis] ^short = "A code representing the diagnosis that is relevant to the preauthorization."

Extension: ClaimResponseItemCategory
Id: extension-itemCategory
Title: "Claim Response Item Category"
Description: "The claim item category being responded to."
* value[x] only CodeableConcept
* valueCodeableConcept from https://valueset.x12.org/x217/005010/request/2000F/UM/1/03/00/1365 (required)
* valueCodeableConcept ^binding.description = "Codes identifying the classification of service. These codes are listed within an X12 implementation guide (TR3) and maintained by X12. All X12 work products are copyrighted. See their website for licensing terms and conditions."
* ^context[+].type = #element
* ^context[=].expression = "ClaimResponse.addItem"

Extension: ClaimResponseReviewer
Id: extension-claimResponseReviewer
Title: "Claim Response Reviewer"
Description: "The responsible practitioner who reviewed to the request."
* extension contains wasHumanReviewedFlag 1..1 and
            reviewerNPI 0..1 and
            reviewerSpecialty 0..1   
* extension[wasHumanReviewedFlag].value[x] only boolean
* extension[reviewerNPI].value[x] only PASIdentifier
* extension[reviewerSpecialty].value[x] only CodeableConcept
* extension[reviewerSpecialty].value[x] from http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.114222.4.11.1066 (extensible)
* ^context[+].type = #element
* ^context[=].expression = "ClaimResponse"
* ^context[+].type = #element
* ^context[=].expression = "ExplanationOfBenefit"

Extension: AdmissionDates
Id: extension-admissionDates
Title: "Admission Dates"
Description: "The authorized admission dates for inpatient services."
* value[x] only date or Period
* valueDate obeys FullDateRule
* valuePeriod.start obeys FullDateRule
* valuePeriod.end obeys FullDateRule
* ^context[+].type = #element
* ^context[=].expression = "ClaimResponse.addItem"
* ^context[+].type = #element
* ^context[=].expression = "ClaimResponse.item"
* ^context[+].type = #element
* ^context[=].expression = "ExplanationOfBenefit.item"

Extension: DischargeDate
Id: extension-dischargeDate
Title: "Discharge Date"
Description: "The authorized discharge date for inpatient services."
* value[x] only date
* valueDate obeys FullDateRule
* ^context[+].type = #element
* ^context[=].expression = "ClaimResponse.addItem"
* ^context[+].type = #element
* ^context[=].expression = "ClaimResponse.item"
* ^context[+].type = #element
* ^context[=].expression = "ExplanationOfBenefit.item"

Extension: OutcomeCode
Id: extension-outcomeCode
Title: "Outcome BHT06 Code"
Description: "The BHT06 code pertaining to the ClaimResponse outcome."
* value[x] only code
* ^context[+].type = #element
* ^context[=].expression = "ClaimResponse.outcome"
