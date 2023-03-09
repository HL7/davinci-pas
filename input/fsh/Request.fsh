Profile: PASMedicationRequest
Parent: $USCoreMedicationRequest
Id: profile-medicationrequest
Title: "PAS Medication Request"
Description: "PAS constraints on MedicationRequest resource mandating support for elements relevant to the prescriptions being requested on a prior authorization request"
* intent = #order (exactly)
* subject only Reference(PASBeneficiary)
* dosageInstruction.timing MS
* dosageInstruction.timing only PASTiming
* dispenseRequest MS
* dispenseRequest.quantity MS

Profile: PASServiceRequest
Parent: ServiceRequest
Id: profile-servicerequest
Title: "PAS Service Request"
Description: "PAS constraints on ServiceRequest resource mandating support for elements relevant to the generic services being requested on a prior authorization request"
* extension contains ProductOrServiceCodeEnd named serviceCodeEnd 0..1 MS
* intent = #order (exactly)
* code MS
* code from X12278RequestedServiceType (required)
* quantity[x] MS
* quantity[x] only Quantity
* subject MS
* subject only Reference(PASBeneficiary)
* occurrence[x] MS
* occurrence[x] only PASTiming

Profile: PASDeviceRequest
Parent: DeviceRequest
Id: profile-devicerequest
Title: "PAS Device Request"
Description: "PAS constraints on DeviceRequest resource mandating support for elements relevant to the devices being requested on a prior authorization request"
* intent = #order (exactly)
* code[x] MS
* code[x] only CodeableConcept
* codeCodeableConcept from X12278RequestedServiceType (required)
* subject MS
* subject only Reference(PASBeneficiary)
* occurrence[x] MS
* occurrence[x] only PASTiming

Profile: PASTiming
Parent: Timing
Id: profile-datatype-timing
Title: "PAS Timing"
Description: "PAS constraints on the Timing datatype used in the various service requests."
* extension contains CalendarPattern named calendarPattern 0..1 MS and
	DeliveryPattern named deliveryPattern 0..1 MS
* repeat.bounds[x] MS
* repeat.bounds[x] only Duration
* repeat.period MS
* repeat.periodUnit MS

Extension: CalendarPattern
Id: extension-timingcalendarpattern
Description: "A code representing the specific days when a service is being requested"
* value[x] only CodeableConcept
* valueCodeableConcept from https://valueset.x12.org/x217/005010/request/2000F/HSD/1/07/00/678 (required)
* valueCodeableConcept  ^binding.description = "Codes which specifies the routine shipments, deliveries, or calendar pattern. These codes are listed within an X12 implementation guide (TR3) and maintained by X12. All X12 work products are copyrighted. See their website for licensing terms and conditions."

Extension: DeliveryPattern
Id: extension-timingdeliverypattern
Description: "A code representing the specific delivery of a service being requested"
* value[x] only CodeableConcept
* valueCodeableConcept from https://valueset.x12.org/x217/005010/request/2000F/HSD/1/08/00/679 (required)
* valueCodeableConcept  ^binding.description = "Codes which specifies the time for routine shipments or deliveries
. These codes are listed within an X12 implementation guide (TR3) and maintained by X12. All X12 work products are copyrighted. See their website for licensing terms and conditions."
