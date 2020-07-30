Profile: PASCommunicationRequest
Parent: CommunicationRequest
Id: profile-communicationrequest
Title: "PAS CommunicationRequest"
Description: "PAS constraints on CommunicationRequest resource mandating support for elements relevant to the prior authorization response"
* extension contains CommunicatedDiagnosis named communicatedDiagnosis 0..1
* extension contains ContentModifier named contentModifier 0..1
* identifier MS
* status = #active (exactly)
* category MS
* medium MS
* payload MS
* payload.content[x] MS
* payload.content[x] only string
* requester MS
* requester only Reference(PASInsurer)
* recipient MS
* recipient only Reference(PASPractitioner or $USCoreOrganization)
* sender MS
* sender only Reference(PASRequestor)

Extension: CommunicatedDiagnosis
Id: extension-communicatedDiagnosis
Description: "A code representing the diagnosis that is the subject of the communication"
* value[x] only CodeableConcept

Extension: ContentModifier
Id: extension-contentModifier
Description: "A code representing a modifier of the content being requested"
* value[x] only CodeableConcept

