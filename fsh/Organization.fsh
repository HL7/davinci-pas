Profile: PASInsurer
Parent: $USCoreOrganization
Id: profile-insurer
Title: "PAS Insurer Organization"
Description: "An organization who provides insurance and is the receiver of a prior authorization request."
* type MS
* type from X12EntityIdentifierCode (required)

Profile: PASRequestor
Parent: $USCoreOrganization
Id: profile-requestor
Title: "PAS Requestor Organization"
Description: "The organization who is making a prior authorization request."
* type MS
* type from X12EntityIdentifierCode (required)
* address 1..* MS
* contact MS
* contact.name MS
* contact.telecom MS
