Profile: PASTask
Parent: Task
Id: profile-task
Title: "PAS Task"
Description: "PAS constraints on Task resource that is used to request additional documentation for prior authorizations."

* obeys AttachmentNeeded
* obeys QuestionnaireNeeded
* identifier 1..* MS
  * ^short = "Payers tracking identifier"
* status 1..1 MS
* status from http://hl7.org/fhir/us/davinci-hrex/ValueSet/hrex-task-status (required)
* intent 1..1 MS
* intent = #order
* code 1..1 MS
* code from PASTaskCodes (required)
* requester ..1 MS
  * ^short = "Provider ID - only send the identifier"
  * identifier 1..1 MS
* owner 0..1 MS
  * ^short = "Provider ID - only send the identifier"
  * identifier 1..1 MS
* for 1..1 MS
* for only Reference(PASBeneficiary)
* reasonCode 1..1 MS
* reasonCode = PASTempCodes#priorAuthorization
* reasonReference 1..1 MS
* reasonReference only Reference(PASClaim)
* input 2..* MS
* input ^slicing.discriminator.type = #value
* input ^slicing.discriminator.path = "type"
* input ^slicing.rules = #open
* input ^slicing.description = "Different slices for identifying different types of information for the Task."
* input contains PayerURL 1..1 and AttachmentsNeeded 0..* and QuestionnairesNeeded 0..*
* input[PayerURL].type = PASTempCodes#payer-url
* input[PayerURL].value[x] only url
* input[AttachmentsNeeded].type = PASTempCodes#attachments-needed
* input[AttachmentsNeeded].value[x] only CodeableConcept
* input[AttachmentsNeeded].valueCodeableConcept from AttachmentRequestCodes
* input[AttachmentsNeeded].extension contains PALineNumber named paLineNumber 1..1
* input[QuestionnairesNeeded].type = PASTempCodes#questionnaires-needed
* input[QuestionnairesNeeded].value[x] only PASIdentifier
* input[QuestionnairesNeeded].extension contains PALineNumber named paLineNumber 1..1
* restriction.period MS
* statusReason MS

Extension: PALineNumber
Id: extension-paLineNumber
Description: "A specific line number associated with the attachment request code or TRN."
* ^context.type = #element
* ^context.expression = "Task.input"
* value[x] only integer

Invariant: AttachmentNeeded
Description: "If task.code is attachment-request-code, then attachments needed slice is required."
Expression: "$this.code.coding.where(code='attachment-request-code').count() > 0 implies $this.input.type.coding.where(code='attachments-needed').count() > 0"
Severity: #error

Invariant: QuestionnaireNeeded
Description: "If task.code is attachment-request-questionnaire, then questionnaire needed slice is required."
Expression: "$this.code.coding.where(code='attachment-request-questionnaire').count() > 0 implies $this.input.type.coding.where(code='questionnaires-needed').count() > 0"
Severity: #error
