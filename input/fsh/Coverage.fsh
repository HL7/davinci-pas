Profile: PASCoverage
Parent: http://hl7.org/fhir/us/core/StructureDefinition/us-core-coverage|7.0.0
Id: profile-coverage
Title: "PAS Coverage"
Description: "PAS constraints on Coverage resource mandating support for insurance elements relevant to the prior authorization request"
* ^extension[$compliesWithProfile][+].valueCanonical = "http://hl7.org/fhir/us/core/StructureDefinition/us-core-coverage|6.1.0"
* obeys self-beneficiary
* identifier MS
* identifier[memberid] 1..1
* status MS
* status = #active
* subscriber MS
* subscriber only Reference(PASSubscriber)
* subscriberId MS
* beneficiary MS
* beneficiary only Reference(PASBeneficiary)
* relationship MS
* relationship.coding ^slicing.discriminator.type = #value
* relationship.coding ^slicing.discriminator.path = "$this"
* relationship.coding ^slicing.rules = #open
* relationship.coding ^slicing.description = "Send an X12 code along with the FHIR code."
* relationship.coding contains X12Code 0..1 MS
* relationship.coding[X12Code] from https://valueset.x12.org/x217/005010/request/2000D/INS/1/02/00/1069 (required)
* relationship.coding[X12Code]  ^binding.description = "Codes indicating the relationship between two individuals or entities. These codes are listed within an X12 implementation guide (TR3) and maintained by X12. All X12 work products are copyrighted. See their website for licensing terms and conditions."
* payor MS
* payor only Reference(PASInsurer)


Invariant: self-beneficiary
Description: "If relationship does not equal 'self', then subscriber SHALL be present."
Expression: "$this.relationship.coding.where(code='18').count() = 0 implies $this.subscriber.exists()"
Severity: #error
