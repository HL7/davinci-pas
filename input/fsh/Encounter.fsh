Profile: PASEncounter
Parent: $USCoreEncounter
Id: profile-encounter
Title: "PAS Encounter"
Description: "PAS constraints on the Encounter resource mandating support for elements relevant to details of a requested institutional stay on the prior authorization request"
* extension contains PatientStatus named patientStatus 0..1 MS and
	NursingHomeResidentialStatus named nursingHomeResidentialStatus 0..1 MS
* extension[nursingHomeResidentialStatus].valueCodeableConcept from https://valueset.x12.org/x217/005010/request/2000E/CL1/1/04/00/1345 (required)
* extension[nursingHomeResidentialStatus].valueCodeableConcept  ^binding.description = "Codes specifying the status of a nursing home resident at the time of service. These codes are listed within an X12 implementation guide (TR3) and maintained by X12. All X12 work products are copyrighted. See their website for licensing terms and conditions."

* status = #planned (exactly)
* type from https://valueset.x12.org/x217/005010/request/2000E/CL1/1/01/00/1315 (required)
* type ^binding.description = "Codes indicating the priority of this admission. These codes are listed within an X12 implementation guide (TR3) and maintained by X12. All X12 work products are copyrighted. See their website for licensing terms and conditions."
* subject only Reference(PASBeneficiary)
* hospitalization.admitSource MS
* hospitalization.admitSource from https://valueset.x12.org/x217/005010/request/2000E/CL1/1/02/00/1314 (required)
* hospitalization.admitSource ^binding.description = "Codes indicating the source of this admission. These codes are listed within an X12 implementation guide (TR3) and maintained by X12. All X12 work products are copyrighted. See their website for licensing terms and conditions."
* location.location only Reference($USCoreLocation)

Extension: PatientStatus
Id: extension-patientStatus
Description: "A code representing the status of the patient when being admitted"
* value[x] only CodeableConcept
* valueCodeableConcept from https://valueset.x12.org/x217/005010/request/2000E/CL1/1/03/00/1352 (required)
* valueCodeableConcept ^binding.description = "Codes indicating patient status as of the 'statement covers through date'.  These codes are listed within an X12 implementation guide (TR3) and maintained by X12. All X12 work products are copyrighted. See their website for licensing terms and conditions."
* ^context[+].type = #element
* ^context[=].expression = "Examples"
* ^context[+].type = #element
* ^context[=].expression = "Encounter"
