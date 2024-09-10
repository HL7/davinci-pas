Profile: PASPractitioner
Parent: $USCorePractitioner|6.1.0
Id: profile-practitioner
Title: "PAS Practitioner"
Description: "PAS constraints on Practitioner resource mandating support for elements relevant to the care team involved in a prior authorization request"
* ^extension[$compliesWithProfile][+].valueCanonical = "http://hl7.org/fhir/us/core/StructureDefinition/us-core-practitioner|3.1.1"
* ^extension[$compliesWithProfile][+].valueCanonical = "http://hl7.org/fhir/us/core/StructureDefinition/us-core-practitioner|7.0.0"
* identifier MS
* identifier only PASIdentifier
* telecom MS
* address MS

Profile: PASPractitionerRole
Parent: PractitionerRole
Id: profile-practitionerrole
Title: "PAS PractitionerRole"
Description: "PAS constraints on PractitionerRole resource mandating support for elements relevant to the care team involved in a prior authorization request"
* practitioner 1..1 MS
* practitioner only Reference(PASPractitioner)
* organization MS
* organization only Reference(PASOrganization)
