Profile: PASInsurer
Parent: PASOrganization
Id: profile-insurer
Title: "PAS Insurer Organization"
Description: "An organization who provides insurance and is the receiver of a prior authorization request."
* type MS
* type from https://valueset.x12.org/x217/005010/request/2010A/NM1/1/01/00/98 (required)
* type ^binding.description = "Codes identifying an organizational entity, a physical location, property or an individual. These codes are listed within an X12 implementation guide (TR3) and maintained by X12. All X12 work products are copyrighted. See their website for licensing terms and conditions."

Profile: PASRequestor
Parent: PASOrganization
Id: profile-requestor
Title: "PAS Requestor Organization"
Description: "The organization who is making a prior authorization request."
* type MS
* type from https://valueset.x12.org/x217/005010/response/2010B/NM1/1/01/00/98 (required)
* type ^binding.description = "Codes identifying an organizational entity, a physical location, property or an individual. These codes are listed within an X12 implementation guide (TR3) and maintained by X12. All X12 work products are copyrighted. See their website for licensing terms and conditions."
* address MS
* contact MS
* contact.name MS
* contact.telecom MS

Profile: PASOrganization
Parent: $USCoreOrganization
Id: profile-organization
Title: "PAS Organization Base Profile"
Description: "A base profile for organizations in PAS"
* ^abstract = true
* identifier only PASIdentifier
