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
* input contains PayerURL 1..1 MS and AttachmentsNeeded 0..* MS and QuestionnairesNeeded 0..* MS
* input[PayerURL].type = PASTempCodes#payer-url
* input[PayerURL].value[x] only url
* input[AttachmentsNeeded].type MS
* input[AttachmentsNeeded].type = PASTempCodes#attachments-needed
* input[AttachmentsNeeded].value[x] MS
* input[AttachmentsNeeded].value[x] only CodeableConcept
* input[AttachmentsNeeded].valueCodeableConcept from http://hl7.org/fhir/us/davinci-cdex/ValueSet/cdex-loinc-attachment-codes
* input[AttachmentsNeeded].valueCodeableConcept ^binding.extension.url = "http://hl7.org/fhir/tools/StructureDefinition/additional-binding"
* input[AttachmentsNeeded].valueCodeableConcept ^binding.extension.extension[+].url = "purpose"
* input[AttachmentsNeeded].valueCodeableConcept ^binding.extension.extension[=].valueCode = #extensible
* input[AttachmentsNeeded].valueCodeableConcept ^binding.extension.extension[+].url = "valueSet"
* input[AttachmentsNeeded].valueCodeableConcept ^binding.extension.extension[=].valueCanonical = "http://hl7.org/fhir/us/davinci-cdex/ValueSet/cdex-pwk01-attachment-report-type-code"
* input[AttachmentsNeeded].valueCodeableConcept ^binding.extension.extension[+].url = "documentation"
* input[AttachmentsNeeded].valueCodeableConcept ^binding.extension.extension[=].valueMarkdown = "X12 codes that can be used to request additional information to support a prior authorization request."


* input[AttachmentsNeeded].extension contains PALineNumber named paLineNumber 1..1 MS
* input[QuestionnairesNeeded].type MS
* input[QuestionnairesNeeded].type = PASTempCodes#questionnaires-needed
* input[QuestionnairesNeeded].value[x] MS
* input[QuestionnairesNeeded].value[x] only PASIdentifier
* input[QuestionnairesNeeded].extension contains PALineNumber named paLineNumber 1..1 MS
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
