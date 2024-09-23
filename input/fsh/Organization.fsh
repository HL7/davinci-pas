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

Instance: TINIdentifierPattern
InstanceOf: Identifier
Usage: #inline
* system = "http://terminology.hl7.org/NamingSystem/USEIN"

Instance: PIIdentifierPattern
InstanceOf: Identifier
Usage: #inline
* type = http://hl7.org/fhir/us/carin-bb/CodeSystem/C4BBIdentifierType#payerid

Profile: PASOrganization
Parent: $USCoreOrganization
Id: profile-organization
Title: "PAS Organization Base Profile"
Description: "A base profile for organizations in PAS"
* ^abstract = true
* ^extension[$compliesWithProfile][+].valueCanonical = "http://hl7.org/fhir/us/core/StructureDefinition/us-core-organization|3.1.1"
* ^extension[$compliesWithProfile][+].valueCanonical = "http://hl7.org/fhir/us/core/StructureDefinition/us-core-organization|6.1.0"
* identifier MS
* identifier only PASIdentifier
* identifier contains TIN 0..1 MS and PI 0..1 MS
* identifier[TIN] ^short = "The US Employer Identification Number (EIN) or Tax Identification Number (TIN)."
* identifier[TIN] = TINIdentifierPattern
* identifier[PI] ^short = "The Payer Identification Number (PI)"
* identifier[PI] = PIIdentifierPattern

Profile: PASLocation
Parent: $USCoreLocation
Id: profile-location
Title: "PAS Location Profile"
Description: "A profile on US-Core location to allow for specifying where a practitioner is working at."
* address 1..1 MS
