Profile: PASCommunicationRequest
Parent: CommunicationRequest
Id: profile-communicationrequest
Title: "PAS CommunicationRequest"
Description: "PAS constraints on CommunicationRequest resource mandating support for elements relevant to the prior authorization response"
* identifier MS
* identifier ^short = "Unique Identifier used in linking the Communication Request to the response (X12's Attachment Control Number)."
* status = #active (exactly)
* category MS
* category from https://valueset.x12.org/x217/005010/response/2000D/PWK/1/01/00/755 (required)
* category  ^binding.description = "Codes indicating the title or contents of a document, report or supporting item. These codes are listed within an X12 implementation guide (TR3) and maintained by X12. All X12 work products are copyrighted. See their website for licensing terms and conditions."
* medium MS
* medium from PASCommunicationRequestMedium (extensible)
* payload MS
* payload.extension contains ServiceLineNumber named serviceLineNumber 0..1 MS and CommunicatedDiagnosis named communicatedDiagnosis 0..* MS and ContentModifier named contentModifier 0..* MS
* payload.content[x] MS
* payload.content[x] only string
* requester MS
* requester only Reference(PASInsurer)
* recipient MS
* recipient only Reference(PASPractitioner or PASOrganization)
* sender MS
* sender only Reference(PASRequestor)

Extension: CommunicatedDiagnosis
Id: extension-communicatedDiagnosis
Description: "A code representing the diagnosis that is the subject of the communication"
* value[x] only CodeableConcept
* valueCodeableConcept from X12278DiagnosisCodes (required)

Extension: ContentModifier
Id: extension-contentModifier
Description: "A code representing a modifier of the content being requested"
* value[x] only CodeableConcept
* valueCodeableConcept from X12278DiagnosisInformationType (required)

Extension: ServiceLineNumber
Id: extension-serviceLineNumber
Description: "A number that links the content being requested with the claim item number."
* value[x] only positiveInt