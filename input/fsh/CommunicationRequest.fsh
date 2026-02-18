Profile: PASCommunicationRequest
Parent: CommunicationRequest
Id: profile-communicationrequest
Title: "PAS CommunicationRequest"
Description: """PAS constraints on CommunicationRequest resource mandating support for elements relevant to the prior authorization response.
For DTR submit-attachment use, the identifer will always be present since the medium will not be VOICE and thus the identifiers can be used as the tracking control number. """
* obeys IdentifierUnlessVO
* extension contains ServiceLineNumber named serviceLineNumber 0..1 MS
* identifier 0..1 MS
* identifier ^short = "Unique Identifier used in linking the Communication Request to the response (X12's Attachment Control Number)."
* status = #active (exactly)
* category 0..1 MS
* category from https://valueset.x12.org/x217/005010/response/2000D/PWK/1/01/00/755 (required)
* category  ^binding.description = "Codes indicating the title or contents of a document, report or supporting item. These codes are listed within an X12 implementation guide (TR3) and maintained by X12. All X12 work products are copyrighted. See their website for licensing terms and conditions."
* medium 0..1 MS
* medium from PASCommunicationRequestMedium (extensible)
* payload 0..1 MS
* payload.extension contains CommunicatedDiagnosis named communicatedDiagnosis 0..* MS and ContentModifier named contentModifier 0..* MS
* payload.content[x] MS
* payload.content[x] only string
* payload.contentString from http://loinc.org/vs/valid-hl7-attachment-requests (required)
* requester MS
* requester only Reference(PASInsurer)
* recipient MS
* recipient only Reference(PASPractitioner or PASOrganization)
* sender MS
* sender only Reference(PASRequestor)

Extension: CommunicatedDiagnosis
Id: extension-communicatedDiagnosis
Title: "Communicated Diagnosis"
Description: "A code representing the diagnosis that is the subject of the communication"
* value[x] only CodeableConcept
* valueCodeableConcept from X12278DiagnosisCodes (required)
* ^context[+].type = #element
* ^context[=].expression = "ExplanationOfBenefit.item"
* ^context[+].type = #element
* ^context[=].expression = "CommunicationRequest.payload"
* ^context[+].type = #element
* ^context[=].expression = "Claim.item"

Extension: ContentModifier
Id: extension-contentModifier
Title: "Content Modifier"
Description: "A code representing a modifier of the content being requested"
* value[x] only CodeableConcept
* valueCodeableConcept from X12278DiagnosisInformationType (required)
* ^context[+].type = #element
* ^context[=].expression = "CommunicationRequest.payload"
* ^context[+].type = #element
* ^context[=].expression = "Task.input"

Extension: ServiceLineNumber
Id: extension-serviceLineNumber
Title: "Service Line Number"
Description: "A number that links the content being requested with the claim item number."
* value[x] only positiveInt
* ^context[+].type = #element
* ^context[=].expression = "CommunicationRequest"
* ^context[+].type = #element
* ^context[=].expression = "Task.input"

Invariant: IdentifierUnlessVO
Description: "CommunicationRequest.identifier is required unless CommunicationRequest.medium is 'VO'."
Expression: "$this.medium.coding.where(code='VO').count() = 0 implies $this.identifier.count() > 0"
Severity: #error