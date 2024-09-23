Profile: PASClaimResponseBase
Parent: ClaimResponse
Id: profile-claimresponse-base
Title: "PAS Claim Response Base"
Description: "PAS constraints on ClaimResponse resource that are common to both the request and the inquiry."
* ^abstract = true
* . ^short = "Response to a preauthorization"
* identifier MS
* identifier only PASIdentifier
* identifier.system ^short = "Should use a scheme of 'urn:trnorg:<TRN03>'"
* status MS
* status = #active
* use = #preauthorization
* patient MS
* patient only Reference(PASBeneficiary)
* created MS
* insurer MS
* insurer only Reference(PASInsurer)
* requestor MS
* requestor only Reference(PASRequestor or PASPractitionerRole)
* request MS
* request only Reference(PASClaim)
* outcome MS
* preAuthPeriod MS
* item MS
* item.extension contains ItemTraceNumber named itemTraceNumber 0..* MS and
	ItemPreAuthIssueDate named preAuthIssueDate 0..1 MS and
	ItemPreAuthPeriod named preAuthPeriod 0..1 MS and
	AuthorizationNumber named previousAuthorizationNumber 0..1 MS and
	AdministrationReferenceNumber named administrationReferenceNumber 0..1 MS and
	ItemRequestedServiceDate named requestedServiceDate 0..1 MS and
	ItemAuthorizedDetail named authorizedItemDetail 0..1 MS and
	ItemAuthorizedProvider named authorizedProvider 0..* MS
* item.extension[itemTraceNumber] ^short = "Uniquely identifies this claim item. (2000F-TRN)"
* item.extension[preAuthIssueDate] ^short = "The date when this item's preauthorization was issued."
* item.extension[preAuthPeriod] ^short = "The date/period when this item's preauthorization is valid."
* item.extension[previousAuthorizationNumber] ^short = "A string assigned by the UMO to an authorized review outcome associated with this service item."
* item.extension[administrationReferenceNumber] ^short = "A string assigned by the UMO to the original disallowed review outcome associated with this service item."
* item.extension[requestedServiceDate] ^short = "The original date/period that was requested by the submitter for this item."
* item.extension[authorizedItemDetail] ^short = "The details of what has been authorized for this item."
* item.extension[authorizedProvider] ^short = "The specific provider who has been authorized to provide this item."
* item.itemSequence MS
* item.adjudication MS
* item.adjudication.extension contains ReviewAction named reviewAction 0..1 MS
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
    RevenueUnitRateLimit named revenueUnitRateLimit 0..1 MS and
    RequestedService named requestedService 0..1 MS
  * itemSequence 1..1 MS
  * provider MS
  * provider only Reference(PASPractitioner or PASOrganization)
  * productOrService MS
  * productOrService from X12278RequestedServiceType (required)
  * modifier MS
  * modifier from X12278RequestedServiceModifierType (required)
  * serviced[x] MS
  * location[x] MS
  * quantity MS
  * unitPrice MS
  * adjudication MS
  * adjudication.extension contains ReviewAction named reviewAction 0..1 MS
  * adjudication.extension[reviewAction] ^short = "The details of the review action that is necessary for the authorization."
  * adjudication.category = http://terminology.hl7.org/CodeSystem/adjudication#submitted
  * adjudication.category ^short = "This code is fixed to 'submitted' to indicate that the adjudication result is on what was submitted."

* error MS
* error.extension contains ErrorFollowupAction named followupAction 0..1 MS and ErrorElement named errorElement 0..1 MS and ErrorPath named errorPath 0..1 MS
* error.extension[followupAction] ^short = "A code representing what action must occur to resolve this error."
* error.extension[errorElement] ^short = "The specific X12 loop, segment, or element that this error information is about."
* error.extension[errorPath] ^short = "The FHIRPath expression that indicates which FHIR element that this error information is about."
* error.code MS
* error.code from X12278RejectReasonCodes (required)

Profile: PASClaimResponse
Parent: PASClaimResponseBase
Id: profile-claimresponse
Title: "PAS Claim Response"
Description: "PAS constraints on Claim resource mandating support for elements relevant to the response of a prior authorization request"
* . ^short = "Response to a preauthorization"
* item.extension contains CommunicatedDiagnosis named communicatedDiagnosis 0..* MS
* item.extension[communicatedDiagnosis] ^short = "A code representing the diagnosis that is relevant to the preauthorization."
* item.noteNumber MS
* communicationRequest MS
* communicationRequest only Reference(PASCommunicationRequest)
* processNote MS
* processNote.number 1..1 MS
* processNote.text MS

Extension: ReviewAction
Id: extension-reviewAction
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
* ^context[=].expression = "ExplanationOfBenefit"
* ^context[+].type = #element
* ^context[=].expression = "ClaimResponse.item.adjudication"
* ^context[+].type = #element
* ^context[=].expression = "ClaimResponse.addItem.adjudication"

Extension: ReviewActionCode
Id: extension-reviewActionCode
Description: "The code describing the result of the review."
* value[x] only CodeableConcept
* valueCodeableConcept from https://valueset.x12.org/x217/005010/response/2000F/HCR/1/01/00/306 (required)
* valueCodeableConcept ^binding.description = "Codes indicating type of action. These codes are listed within an X12 implementation guide (TR3) and maintained by X12. All X12 work products are copyrighted. See their website for licensing terms and conditions."
* ^context[+].type = #element
* ^context[=].expression = "ExplanationOfBenefit"
* ^context[+].type = #element
* ^context[=].expression = "ClaimResponse.addItem.adjudication.extension"
* ^context[+].type = #element
* ^context[=].expression = "ClaimResponse.item.adjudication.extension"
* ^context[+].type = #element
* ^context[=].expression = "Claim.item"

