CodeSystem: PASInformationChangeMode
Title: "PASInformationChangeMode"
Description: "The mode by which a piece of information has changed."
* ^jurisdiction = urn:iso:std:iso:3166#US
* #changed "Changed"
* #added "Added"

CodeSystem: PASSupportingInfoType
Title: "PASSupportingInfoType"
Description: "Types of supporting information for a Prior Authorization Claim."
* ^jurisdiction = urn:iso:std:iso:3166#US
* #patientEvent "Patient Event"
* #admissionReview "Admission Review"
* #additionalInformation "Additional Information"
* #freeFormMessage "Free Form Message"
* #institutionalEncounter "Institutional Encounter"

ValueSet: PASInformationChangeMode
Title: "PASInformationChangeMode"
Description: "The mode by which a piece of information has changed."
* ^jurisdiction = urn:iso:std:iso:3166#US
* codes from system PASInformationChangeMode

ValueSet: PASSupportingInfoType
Title: "PASSupportingInfoType"
Description: "Types of supporting information for a Prior Authorization Claim."
* ^jurisdiction = urn:iso:std:iso:3166#US
* codes from system PASSupportingInfoType