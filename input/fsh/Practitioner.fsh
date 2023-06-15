Profile: PASPractitioner
Parent: $USCorePractitioner
Id: profile-practitioner
Title: "PAS Practitioner"
Description: "PAS constraints on Practitioner resource mandating support for elements relevant to the care team involved in a prior authorization request"
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
