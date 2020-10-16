/*
IG-specific terminology
*/
CodeSystem: PASInformationChangeMode
Title: "PASInformationChangeMode"
Description: "The mode by which a piece of information has changed."
* #changed "Changed" "Previously sent information has been changed."
* #added "Added" "New information that was not sent previously."

CodeSystem: PASSupportingInfoType
Title: "PASSupportingInfoType"
Description: "Types of supporting information for a Prior Authorization Claim."
* #patientEvent "Patient Event" "Information about the dates of the event that are being requested."
* #admissionReview "Admission Review" "Information about dates of a hospital admission being requested."
* #additionalInformation "Additional Information" "Send additional paperwork or supporting information for the request."
* #freeFormMessage "Free Form Message" "Send text messages to the UMO."
* #institutionalEncounter "Institutional Encounter" "Information about a hospital claim being requested."

ValueSet: PASInformationChangeMode
Title: "PASInformationChangeMode"
Description: "The mode by which a piece of information has changed."
* codes from system PASInformationChangeMode

ValueSet: PASSupportingInfoType
Title: "PASSupportingInfoType"
Description: "Types of supporting information for a Prior Authorization Claim."
* codes from system PASSupportingInfoType


/*
X12 Codesystems and ValueSets
*/
CodeSystem: AHANUBCRevenueCodes
Title: "AHA NUBC Revenue Codes"
Description: "These codes are used to convey specific accomodation, ancillary service or unique billing calculations or arrangements. They are listed within the UB-04 Data Specifications Manual and maintained by the National Uniform Billing Committee (NUBC)."
* ^publisher = "American Hospital Association, National Uniform Billing Committee"
* ^url = "https://www.nubc.org/revenue-code"
* ^copyright = "The Official UB-04 Data Specifications Manual, copyrighted by the American Hospital Association, is the only official source of UB-04 billing information adopted by the National Uniform Billing Committee. No other publication—governmental or private/commercial—can be considered authoritative.  See their website for licensing terms and conditions."
* ^content = #not-present

ValueSet: AHANUBCRevenueCodes
Title: "AHA NUBC Revenue Codes"
* codes from system https://www.nubc.org/revenue-code

Alias: $X12EntityIdentifierCode = https://valueset.x12.org/x217/005010/request/2010A/NM1/1/01/00/98
Alias: $X12EmploymentStatusCode = https://valueset.x12.org/x217/005010/request/2010C/INS/1/08/00/584
