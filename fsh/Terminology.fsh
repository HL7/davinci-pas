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
