/*
IG-specific terminology
*/
CodeSystem: PASInformationChangeMode
Title: "PASInformationChangeMode"
Description: "The mode by which a piece of information has changed."
* #changed "Changed"
* #added "Added"

CodeSystem: PASSupportingInfoType
Title: "PASSupportingInfoType"
Description: "Types of supporting information for a Prior Authorization Claim."
* #patientEvent "Patient Event"
* #admissionReview "Admission Review"
* #additionalInformation "Additional Information"
* #freeFormMessage "Free Form Message"
* #institutionalEncounter "Institutional Encounter"

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
