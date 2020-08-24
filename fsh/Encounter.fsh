Profile: PASEncounter
Parent: $USCoreEncounter
Id: profile-encounter
Title: "PAS Encounter"
Description: "PAS constraints on Encounter resource mandating support for elements relevant to details of a requested instutitional stay on the prior authorization request"
* extension contains PatientStatus named patientStatus 0..1
* extension contains NursingHomeResidentialStatus named nursingHomeResidentialStatus 0..1
* status = #planned (exactly)
* subject only Reference(PASBeneficiary)
* hospitalization.admitSource MS

Extension: PatientStatus
Id: extension-patientStatus
Description: "A code representing the status of the patient when being admitted"
* value[x] only CodeableConcept
