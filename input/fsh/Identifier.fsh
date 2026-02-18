Profile: PASIdentifier
Parent: Identifier
Id: profile-identifier
Title: "PAS Identifier"
Description: "Constraints and extensions on Identifier allowing for a common datatype across all resource profiles."
* extension contains IdentifierSubDepartment named subDepartment 0..1 MS and IdentifierJurisdiction named jurisdiction 0..1 MS
* system 1..1 MS
* value 1..1 MS

Extension: IdentifierSubDepartment
Id: extension-identifierSubDepartment
Title: "Identifier Sub-Department"
Description: "An additional element that provides a further subdivision within the organization granting the identifier."
* value[x] only string
* ^context[+].type = #element
* ^context[=].expression = "Identifier"

Extension: IdentifierJurisdiction
Id: extension-identifierJurisdiction
Title: "Identifier Jurisdiction"
Description: "An additional element that provides the assigning jurisdiction of the identifier (i.e. provider state license number or state driver's license) so that it does not need to be mapped from the identifier system."
* value[x] only CodeableConcept
* valueCodeableConcept from http://hl7.org/fhir/us/core/ValueSet/us-core-usps-state|7.0.0 (required)
* ^context[+].type = #element
* ^context[=].expression = "Identifier"