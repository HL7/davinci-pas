Profile: PASClaimResponse
Parent: ClaimResponse
Id: profile-claimresponse
Title: "PAS Claim Response"
Description: "PAS constraints on Claim resource mandating support for elements relevant to the response of a prior authorization request"
* identifier MS
* status MS
* status = #active (exactly)
* type MS
* use = #preauthorization (exactly)
* patient MS
* patient only Reference(PASBeneficiary)
* created MS
* insurer MS
* insurer only Reference(PASInsurer)
* requestor MS
* requestor only Reference(PASRequestor)
* request MS
* request only Reference(PASClaim)
* outcome MS
* preAuthPeriod MS
* item MS
* item.extension contains ReviewAction named reviewAction 0..1
* item.extension contains PreAuthIssueDate named preAuthIssueDate 0..1
* item.extension contains PreAuthPeriod named preAuthPeriod 0..1
* item.extension contains AuthorizationNumber named previousAuthorizationNumber 0..1
* item.extension contains AdministrationReferenceNumber named administrationReferenceNumber 0..1
* item.extension contains AuthorizedDate named authorizedDate 0..1
* item.extension contains AuthorizedItemDetail named authorizedItemDetail 0..1
* item.extension contains AuthorizedProvider named authorizedProvider 0..1
* item.noteNumber MS
* communicationRequest MS
* communicationRequest only Reference(PASCommunicationRequest)
* error MS
* error.extension contains FollowupAction named followupAction 0..1
* error.code MS

Extension: ReviewAction
Id: extension-reviewAction
Description: "The details of the review action that is necessary for the authorization."
* extension contains ReviewActionCode named code 0..1 and number 0..1 and reasonCode 0..1 and secondSurgicalOpinionFlag 0..1
* extension[number].value[x] only integer
* extension[reasonCode].value[x] only CodeableConcept
* extension[secondSurgicalOpinionFlag].value[x] only boolean

Extension: ReviewActionCode
Id: extension-reviewActionCode
Description: "The code describing the result of the review."
* value[x] only CodeableConcept

Extension: PreAuthIssueDate
Id: extension-itemPreAuthIssueDate
Description: "The date when this item's preauthorization was issued."
* value[x] only date

Extension: AuthorizedDate
Id: extension-itemAuthorizedDate
Description: "The date/period when the item that is pre-authorizated must be completed."
* value[x] only dateTime or Period

Extension: PreAuthPeriod
Id: extension-itemPreAuthPeriod
Description: "The date/period when this item's preauthorization is valid."
* value[x] only Period

Extension: FollowupAction
Id: extension-errorFollowupAction
Description: "A code representing what action must occur to resolve this error."
* value[x] only CodeableConcept

Extension: AuthorizedItemDetail
Id: extension-itemAuthorizedDetail
Description: "The details for this item of what has been authorized if different from what was requested."
* extension contains productOrServiceCode 0..1 and ProductOrServiceCodeEnd named productOrServiceCodeEnd 0..1 and modifier 0..1 and unitPrice 0..1 and quantity 0..1 and EPSDTIndicator named epsdtIndicator 0..1 and NursingHomeLevelOfCare named nursingHomeLevelOfCare 0..1 and revenue 0..1 and RevenueUnitRateLimit named revenueUnitRateLimit 0..1 and RequestedService named authorizedService 0..1
* extension[productOrServiceCode].value[x] only CodeableConcept
* extension[modifier].value[x] only CodeableConcept
* extension[unitPrice].value[x] only Money
* extension[quantity].value[x] only SimpleQuantity
* extension[revenue].value[x] only CodeableConcept

Extension: AuthorizedProvider
Id: extension-itemAuthorizedProvider
Description: "The specific provider who has been authorized to provide this item."
* value[x] only Reference(PASPractitioner or $USCoreOrganization)

Profile: PASClaimInquiryResponse
Parent: ClaimResponse
Id: profile-claiminquiryresponse
Title: "PAS Claim Inquiry Response"
Description: "PAS constraints on Claim resource mandating support for elements relevant to the response of an inquiry for details of previous authorizations."
* identifier MS
* status MS
* status = #active (exactly)
* type MS
* use = #preauthorization (exactly)
* patient MS
* patient only Reference(PASBeneficiary)
* created MS
* insurer MS
* insurer only Reference(PASInsurer)
* requestor MS
* requestor only Reference(PASRequestor)
* request MS
* request only Reference(PASClaim)
* outcome MS
* preAuthPeriod MS
* item MS
* item.extension contains ReviewAction named reviewAction 0..1
* item.extension contains PreAuthIssueDate named preAuthIssueDate 0..1
* item.extension contains PreAuthPeriod named preAuthPeriod 0..1
* item.extension contains AuthorizationNumber named previousAuthorizationNumber 0..1
* item.extension contains AdministrationReferenceNumber named administrationReferenceNumber 0..1
* item.extension contains AuthorizedDate named authorizedDate 0..1
* item.extension contains AuthorizedItemDetail named authorizedItemDetail 0..1
* item.extension contains AuthorizedProvider named authorizedProvider 0..1
* error MS
* error.extension contains FollowupAction named followupAction 0..1
* error.code MS
