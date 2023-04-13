/*
IG-specific terminology
*/
CodeSystem: PASInformationChangeMode
Title: "PAS Information Change Mode Code System"
Description: "The mode by which a piece of information has changed."
* ^caseSensitive = true
* ^experimental = false
* #changed "Changed" "Previously sent information has been changed."
* #added "Added" "New information that was not sent previously."

CodeSystem: PASSupportingInfoType
Title: "PAS Supporting Info Type Code System"
Description: "Types of supporting information for a Prior Authorization Claim."
* ^caseSensitive = true
* ^experimental = false
* #patientEvent "Patient Event" "Information about the dates of the event that are being requested."
* #admissionDates "Admission Dates" "Information about the admission dates of a hospital admission being requested."
* #dischargeDates "Discharge Dates" "Information about discharge dates of a hospital admission being requested."
* #additionalInformation "Additional Information" "Send additional paperwork or supporting information for the request."
* #freeFormMessage "Free Form Message" "Send text messages to the UMO."
* #institutionalEncounter "Institutional Encounter" "Information about a hospital claim being requested."

ValueSet: PASInformationChangeMode
Title: "PAS Information Change Mode Value Set"
Description: "The mode by which a piece of information has changed."
* ^experimental = false
* codes from system PASInformationChangeMode

ValueSet: PASSupportingInfoType
Title: "PAS Supporting Info Type Value Set"
Description: "Types of supporting information for a Prior Authorization Claim."
* ^experimental = false
* codes from system PASSupportingInfoType

CodeSystem: PASCommunicationRequestMedium
Title: "PAS Communication Medium Code System"
Description: "Extra types of channels that a communication request can be made"
* ^experimental = false
* ^caseSensitive = true
* #CDEX "CDex Submit-Attachment" "Via a CDex Submitt-Attachment operation"

ValueSet: PASCommunicationRequestMedium
Title: "PAS Communication Medium Value Set"
Description: "Types of channels that a communication request can be made"
* ^experimental = false
* ^copyright = "These codes are listed within an X12 implementation guide (TR3) and maintained by X12. All X12 work products are copyrighted. See their website for licensing terms and conditions."
* codes from system https://codesystem.x12.org/005010/756
* codes from system PASCommunicationRequestMedium


/*
X12 ValueSets
*/
ValueSet: AHANUBCRevenueCodes
Title: "AHA NUBC Revenue Value Set"
Description: "These codes are used to convey specific accomodation, ancillary service or unique billing calculations or arrangements. They are listed within the UB-04 Data Specifications Manual and maintained by the National Uniform Billing Committee (NUBC)."
* ^experimental = false
* ^copyright = "The Official UB-04 Data Specifications Manual, copyrighted by the American Hospital Association, is the only official source of UB-04 billing information adopted by the National Uniform Billing Committee. No other publication—governmental or private/commercial—can be considered authoritative.  See their website for licensing terms and conditions."
* codes from system https://www.nubc.org/revenue-code

ValueSet: X12278RejectReasonCodes
Title: "X12 278 Reject Reason Value Set"
Description: "The complete set of codes that are used to indicate the reason why something was rejected."
* ^experimental = false
* ^copyright = "These codes are listed within an X12 implementation guide (TR3) and maintained by X12. All X12 work products are copyrighted. See their website for licensing terms and conditions."
* codes from system https://codesystem.x12.org/005010/901

ValueSet: X12278FollowUpActionCodes
Title: "X12 278 Follow Up Action Value Set"
Description: "The complete set of codes that are used to indicate any follow-up actions that are allowed for a reject reason."
* ^experimental = false
* ^copyright = "These codes are listed within an X12 implementation guide (TR3) and maintained by X12. All X12 work products are copyrighted. See their website for licensing terms and conditions."
* codes from system https://codesystem.x12.org/005010/889

ValueSet: X12278DiagnosisCodes
Title: "X12 278 Diagnosis Code Value Set"
Description: "The complete set of codes that can be used to convey a patient diagnosis.  This includes codes from ICD-10-CM, ICD-9-CM and Diagnosis Related Group codes."
* ^experimental = false
* codes from system http://terminology.hl7.org/CodeSystem/icd9cm
* codes from system http://hl7.org/fhir/sid/icd-10-cm
* codes from system https://www.cms.gov/Medicare/Medicare-Fee-for-Service-Payment/AcuteInpatientPPS/MS-DRG-Classifications-and-Software
* codes from system http://uri.hddaccess.com/cs/apdrg
* codes from system http://uri.hddaccess.com/cs/aprdrg

