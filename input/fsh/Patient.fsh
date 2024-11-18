Profile: PASBeneficiary
Parent: $USCorePatient
Id: profile-beneficiary
Title: "PAS Beneficiary Patient"
Description: "A patient who is the beneficiary of an insurance plan."
* identifier ^slicing.discriminator.type = #value
* identifier ^slicing.discriminator.path = "type"
* identifier ^slicing.rules = #open
* identifier ^slicing.description = "Slice that provides the member identifier."
* identifier contains memberIdentifier 0..1 MS
* identifier[memberIdentifier].type = http://terminology.hl7.org/CodeSystem/v2-0203#MB
* name.suffix MS
* name.prefix MS
* birthDate MS
* birthDate obeys FullDateRule
* address.district MS
* address.country MS
* multipleBirthInteger MS

Profile: PASSubscriber
Parent: $USCorePatient
Id: profile-subscriber
Title: "PAS Subscriber Patient"
Description: "A patient who is the subscriber of an insurance plan."
* extension contains MilitaryStatus named militaryStatus 0..1
* identifier ^slicing.discriminator.type = #value
* identifier ^slicing.discriminator.path = "type"
* identifier ^slicing.rules = #open
* identifier ^slicing.description = "Slice that provides the member identifier."
* identifier contains memberIdentifier 1..1 MS
* identifier[memberIdentifier].type = http://terminology.hl7.org/CodeSystem/v2-0203#MB
* name.suffix MS
* name.prefix MS
* birthDate MS
* birthDate obeys FullDateRule
* address.district MS
* address.country MS

Extension: MilitaryStatus
Id: extension-militaryStatus
Description: "A patient's military status."
* value[x] only CodeableConcept
* value[x] from https://valueset.x12.org/x217/005010/request/2010C/INS/1/08/00/584 (required)
* value[x] ^binding.description = "Codes showing the general employment status of an employee/claimant. These codes are listed within an X12 implementation guide (TR3) and maintained by X12. All X12 work products are copyrighted. See their website for licensing terms and conditions."
* ^context[+].type = #element
* ^context[=].expression = "Examples"
* ^context[+].type = #element
* ^context[=].expression = "Patient"

