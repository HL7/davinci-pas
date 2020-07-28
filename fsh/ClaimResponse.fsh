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
* item.extension contains AuthorizedDate named authorizedDate 0..1
* item.noteNumber MS
* communicationRequest MS
* communicationRequest only Reference(PASCommunicationRequest)
* error MS
* error.extension contains FollowupAction named followupAction 0..1
* error.code MS

Extension: ReviewAction
Id: extension-reviewAction
Description: "The details of the review action that is necessary for the authorization."
* extension contains code 0..1 and number 0..1 and reasonCode 0..1 and secondSurgicalOpinionFlag 0..1
* extension[code].value[x] only CodeableConcept
* extension[number].value[x] only integer
* extension[reasonCode].value[x] only CodeableConcept
* extension[secondSurgicalOpinionFlag].value[x] only boolean

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
