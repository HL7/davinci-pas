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
* extension contains ProductOrServiceCodeEnd named serviceCodeEnd 0..1
* intent = #order (exactly)
* code MS
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
* subject MS
* subject only Reference(PASBeneficiary)
* occurrence[x] MS
* occurrence[x] only PASTiming

Profile: PASTiming
Parent: Timing
Id: profile-datatype-timing
Title: "PAS Timing"
Description: "PAS constraints on the Timing datatype used in the various service requests."
* extension contains CalendarPattern named calendarPattern 0..1
* extension contains DeliveryPattern named deliveryPattern 0..1
* repeat.bounds[x] MS
* repeat.bounds[x] only Duration
* repeat.period MS
* repeat.periodUnit MS

Extension: CalendarPattern
Id: extension-timingcalendarpattern
Description: "A code representing the specific days when a service is being requested"
* value[x] only CodeableConcept

Extension: DeliveryPattern
Id: extension-timingdeliverypattern
Description: "A code representing the specific delivery of a service being requested"
* value[x] only CodeableConcept
