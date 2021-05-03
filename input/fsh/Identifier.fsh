Profile: PASIdentifier
Parent: Identifier
Id: profile-identifier
Title: "PAS Identifier"
Description: "Constraints and extensions on Identifier allowing for a common datatype across all resource profiles."
* extension contains IdentifierSubDepartment named subDepartment 0..1 MS and IdentifierJurisdiction named jurisdiction 0..1 MS

Extension: IdentifierSubDepartment
Id: extension-identifierSubDepartment
Description: "An additional element that provides the subdepartment that created the authorization request."
* value[x] only string

Extension: IdentifierJurisdiction
Id: extension-identifierJurisdiction
Description: "An additional element that provides the jurisdiction of the identifier (i.e. state driver's license) so that it does not need to be mapped from the identifier system."
* value[x] only CodeableConcept
* valueCodeableConcept from http://hl7.org/fhir/us/core/ValueSet/us-core-usps-state (required)