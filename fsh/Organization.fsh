Profile: PASInsurer
Parent: $USCoreOrganization
Id: profile-insurer
Title: "PAS Insurer Organization"
Description: "An organization who provides insurance and is the receiver of a prior authorization request."
* type MS
* type from $X12EntityIdentifierCode (required)
* type ^binding.description = "Code identifying an organizational entity, a physical location, property or an individual. They are listed within an X12 implementation guide (TR3) and maintained by X12. All X12 work products are copyrighted. See their website for licensing terms and conditions."

Profile: PASRequestor
Parent: $USCoreOrganization
Id: profile-requestor
Title: "PAS Requestor Organization"
Description: "The organization who is making a prior authorization request."
* type MS
* type from $X12EntityIdentifierCode (required)
* type ^binding.description = "Code identifying an organizational entity, a physical location, property or an individual. They are listed within an X12 implementation guide (TR3) and maintained by X12. All X12 work products are copyrighted. See their website for licensing terms and conditions."
* address 1..* MS
* contact MS
* contact.name MS
* contact.telecom MS