Extension: ItemPreAuthIssueDate
Id: extension-itemPreAuthIssueDate
Description: "The date when this item's preauthorization was issued."
* value[x] only date
* ^context[+].type = #element
* ^context[=].expression = "ClaimResponse.item"
* ^context[+].type = #element
* ^context[=].expression = "ClaimResponse.addItem"
* ^context[+].type = #element
* ^context[=].expression = "ExplanationOfBenefit"

Extension: ItemRequestedServiceDate
Id: extension-itemRequestedServiceDate
Description: "The original date/period that was requested by the submitter for this item."
* value[x] only dateTime or Period
* ^context[+].type = #element
* ^context[=].expression = "ClaimResponse.item"
* ^context[+].type = #element
* ^context[=].expression = "ClaimResponse.addItem"

Extension: ItemPreAuthPeriod
Id: extension-itemPreAuthPeriod
Description: "The date/period when this item's preauthorization is valid."
* value[x] only Period
* ^context[+].type = #element
* ^context[=].expression = "ClaimResponse.item"
* ^context[+].type = #element
* ^context[=].expression = "ClaimResponse.addItem"
* ^context[+].type = #element
* ^context[=].expression = "ExplanationOfBenefit"

Extension: ErrorElement
Id: extension-errorElement
Description: "The specific loop, segment, or element that this error information is about."
* value[x] only string
* ^context[+].type = #element
* ^context[=].expression = "ExplanationOfBenefit.error"
* ^context[+].type = #element
* ^context[=].expression = "ClaimResponse.error"

Extension: ErrorPath
Id: extension-errorPath
Description: "The FHIRPath expression that indicates which FHIR element that this error information is about."
* value[x] only string
* ^context[+].type = #element
* ^context[=].expression = "ExplanationOfBenefit.error"
* ^context[+].type = #element
* ^context[=].expression = "ClaimResponse.error"

Extension: ErrorFollowupAction
Id: extension-errorFollowupAction
Description: "A code representing what action must occur to resolve this error."
* value[x] only CodeableConcept
* valueCodeableConcept from X12278FollowUpActionCodes (required)
* ^context[+].type = #element
* ^context[=].expression = "ClaimResponse.error"

Extension: ItemAuthorizedDetail
Id: extension-itemAuthorizedDetail
Description: "The details of what has been authorized for this item if different from what was requested."
* extension contains productOrServiceCode 0..1 and ProductOrServiceCodeEnd named productOrServiceCodeEnd 0..1 and modifier 0..* and unitPrice 0..1 and quantity 0..1 and EPSDTIndicator named epsdtIndicator 0..1 and NursingHomeLevelOfCare named nursingHomeLevelOfCare 0..1 and revenue 0..1 and RevenueUnitRateLimit named revenueUnitRateLimit 0..1 and RequestedService named authorizedService 0..1
* extension[productOrServiceCode].value[x] only CodeableConcept
* extension[productOrServiceCode].valueCodeableConcept from X12278RequestedServiceType (required)
* extension[modifier].value[x] only CodeableConcept
* extension[modifier].valueCodeableConcept from X12278RequestedServiceModifierType (required)
* extension[unitPrice].value[x] only Money
* extension[quantity].value[x] only SimpleQuantity
* extension[revenue].value[x] only CodeableConcept
* extension[revenue].valueCodeableConcept from AHANUBCRevenueCodes (required)
* ^context[+].type = #element
* ^context[=].expression = "ExplanationOfBenefit"
* ^context[+].type = #element
* ^context[=].expression = "ClaimResponse.item"

Extension: ItemAuthorizedProvider
Id: extension-itemAuthorizedProvider
Description: "The specific provider who has been authorized to provide this item."
* extension contains provider 0..1 and providerType 0..1
* extension[provider].value[x] only Reference(PASPractitioner or PASOrganization)
* extension[providerType].value[x] only CodeableConcept
* extension[providerType].valueCodeableConcept from https://valueset.x12.org/x217/005010/response/2010EA/NM1/1/01/00/98 (required)
* extension[providerType].valueCodeableConcept ^binding.description = "Code identifying an organization entity, a physical location, property or an individual. These codes are listed within an X12 implementation guide (TR3) and maintained by X12. All X12 work products are copyrighted. See their website for licensing terms and conditions."
* ^context[+].type = #element
* ^context[=].expression = "ExplanationOfBenefit"
* ^context[+].type = #element
* ^context[=].expression = "ClaimResponse.item"

Profile: PASClaimInquiryResponse
Parent: PASClaimResponseBase
Id: profile-claiminquiryresponse
Title: "PAS Claim Inquiry Response"
Description: "PAS constraints on Claim resource mandating support for elements relevant to the response of an inquiry for details of previous authorizations."
* . ^short = "Response to a preauthorization query"
* item.extension contains CommunicatedDiagnosis named communicatedDiagnosis 0..1 MS
* item.extension[communicatedDiagnosis] ^short = "A code representing the diagnosis that is relevant to the preauthorization."