CodeSystem: PASDiagnosisType
Title: "PAS Diagnosis Type"
Description: "The type of diagnosis being conveyed in a prior authorization.  This code is combined with the Diagnosis Code to produce the proper X12 code."
* ^caseSensitive = true
* ^experimental = false
* #admitting "Admitting" "The diagnosis given as the reason why the patient was admitted to the hospital."
* #principal "Principal" "The single medical diagnosis that is most relevant to the patient's chief complaint or need for treatment."
* #patientreasonforvisit "Patient Reason For Visit" "The diagnosis given as why the patient came to the hospital."

ValueSet: X12278DiagnosisType
Title: "X12 278 Diagnosis Type Value Set"
Description: "This set of codes is used to identify the type of diagnosis that is being conveyed in the prior authorization."
* ^experimental = false
* codes from system PASDiagnosisType

ValueSet: X12278LocationType
Title: "X12 278 Health Care Service Location Type Value Set"
Description: "This set of codes identifies where services were, or may be, performed.  The codes are taken from NUBC Bill Type and from CMS Place of Service codes."
* ^experimental = false
* codes from system https://www.nubc.org/CodeSystem/TypeOfBill
* codes from system https://www.cms.gov/Medicare/Coding/place-of-service-codes/Place_of_Service_Code_Set

ValueSet: X12278RequestedServiceType
Title: "X12 278 Requested Service Type"
Description: "This set of codes identifies what service is being requested.  It is a combination of X12 Service Type codes, CPT (HCPCS I) and HCPCS II procedure code modifiers, ICD-9 Procedure codes, ICD-10 Procedure codes, and NDC Drug codes.  NOTE: HCPCS Level 1 Codes are the CPT codes so either code system could be used to send the codes.  When receiving the codes from an X12 system, the system returned will be HCPCS even if it was initially sent as a CPT code."
* ^copyright = "Current Procedural Terminology (CPT) is copyright 2020 American Medical Association. All rights reserved.
X12 codes are listed within an X12 implementation guide (TR3) and maintained by X12. All X12 work products are copyrighted. See their website for licensing terms and conditions."
* ^experimental = false
* http://terminology.hl7.org/CodeSystem/data-absent-reason#not-applicable
* codes from system https://codesystem.x12.org/005010/1365
* codes from system http://www.ama-assn.org/go/cpt
* codes from system http://www.cms.gov/Medicare/Coding/HCPCSReleaseCodeSets
* codes from system http://terminology.hl7.org/CodeSystem/icd9cm
* codes from system http://www.cms.gov/Medicare/Coding/ICD10
* codes from system http://hl7.org/fhir/sid/ndc

ValueSet: X12278RequestedServiceModifierType
Title: "X12 278 Requested Service Modifier Type"
Description: "This set of codes identifies modifiers to the type of service being requested.  It is a combination of CPT (HCPCS I) and HCPCS II procedure code modifiers.  NOTE: HCPCS Level 1 Codes are the CPT codes so either code system could be used to send the codes.  When receiving the codes from an X12 system, the system returned will be HCPCS even if it was initially sent as a CPT code."
* ^copyright = "Current Procedural Terminology (CPT) is copyright 2020 American Medical Association. All rights reserved."
* ^experimental = false
* codes from system http://www.ama-assn.org/go/cpt
* codes from system http://www.cms.gov/Medicare/Coding/HCPCSReleaseCodeSets

ValueSet: X12278DiagnosisInformationType
Title: "X12 278 Diagnosis Information Type"
Description: "LOINC codes that convey the type of information that is being requested about the diagnosis."
* ^copyright = "This material contains content from LOINC (http://loinc.org). LOINC is copyright © 1995-2020, Regenstrief Institute, Inc. and the Logical Observation Identifiers Names and Codes (LOINC) Committee and is available at no cost under the license at http://loinc.org/license. LOINC® is a registered United States trademark of Regenstrief Institute, Inc"
* ^experimental = false
* codes from system http://loinc.org where concept descendent-of #29488-4

ValueSet: X12278ReviewDecisionReasonCode
Title: "X12 278 Review Decision Reason Codes"
Description: "Codes used to identify the reason for the health care service review outcome."
* ^copyright = "This value set contains codes maintained by X12. All X12 work products are copyrighted. See their website for licensing terms and conditions."
* ^experimental = false
* codes from system https://codesystem.x12.org/external/886
