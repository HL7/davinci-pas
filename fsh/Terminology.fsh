/*
IG-specific terminology
*/
CodeSystem: PASInformationChangeMode
Title: "PAS Information Change Mode Code System"
Description: "The mode by which a piece of information has changed."
* #changed "Changed" "Previously sent information has been changed."
* #added "Added" "New information that was not sent previously."

CodeSystem: PASSupportingInfoType
Title: "PAS Supporting Info Type Code System"
Description: "Types of supporting information for a Prior Authorization Claim."
* #patientEvent "Patient Event" "Information about the dates of the event that are being requested."
* #admissionReview "Admission Review" "Information about dates of a hospital admission being requested."
* #additionalInformation "Additional Information" "Send additional paperwork or supporting information for the request."
* #freeFormMessage "Free Form Message" "Send text messages to the UMO."
* #institutionalEncounter "Institutional Encounter" "Information about a hospital claim being requested."

ValueSet: PASInformationChangeMode
Title: "PAS Information Change Mode Value Set"
Description: "The mode by which a piece of information has changed."
* codes from system PASInformationChangeMode

ValueSet: PASSupportingInfoType
Title: "PAS Supporting Info Type Value Set"
Description: "Types of supporting information for a Prior Authorization Claim."
* codes from system PASSupportingInfoType


/*
X12 Codesystems and ValueSets
*/
CodeSystem: AHANUBCRevenueCodes
Title: "AHA NUBC Revenue Code System"
Description: "These codes are used to convey specific accomodation, ancillary service or unique billing calculations or arrangements. They are listed within the UB-04 Data Specifications Manual and maintained by the National Uniform Billing Committee (NUBC)."
* ^publisher = "American Hospital Association, National Uniform Billing Committee"
* ^url = "https://www.nubc.org/revenue-code"
* ^copyright = "The Official UB-04 Data Specifications Manual, copyrighted by the American Hospital Association, is the only official source of UB-04 billing information adopted by the National Uniform Billing Committee. No other publication—governmental or private/commercial—can be considered authoritative.  See their website for licensing terms and conditions."
* ^content = #not-present

ValueSet: AHANUBCRevenueCodes
Title: "AHA NUBC Revenue Value Set"
Description: "These codes are used to convey specific accomodation, ancillary service or unique billing calculations or arrangements. They are listed within the UB-04 Data Specifications Manual and maintained by the National Uniform Billing Committee (NUBC)."
* codes from system AHANUBCRevenueCodes

CodeSystem: X12278RejectReasonCodes
Title: "X12 278 Reject Reason Code System"
Description: "The complete set of codes that are used to indicate the reason why something was rejected."
* ^publisher = "X12 Inc."
* ^url = "https://codesystem.x12.org/005010/901"
* ^copyright = "These codes are listed within an X12 implementation guide (TR3) and maintained by X12. All X12 work products are copyrighted. See their website for licensing terms and conditions."
* ^content = #not-present

ValueSet: X12278RejectReasonCodes
Title: "X12 278 Reject Reason Value Set"
Description: "The complete set of codes that are used to indicate the reason why something was rejected."
* codes from system X12278RejectReasonCodes

CodeSystem: X12278FollowUpActionCodes
Title: "X12 278 Follow Up Action Code System"
Description: "The complete set of codes that are used to indicate any follow-up actions that are allowed for a reject reason."
* ^publisher = "X12 Inc."
* ^url = "https://codesystem.x12.org/005010/889"
* ^copyright = "These codes are listed within an X12 implementation guide (TR3) and maintained by X12. All X12 work products are copyrighted. See their website for licensing terms and conditions."
* ^content = #not-present

ValueSet: X12278FollowUpActionCodes
Title: "X12 278 Follow Up Action Value Set"
Description: "The complete set of codes that are used to indicate any follow-up actions that are allowed for a reject reason."
* codes from system X12278FollowUpActionCodes