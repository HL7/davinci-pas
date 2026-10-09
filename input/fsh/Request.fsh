Profile: PASMedicationRequest
Parent: http://hl7.org/fhir/us/core/StructureDefinition/us-core-medicationrequest|7.0.0
Id: profile-medicationrequest
Title: "PAS Medication Request"
Description: "PAS constraints on MedicationRequest resource mandating support for elements relevant to the prescriptions being requested on a prior authorization request"
* ^extension[$compliesWithProfile][+].valueCanonical = "http://hl7.org/fhir/us/core/StructureDefinition/us-core-medicationrequest|6.1.0"
* extension contains http://hl7.org/fhir/us/davinci-crd/StructureDefinition/ext-coverage-information named coverage 0..1 MS
* extension[coverage] ^extension[http://hl7.org/fhir/StructureDefinition/obligation][+].extension[code].valueCode = #SHALL:able-to-populate
* extension[coverage] ^extension[http://hl7.org/fhir/StructureDefinition/obligation][=].extension[actor].valueCanonical = "http://hl7.org/fhir/us/davinci-pas/ActorDefinition/client"
* extension[coverage] ^extension[http://hl7.org/fhir/StructureDefinition/obligation][+].extension[code].valueCode = #SHALL:process
* extension[coverage] ^extension[http://hl7.org/fhir/StructureDefinition/obligation][=].extension[actor].valueCanonical = "http://hl7.org/fhir/us/davinci-pas/ActorDefinition/payer"
* intent MS
* intent ^extension[http://hl7.org/fhir/StructureDefinition/obligation][+].extension[code].valueCode = #SHALL:able-to-populate
* intent ^extension[http://hl7.org/fhir/StructureDefinition/obligation][=].extension[actor].valueCanonical = "http://hl7.org/fhir/us/davinci-pas/ActorDefinition/client"
* intent ^extension[http://hl7.org/fhir/StructureDefinition/obligation][+].extension[code].valueCode = #SHALL:process
* intent ^extension[http://hl7.org/fhir/StructureDefinition/obligation][=].extension[actor].valueCanonical = "http://hl7.org/fhir/us/davinci-pas/ActorDefinition/payer"
* intent = #order (exactly)
* category ^extension[http://hl7.org/fhir/StructureDefinition/obligation][+].extension[code].valueCode = #SHALL:able-to-populate
* category ^extension[http://hl7.org/fhir/StructureDefinition/obligation][=].extension[actor].valueCanonical = "http://hl7.org/fhir/us/davinci-pas/ActorDefinition/client"
* category ^extension[http://hl7.org/fhir/StructureDefinition/obligation][+].extension[code].valueCode = #SHALL:process
* category ^extension[http://hl7.org/fhir/StructureDefinition/obligation][=].extension[actor].valueCanonical = "http://hl7.org/fhir/us/davinci-pas/ActorDefinition/payer"
* category[us-core] ^extension[http://hl7.org/fhir/StructureDefinition/obligation][+].extension[code].valueCode = #SHALL:able-to-populate
* category[us-core] ^extension[http://hl7.org/fhir/StructureDefinition/obligation][=].extension[actor].valueCanonical = "http://hl7.org/fhir/us/davinci-pas/ActorDefinition/client"
* category[us-core] ^extension[http://hl7.org/fhir/StructureDefinition/obligation][+].extension[code].valueCode = #SHALL:process
* category[us-core] ^extension[http://hl7.org/fhir/StructureDefinition/obligation][=].extension[actor].valueCanonical = "http://hl7.org/fhir/us/davinci-pas/ActorDefinition/payer"
* status MS
* status ^extension[http://hl7.org/fhir/StructureDefinition/obligation][+].extension[code].valueCode = #SHALL:able-to-populate
* status ^extension[http://hl7.org/fhir/StructureDefinition/obligation][=].extension[actor].valueCanonical = "http://hl7.org/fhir/us/davinci-pas/ActorDefinition/client"
* status ^extension[http://hl7.org/fhir/StructureDefinition/obligation][+].extension[code].valueCode = #SHALL:process
* status ^extension[http://hl7.org/fhir/StructureDefinition/obligation][=].extension[actor].valueCanonical = "http://hl7.org/fhir/us/davinci-pas/ActorDefinition/payer"
* status = #active (exactly)
* reported[x] ^extension[http://hl7.org/fhir/StructureDefinition/obligation][+].extension[code].valueCode = #SHALL:able-to-populate
* reported[x] ^extension[http://hl7.org/fhir/StructureDefinition/obligation][=].extension[actor].valueCanonical = "http://hl7.org/fhir/us/davinci-pas/ActorDefinition/client"
* reported[x] ^extension[http://hl7.org/fhir/StructureDefinition/obligation][+].extension[code].valueCode = #SHALL:process
* reported[x] ^extension[http://hl7.org/fhir/StructureDefinition/obligation][=].extension[actor].valueCanonical = "http://hl7.org/fhir/us/davinci-pas/ActorDefinition/payer"
* medication[x] ^extension[http://hl7.org/fhir/StructureDefinition/obligation][+].extension[code].valueCode = #SHALL:able-to-populate
* medication[x] ^extension[http://hl7.org/fhir/StructureDefinition/obligation][=].extension[actor].valueCanonical = "http://hl7.org/fhir/us/davinci-pas/ActorDefinition/client"
* medication[x] ^extension[http://hl7.org/fhir/StructureDefinition/obligation][+].extension[code].valueCode = #SHALL:process
* medication[x] ^extension[http://hl7.org/fhir/StructureDefinition/obligation][=].extension[actor].valueCanonical = "http://hl7.org/fhir/us/davinci-pas/ActorDefinition/payer"
* subject MS
* subject ^extension[http://hl7.org/fhir/StructureDefinition/obligation][+].extension[code].valueCode = #SHALL:able-to-populate
* subject ^extension[http://hl7.org/fhir/StructureDefinition/obligation][=].extension[actor].valueCanonical = "http://hl7.org/fhir/us/davinci-pas/ActorDefinition/client"
* subject ^extension[http://hl7.org/fhir/StructureDefinition/obligation][+].extension[code].valueCode = #SHALL:process
* subject ^extension[http://hl7.org/fhir/StructureDefinition/obligation][=].extension[actor].valueCanonical = "http://hl7.org/fhir/us/davinci-pas/ActorDefinition/payer"
* subject only Reference(PASBeneficiary)
* encounter ^extension[http://hl7.org/fhir/StructureDefinition/obligation][+].extension[code].valueCode = #SHALL:able-to-populate
* encounter ^extension[http://hl7.org/fhir/StructureDefinition/obligation][=].extension[actor].valueCanonical = "http://hl7.org/fhir/us/davinci-pas/ActorDefinition/client"
* encounter ^extension[http://hl7.org/fhir/StructureDefinition/obligation][+].extension[code].valueCode = #SHALL:process
* encounter ^extension[http://hl7.org/fhir/StructureDefinition/obligation][=].extension[actor].valueCanonical = "http://hl7.org/fhir/us/davinci-pas/ActorDefinition/payer"
* authoredOn ^extension[http://hl7.org/fhir/StructureDefinition/obligation][+].extension[code].valueCode = #SHALL:able-to-populate
* authoredOn ^extension[http://hl7.org/fhir/StructureDefinition/obligation][=].extension[actor].valueCanonical = "http://hl7.org/fhir/us/davinci-pas/ActorDefinition/client"
* authoredOn ^extension[http://hl7.org/fhir/StructureDefinition/obligation][+].extension[code].valueCode = #SHALL:process
* authoredOn ^extension[http://hl7.org/fhir/StructureDefinition/obligation][=].extension[actor].valueCanonical = "http://hl7.org/fhir/us/davinci-pas/ActorDefinition/payer"
* requester ^extension[http://hl7.org/fhir/StructureDefinition/obligation][+].extension[code].valueCode = #SHALL:able-to-populate
* requester ^extension[http://hl7.org/fhir/StructureDefinition/obligation][=].extension[actor].valueCanonical = "http://hl7.org/fhir/us/davinci-pas/ActorDefinition/client"
* requester ^extension[http://hl7.org/fhir/StructureDefinition/obligation][+].extension[code].valueCode = #SHALL:process
* requester ^extension[http://hl7.org/fhir/StructureDefinition/obligation][=].extension[actor].valueCanonical = "http://hl7.org/fhir/us/davinci-pas/ActorDefinition/payer"
* dosageInstruction ^extension[http://hl7.org/fhir/StructureDefinition/obligation][+].extension[code].valueCode = #SHALL:able-to-populate
* dosageInstruction ^extension[http://hl7.org/fhir/StructureDefinition/obligation][=].extension[actor].valueCanonical = "http://hl7.org/fhir/us/davinci-pas/ActorDefinition/client"
* dosageInstruction ^extension[http://hl7.org/fhir/StructureDefinition/obligation][+].extension[code].valueCode = #SHALL:process
* dosageInstruction ^extension[http://hl7.org/fhir/StructureDefinition/obligation][=].extension[actor].valueCanonical = "http://hl7.org/fhir/us/davinci-pas/ActorDefinition/payer"
* dosageInstruction.text ^extension[http://hl7.org/fhir/StructureDefinition/obligation][+].extension[code].valueCode = #SHALL:able-to-populate
* dosageInstruction.text ^extension[http://hl7.org/fhir/StructureDefinition/obligation][=].extension[actor].valueCanonical = "http://hl7.org/fhir/us/davinci-pas/ActorDefinition/client"
* dosageInstruction.text ^extension[http://hl7.org/fhir/StructureDefinition/obligation][+].extension[code].valueCode = #SHALL:process
* dosageInstruction.text ^extension[http://hl7.org/fhir/StructureDefinition/obligation][=].extension[actor].valueCanonical = "http://hl7.org/fhir/us/davinci-pas/ActorDefinition/payer"
* dosageInstruction.timing MS
* dosageInstruction.timing ^extension[http://hl7.org/fhir/StructureDefinition/obligation][+].extension[code].valueCode = #SHALL:able-to-populate
* dosageInstruction.timing ^extension[http://hl7.org/fhir/StructureDefinition/obligation][=].extension[actor].valueCanonical = "http://hl7.org/fhir/us/davinci-pas/ActorDefinition/client"
* dosageInstruction.timing ^extension[http://hl7.org/fhir/StructureDefinition/obligation][+].extension[code].valueCode = #SHALL:process
* dosageInstruction.timing ^extension[http://hl7.org/fhir/StructureDefinition/obligation][=].extension[actor].valueCanonical = "http://hl7.org/fhir/us/davinci-pas/ActorDefinition/payer"
* dosageInstruction.timing only PASTiming
* dosageInstruction.doseAndRate ^extension[http://hl7.org/fhir/StructureDefinition/obligation][+].extension[code].valueCode = #SHALL:able-to-populate
* dosageInstruction.doseAndRate ^extension[http://hl7.org/fhir/StructureDefinition/obligation][=].extension[actor].valueCanonical = "http://hl7.org/fhir/us/davinci-pas/ActorDefinition/client"
* dosageInstruction.doseAndRate ^extension[http://hl7.org/fhir/StructureDefinition/obligation][+].extension[code].valueCode = #SHALL:process
* dosageInstruction.doseAndRate ^extension[http://hl7.org/fhir/StructureDefinition/obligation][=].extension[actor].valueCanonical = "http://hl7.org/fhir/us/davinci-pas/ActorDefinition/payer"
* dosageInstruction.doseAndRate.dose[x] ^extension[http://hl7.org/fhir/StructureDefinition/obligation][+].extension[code].valueCode = #SHALL:able-to-populate
* dosageInstruction.doseAndRate.dose[x] ^extension[http://hl7.org/fhir/StructureDefinition/obligation][=].extension[actor].valueCanonical = "http://hl7.org/fhir/us/davinci-pas/ActorDefinition/client"
* dosageInstruction.doseAndRate.dose[x] ^extension[http://hl7.org/fhir/StructureDefinition/obligation][+].extension[code].valueCode = #SHALL:process
* dosageInstruction.doseAndRate.dose[x] ^extension[http://hl7.org/fhir/StructureDefinition/obligation][=].extension[actor].valueCanonical = "http://hl7.org/fhir/us/davinci-pas/ActorDefinition/payer"
* dispenseRequest MS
* dispenseRequest ^extension[http://hl7.org/fhir/StructureDefinition/obligation][+].extension[code].valueCode = #SHALL:able-to-populate
* dispenseRequest ^extension[http://hl7.org/fhir/StructureDefinition/obligation][=].extension[actor].valueCanonical = "http://hl7.org/fhir/us/davinci-pas/ActorDefinition/client"
* dispenseRequest ^extension[http://hl7.org/fhir/StructureDefinition/obligation][+].extension[code].valueCode = #SHALL:process
* dispenseRequest ^extension[http://hl7.org/fhir/StructureDefinition/obligation][=].extension[actor].valueCanonical = "http://hl7.org/fhir/us/davinci-pas/ActorDefinition/payer"
* dispenseRequest.numberOfRepeatsAllowed ^extension[http://hl7.org/fhir/StructureDefinition/obligation][+].extension[code].valueCode = #SHALL:able-to-populate
* dispenseRequest.numberOfRepeatsAllowed ^extension[http://hl7.org/fhir/StructureDefinition/obligation][=].extension[actor].valueCanonical = "http://hl7.org/fhir/us/davinci-pas/ActorDefinition/client"
* dispenseRequest.numberOfRepeatsAllowed ^extension[http://hl7.org/fhir/StructureDefinition/obligation][+].extension[code].valueCode = #SHALL:process
* dispenseRequest.numberOfRepeatsAllowed ^extension[http://hl7.org/fhir/StructureDefinition/obligation][=].extension[actor].valueCanonical = "http://hl7.org/fhir/us/davinci-pas/ActorDefinition/payer"
* dispenseRequest.quantity MS
* dispenseRequest.quantity ^extension[http://hl7.org/fhir/StructureDefinition/obligation][+].extension[code].valueCode = #SHALL:able-to-populate
* dispenseRequest.quantity ^extension[http://hl7.org/fhir/StructureDefinition/obligation][=].extension[actor].valueCanonical = "http://hl7.org/fhir/us/davinci-pas/ActorDefinition/client"
* dispenseRequest.quantity ^extension[http://hl7.org/fhir/StructureDefinition/obligation][+].extension[code].valueCode = #SHALL:process
* dispenseRequest.quantity ^extension[http://hl7.org/fhir/StructureDefinition/obligation][=].extension[actor].valueCanonical = "http://hl7.org/fhir/us/davinci-pas/ActorDefinition/payer"

Profile: PASServiceRequest
Parent: ServiceRequest
Id: profile-servicerequest
Title: "PAS Service Request"
Description: "PAS constraints on ServiceRequest resource mandating support for elements relevant to the generic services being requested on a prior authorization request"
* extension contains ProductOrServiceCodeEnd named serviceCodeEnd 0..1 MS and http://hl7.org/fhir/us/davinci-crd/StructureDefinition/ext-coverage-information named coverage 0..1 MS
* extension[serviceCodeEnd] ^extension[http://hl7.org/fhir/StructureDefinition/obligation][+].extension[code].valueCode = #SHALL:able-to-populate
* extension[serviceCodeEnd] ^extension[http://hl7.org/fhir/StructureDefinition/obligation][=].extension[actor].valueCanonical = "http://hl7.org/fhir/us/davinci-pas/ActorDefinition/client"
* extension[serviceCodeEnd] ^extension[http://hl7.org/fhir/StructureDefinition/obligation][+].extension[code].valueCode = #SHALL:process
* extension[serviceCodeEnd] ^extension[http://hl7.org/fhir/StructureDefinition/obligation][=].extension[actor].valueCanonical = "http://hl7.org/fhir/us/davinci-pas/ActorDefinition/payer"
* extension[coverage] ^extension[http://hl7.org/fhir/StructureDefinition/obligation][+].extension[code].valueCode = #SHALL:able-to-populate
* extension[coverage] ^extension[http://hl7.org/fhir/StructureDefinition/obligation][=].extension[actor].valueCanonical = "http://hl7.org/fhir/us/davinci-pas/ActorDefinition/client"
* extension[coverage] ^extension[http://hl7.org/fhir/StructureDefinition/obligation][+].extension[code].valueCode = #SHALL:process
* extension[coverage] ^extension[http://hl7.org/fhir/StructureDefinition/obligation][=].extension[actor].valueCanonical = "http://hl7.org/fhir/us/davinci-pas/ActorDefinition/payer"
* intent MS
* intent ^extension[http://hl7.org/fhir/StructureDefinition/obligation][+].extension[code].valueCode = #SHALL:able-to-populate
* intent ^extension[http://hl7.org/fhir/StructureDefinition/obligation][=].extension[actor].valueCanonical = "http://hl7.org/fhir/us/davinci-pas/ActorDefinition/client"
* intent ^extension[http://hl7.org/fhir/StructureDefinition/obligation][+].extension[code].valueCode = #SHALL:process
* intent ^extension[http://hl7.org/fhir/StructureDefinition/obligation][=].extension[actor].valueCanonical = "http://hl7.org/fhir/us/davinci-pas/ActorDefinition/payer"
* intent = #order (exactly)
* code MS
* code ^extension[http://hl7.org/fhir/StructureDefinition/obligation][+].extension[code].valueCode = #SHALL:able-to-populate
* code ^extension[http://hl7.org/fhir/StructureDefinition/obligation][=].extension[actor].valueCanonical = "http://hl7.org/fhir/us/davinci-pas/ActorDefinition/client"
* code ^extension[http://hl7.org/fhir/StructureDefinition/obligation][+].extension[code].valueCode = #SHALL:process
* code ^extension[http://hl7.org/fhir/StructureDefinition/obligation][=].extension[actor].valueCanonical = "http://hl7.org/fhir/us/davinci-pas/ActorDefinition/payer"
* code from X12278RequestedServiceType (required)
* quantity[x] MS
* quantity[x] ^extension[http://hl7.org/fhir/StructureDefinition/obligation][+].extension[code].valueCode = #SHALL:able-to-populate
* quantity[x] ^extension[http://hl7.org/fhir/StructureDefinition/obligation][=].extension[actor].valueCanonical = "http://hl7.org/fhir/us/davinci-pas/ActorDefinition/client"
* quantity[x] ^extension[http://hl7.org/fhir/StructureDefinition/obligation][+].extension[code].valueCode = #SHALL:process
* quantity[x] ^extension[http://hl7.org/fhir/StructureDefinition/obligation][=].extension[actor].valueCanonical = "http://hl7.org/fhir/us/davinci-pas/ActorDefinition/payer"
* quantity[x] only PASQuantity
* subject MS
* subject ^extension[http://hl7.org/fhir/StructureDefinition/obligation][+].extension[code].valueCode = #SHALL:able-to-populate
* subject ^extension[http://hl7.org/fhir/StructureDefinition/obligation][=].extension[actor].valueCanonical = "http://hl7.org/fhir/us/davinci-pas/ActorDefinition/client"
* subject ^extension[http://hl7.org/fhir/StructureDefinition/obligation][+].extension[code].valueCode = #SHALL:process
* subject ^extension[http://hl7.org/fhir/StructureDefinition/obligation][=].extension[actor].valueCanonical = "http://hl7.org/fhir/us/davinci-pas/ActorDefinition/payer"
* subject only Reference(PASBeneficiary)
* occurrence[x] MS
* occurrence[x] ^extension[http://hl7.org/fhir/StructureDefinition/obligation][+].extension[code].valueCode = #SHALL:able-to-populate
* occurrence[x] ^extension[http://hl7.org/fhir/StructureDefinition/obligation][=].extension[actor].valueCanonical = "http://hl7.org/fhir/us/davinci-pas/ActorDefinition/client"
* occurrence[x] ^extension[http://hl7.org/fhir/StructureDefinition/obligation][+].extension[code].valueCode = #SHALL:process
* occurrence[x] ^extension[http://hl7.org/fhir/StructureDefinition/obligation][=].extension[actor].valueCanonical = "http://hl7.org/fhir/us/davinci-pas/ActorDefinition/payer"
* occurrence[x] only PASTiming

Profile: PASNutritionOrder
Parent: NutritionOrder
Id: profile-nutritionorder
Title: "PAS Nutrition Order"
Description: "PAS constraint on Nutrition Order resource for elements relevant to the ordering of nutrition on a prior authorization request"
* extension contains http://hl7.org/fhir/us/davinci-crd/StructureDefinition/ext-coverage-information named coverage 0..1 MS
* extension[coverage] ^extension[http://hl7.org/fhir/StructureDefinition/obligation][+].extension[code].valueCode = #SHALL:able-to-populate
* extension[coverage] ^extension[http://hl7.org/fhir/StructureDefinition/obligation][=].extension[actor].valueCanonical = "http://hl7.org/fhir/us/davinci-pas/ActorDefinition/client"
* extension[coverage] ^extension[http://hl7.org/fhir/StructureDefinition/obligation][+].extension[code].valueCode = #SHALL:process
* extension[coverage] ^extension[http://hl7.org/fhir/StructureDefinition/obligation][=].extension[actor].valueCanonical = "http://hl7.org/fhir/us/davinci-pas/ActorDefinition/payer"
* intent MS
* intent ^extension[http://hl7.org/fhir/StructureDefinition/obligation][+].extension[code].valueCode = #SHALL:able-to-populate
* intent ^extension[http://hl7.org/fhir/StructureDefinition/obligation][=].extension[actor].valueCanonical = "http://hl7.org/fhir/us/davinci-pas/ActorDefinition/client"
* intent ^extension[http://hl7.org/fhir/StructureDefinition/obligation][+].extension[code].valueCode = #SHALL:process
* intent ^extension[http://hl7.org/fhir/StructureDefinition/obligation][=].extension[actor].valueCanonical = "http://hl7.org/fhir/us/davinci-pas/ActorDefinition/payer"
* intent = #order (exactly)
* patient MS
* patient ^extension[http://hl7.org/fhir/StructureDefinition/obligation][+].extension[code].valueCode = #SHALL:able-to-populate
* patient ^extension[http://hl7.org/fhir/StructureDefinition/obligation][=].extension[actor].valueCanonical = "http://hl7.org/fhir/us/davinci-pas/ActorDefinition/client"
* patient ^extension[http://hl7.org/fhir/StructureDefinition/obligation][+].extension[code].valueCode = #SHALL:process
* patient ^extension[http://hl7.org/fhir/StructureDefinition/obligation][=].extension[actor].valueCanonical = "http://hl7.org/fhir/us/davinci-pas/ActorDefinition/payer"
* patient only Reference(PASBeneficiary)
* oralDiet MS
* oralDiet ^extension[http://hl7.org/fhir/StructureDefinition/obligation][+].extension[code].valueCode = #SHALL:able-to-populate
* oralDiet ^extension[http://hl7.org/fhir/StructureDefinition/obligation][=].extension[actor].valueCanonical = "http://hl7.org/fhir/us/davinci-pas/ActorDefinition/client"
* oralDiet ^extension[http://hl7.org/fhir/StructureDefinition/obligation][+].extension[code].valueCode = #SHALL:process
* oralDiet ^extension[http://hl7.org/fhir/StructureDefinition/obligation][=].extension[actor].valueCanonical = "http://hl7.org/fhir/us/davinci-pas/ActorDefinition/payer"
* oralDiet.type MS
* oralDiet.type ^extension[http://hl7.org/fhir/StructureDefinition/obligation][+].extension[code].valueCode = #SHALL:able-to-populate
* oralDiet.type ^extension[http://hl7.org/fhir/StructureDefinition/obligation][=].extension[actor].valueCanonical = "http://hl7.org/fhir/us/davinci-pas/ActorDefinition/client"
* oralDiet.type ^extension[http://hl7.org/fhir/StructureDefinition/obligation][+].extension[code].valueCode = #SHALL:process
* oralDiet.type ^extension[http://hl7.org/fhir/StructureDefinition/obligation][=].extension[actor].valueCanonical = "http://hl7.org/fhir/us/davinci-pas/ActorDefinition/payer"
* oralDiet.type from X12278NutritionOralDietType (required)
* enteralFormula MS
* enteralFormula ^extension[http://hl7.org/fhir/StructureDefinition/obligation][+].extension[code].valueCode = #SHALL:able-to-populate
* enteralFormula ^extension[http://hl7.org/fhir/StructureDefinition/obligation][=].extension[actor].valueCanonical = "http://hl7.org/fhir/us/davinci-pas/ActorDefinition/client"
* enteralFormula ^extension[http://hl7.org/fhir/StructureDefinition/obligation][+].extension[code].valueCode = #SHALL:process
* enteralFormula ^extension[http://hl7.org/fhir/StructureDefinition/obligation][=].extension[actor].valueCanonical = "http://hl7.org/fhir/us/davinci-pas/ActorDefinition/payer"
* enteralFormula.baseFormulaType MS
* enteralFormula.baseFormulaType ^extension[http://hl7.org/fhir/StructureDefinition/obligation][+].extension[code].valueCode = #SHALL:able-to-populate
* enteralFormula.baseFormulaType ^extension[http://hl7.org/fhir/StructureDefinition/obligation][=].extension[actor].valueCanonical = "http://hl7.org/fhir/us/davinci-pas/ActorDefinition/client"
* enteralFormula.baseFormulaType ^extension[http://hl7.org/fhir/StructureDefinition/obligation][+].extension[code].valueCode = #SHALL:process
* enteralFormula.baseFormulaType ^extension[http://hl7.org/fhir/StructureDefinition/obligation][=].extension[actor].valueCanonical = "http://hl7.org/fhir/us/davinci-pas/ActorDefinition/payer"
* enteralFormula.baseFormulaType from X12278NutritionEnteralFormulaType (required)


Profile: PASDeviceRequest
Parent: DeviceRequest
Id: profile-devicerequest
Title: "PAS Device Request"
Description: "PAS constraints on DeviceRequest resource mandating support for elements relevant to the devices being requested on a prior authorization request"
* extension contains http://hl7.org/fhir/us/davinci-crd/StructureDefinition/ext-coverage-information named coverage 0..1 MS
* extension[coverage] ^extension[http://hl7.org/fhir/StructureDefinition/obligation][+].extension[code].valueCode = #SHALL:able-to-populate
* extension[coverage] ^extension[http://hl7.org/fhir/StructureDefinition/obligation][=].extension[actor].valueCanonical = "http://hl7.org/fhir/us/davinci-pas/ActorDefinition/client"
* extension[coverage] ^extension[http://hl7.org/fhir/StructureDefinition/obligation][+].extension[code].valueCode = #SHALL:process
* extension[coverage] ^extension[http://hl7.org/fhir/StructureDefinition/obligation][=].extension[actor].valueCanonical = "http://hl7.org/fhir/us/davinci-pas/ActorDefinition/payer"
* intent MS
* intent ^extension[http://hl7.org/fhir/StructureDefinition/obligation][+].extension[code].valueCode = #SHALL:able-to-populate
* intent ^extension[http://hl7.org/fhir/StructureDefinition/obligation][=].extension[actor].valueCanonical = "http://hl7.org/fhir/us/davinci-pas/ActorDefinition/client"
* intent ^extension[http://hl7.org/fhir/StructureDefinition/obligation][+].extension[code].valueCode = #SHALL:process
* intent ^extension[http://hl7.org/fhir/StructureDefinition/obligation][=].extension[actor].valueCanonical = "http://hl7.org/fhir/us/davinci-pas/ActorDefinition/payer"
* intent = #order (exactly)
* code[x] MS
* code[x] ^extension[http://hl7.org/fhir/StructureDefinition/obligation][+].extension[code].valueCode = #SHALL:able-to-populate
* code[x] ^extension[http://hl7.org/fhir/StructureDefinition/obligation][=].extension[actor].valueCanonical = "http://hl7.org/fhir/us/davinci-pas/ActorDefinition/client"
* code[x] ^extension[http://hl7.org/fhir/StructureDefinition/obligation][+].extension[code].valueCode = #SHALL:process
* code[x] ^extension[http://hl7.org/fhir/StructureDefinition/obligation][=].extension[actor].valueCanonical = "http://hl7.org/fhir/us/davinci-pas/ActorDefinition/payer"
* code[x] only CodeableConcept
* codeCodeableConcept from X12278RequestedServiceType (required)
* subject MS
* subject ^extension[http://hl7.org/fhir/StructureDefinition/obligation][+].extension[code].valueCode = #SHALL:able-to-populate
* subject ^extension[http://hl7.org/fhir/StructureDefinition/obligation][=].extension[actor].valueCanonical = "http://hl7.org/fhir/us/davinci-pas/ActorDefinition/client"
* subject ^extension[http://hl7.org/fhir/StructureDefinition/obligation][+].extension[code].valueCode = #SHALL:process
* subject ^extension[http://hl7.org/fhir/StructureDefinition/obligation][=].extension[actor].valueCanonical = "http://hl7.org/fhir/us/davinci-pas/ActorDefinition/payer"
* subject only Reference(PASBeneficiary)
* occurrence[x] MS
* occurrence[x] ^extension[http://hl7.org/fhir/StructureDefinition/obligation][+].extension[code].valueCode = #SHALL:able-to-populate
* occurrence[x] ^extension[http://hl7.org/fhir/StructureDefinition/obligation][=].extension[actor].valueCanonical = "http://hl7.org/fhir/us/davinci-pas/ActorDefinition/client"
* occurrence[x] ^extension[http://hl7.org/fhir/StructureDefinition/obligation][+].extension[code].valueCode = #SHALL:process
* occurrence[x] ^extension[http://hl7.org/fhir/StructureDefinition/obligation][=].extension[actor].valueCanonical = "http://hl7.org/fhir/us/davinci-pas/ActorDefinition/payer"
* occurrence[x] only PASTiming

Profile: PASTiming
Parent: Timing
Id: profile-datatype-timing
Title: "PAS Timing"
Description: "PAS constraints on the Timing datatype used in the various service requests."
* extension contains CalendarPattern named calendarPattern 0..1 MS and
	DeliveryPattern named deliveryPattern 0..1 MS
* extension[calendarPattern] ^extension[http://hl7.org/fhir/StructureDefinition/obligation][+].extension[code].valueCode = #SHALL:able-to-populate
* extension[calendarPattern] ^extension[http://hl7.org/fhir/StructureDefinition/obligation][=].extension[actor].valueCanonical = "http://hl7.org/fhir/us/davinci-pas/ActorDefinition/client"
* extension[calendarPattern] ^extension[http://hl7.org/fhir/StructureDefinition/obligation][+].extension[code].valueCode = #SHALL:process
* extension[calendarPattern] ^extension[http://hl7.org/fhir/StructureDefinition/obligation][=].extension[actor].valueCanonical = "http://hl7.org/fhir/us/davinci-pas/ActorDefinition/payer"
* extension[deliveryPattern] ^extension[http://hl7.org/fhir/StructureDefinition/obligation][+].extension[code].valueCode = #SHALL:able-to-populate
* extension[deliveryPattern] ^extension[http://hl7.org/fhir/StructureDefinition/obligation][=].extension[actor].valueCanonical = "http://hl7.org/fhir/us/davinci-pas/ActorDefinition/client"
* extension[deliveryPattern] ^extension[http://hl7.org/fhir/StructureDefinition/obligation][+].extension[code].valueCode = #SHALL:process
* extension[deliveryPattern] ^extension[http://hl7.org/fhir/StructureDefinition/obligation][=].extension[actor].valueCanonical = "http://hl7.org/fhir/us/davinci-pas/ActorDefinition/payer"
* repeat 0..1 MS
* repeat ^extension[http://hl7.org/fhir/StructureDefinition/obligation][+].extension[code].valueCode = #SHALL:able-to-populate
* repeat ^extension[http://hl7.org/fhir/StructureDefinition/obligation][=].extension[actor].valueCanonical = "http://hl7.org/fhir/us/davinci-pas/ActorDefinition/client"
* repeat ^extension[http://hl7.org/fhir/StructureDefinition/obligation][+].extension[code].valueCode = #SHALL:process
* repeat ^extension[http://hl7.org/fhir/StructureDefinition/obligation][=].extension[actor].valueCanonical = "http://hl7.org/fhir/us/davinci-pas/ActorDefinition/payer"
* repeat.bounds[x] MS
  * ^short = "The number of periods over which the service is delivered."
* repeat.bounds[x] ^extension[http://hl7.org/fhir/StructureDefinition/obligation][+].extension[code].valueCode = #SHALL:able-to-populate
* repeat.bounds[x] ^extension[http://hl7.org/fhir/StructureDefinition/obligation][=].extension[actor].valueCanonical = "http://hl7.org/fhir/us/davinci-pas/ActorDefinition/client"
* repeat.bounds[x] ^extension[http://hl7.org/fhir/StructureDefinition/obligation][+].extension[code].valueCode = #SHALL:process
* repeat.bounds[x] ^extension[http://hl7.org/fhir/StructureDefinition/obligation][=].extension[actor].valueCanonical = "http://hl7.org/fhir/us/davinci-pas/ActorDefinition/payer"
* repeat.bounds[x] only Duration
* repeat.boundsDuration 0..1 MS
* repeat.boundsDuration ^extension[http://hl7.org/fhir/StructureDefinition/obligation][+].extension[code].valueCode = #SHALL:able-to-populate
* repeat.boundsDuration ^extension[http://hl7.org/fhir/StructureDefinition/obligation][=].extension[actor].valueCanonical = "http://hl7.org/fhir/us/davinci-pas/ActorDefinition/client"
* repeat.boundsDuration ^extension[http://hl7.org/fhir/StructureDefinition/obligation][+].extension[code].valueCode = #SHALL:process
* repeat.boundsDuration ^extension[http://hl7.org/fhir/StructureDefinition/obligation][=].extension[actor].valueCanonical = "http://hl7.org/fhir/us/davinci-pas/ActorDefinition/payer"
* repeat.count 0..1 MS
* repeat.count ^extension[http://hl7.org/fhir/StructureDefinition/obligation][+].extension[code].valueCode = #SHALL:able-to-populate
* repeat.count ^extension[http://hl7.org/fhir/StructureDefinition/obligation][=].extension[actor].valueCanonical = "http://hl7.org/fhir/us/davinci-pas/ActorDefinition/client"
* repeat.count ^extension[http://hl7.org/fhir/StructureDefinition/obligation][+].extension[code].valueCode = #SHALL:process
* repeat.count ^extension[http://hl7.org/fhir/StructureDefinition/obligation][=].extension[actor].valueCanonical = "http://hl7.org/fhir/us/davinci-pas/ActorDefinition/payer"
* repeat.countMax 0..1 MS
* repeat.countMax ^extension[http://hl7.org/fhir/StructureDefinition/obligation][+].extension[code].valueCode = #SHALL:able-to-populate
* repeat.countMax ^extension[http://hl7.org/fhir/StructureDefinition/obligation][=].extension[actor].valueCanonical = "http://hl7.org/fhir/us/davinci-pas/ActorDefinition/client"
* repeat.countMax ^extension[http://hl7.org/fhir/StructureDefinition/obligation][+].extension[code].valueCode = #SHALL:process
* repeat.countMax ^extension[http://hl7.org/fhir/StructureDefinition/obligation][=].extension[actor].valueCanonical = "http://hl7.org/fhir/us/davinci-pas/ActorDefinition/payer"
* repeat.frequency 0..1 MS
* repeat.frequency ^extension[http://hl7.org/fhir/StructureDefinition/obligation][+].extension[code].valueCode = #SHALL:able-to-populate
* repeat.frequency ^extension[http://hl7.org/fhir/StructureDefinition/obligation][=].extension[actor].valueCanonical = "http://hl7.org/fhir/us/davinci-pas/ActorDefinition/client"
* repeat.frequency ^extension[http://hl7.org/fhir/StructureDefinition/obligation][+].extension[code].valueCode = #SHALL:process
* repeat.frequency ^extension[http://hl7.org/fhir/StructureDefinition/obligation][=].extension[actor].valueCanonical = "http://hl7.org/fhir/us/davinci-pas/ActorDefinition/payer"
* repeat.frequencyMax 0..1 MS
* repeat.frequencyMax ^extension[http://hl7.org/fhir/StructureDefinition/obligation][+].extension[code].valueCode = #SHALL:able-to-populate
* repeat.frequencyMax ^extension[http://hl7.org/fhir/StructureDefinition/obligation][=].extension[actor].valueCanonical = "http://hl7.org/fhir/us/davinci-pas/ActorDefinition/client"
* repeat.frequencyMax ^extension[http://hl7.org/fhir/StructureDefinition/obligation][+].extension[code].valueCode = #SHALL:process
* repeat.frequencyMax ^extension[http://hl7.org/fhir/StructureDefinition/obligation][=].extension[actor].valueCanonical = "http://hl7.org/fhir/us/davinci-pas/ActorDefinition/payer"
* repeat.period 0..1 MS
* repeat.period ^extension[http://hl7.org/fhir/StructureDefinition/obligation][+].extension[code].valueCode = #SHALL:able-to-populate
* repeat.period ^extension[http://hl7.org/fhir/StructureDefinition/obligation][=].extension[actor].valueCanonical = "http://hl7.org/fhir/us/davinci-pas/ActorDefinition/client"
* repeat.period ^extension[http://hl7.org/fhir/StructureDefinition/obligation][+].extension[code].valueCode = #SHALL:process
* repeat.period ^extension[http://hl7.org/fhir/StructureDefinition/obligation][=].extension[actor].valueCanonical = "http://hl7.org/fhir/us/davinci-pas/ActorDefinition/payer"
* repeat.periodMax 0..1 MS
* repeat.periodMax ^extension[http://hl7.org/fhir/StructureDefinition/obligation][+].extension[code].valueCode = #SHALL:able-to-populate
* repeat.periodMax ^extension[http://hl7.org/fhir/StructureDefinition/obligation][=].extension[actor].valueCanonical = "http://hl7.org/fhir/us/davinci-pas/ActorDefinition/client"
* repeat.periodMax ^extension[http://hl7.org/fhir/StructureDefinition/obligation][+].extension[code].valueCode = #SHALL:process
* repeat.periodMax ^extension[http://hl7.org/fhir/StructureDefinition/obligation][=].extension[actor].valueCanonical = "http://hl7.org/fhir/us/davinci-pas/ActorDefinition/payer"
* repeat.periodUnit 0..1 MS
* repeat.periodUnit ^extension[http://hl7.org/fhir/StructureDefinition/obligation][+].extension[code].valueCode = #SHALL:able-to-populate
* repeat.periodUnit ^extension[http://hl7.org/fhir/StructureDefinition/obligation][=].extension[actor].valueCanonical = "http://hl7.org/fhir/us/davinci-pas/ActorDefinition/client"
* repeat.periodUnit ^extension[http://hl7.org/fhir/StructureDefinition/obligation][+].extension[code].valueCode = #SHALL:process
* repeat.periodUnit ^extension[http://hl7.org/fhir/StructureDefinition/obligation][=].extension[actor].valueCanonical = "http://hl7.org/fhir/us/davinci-pas/ActorDefinition/payer"

//modified
Extension: CalendarPattern
Id: extension-timingcalendarpattern
Title: "Calendar Pattern"
Description: "A code representing the specific days when a service is being requested"
* value[x] only CodeableConcept
* valueCodeableConcept from https://valueset.x12.org/x217/005010/request/2000F/HSD/1/07/00/678 (required)
* valueCodeableConcept  ^binding.description = "Codes which specifies the routine shipments, deliveries, or calendar pattern. These codes are listed within an X12 implementation guide (TR3) and maintained by X12. All X12 work products are copyrighted. See their website for licensing terms and conditions."
* ^context[+].type = #element
* ^context[=].expression = "Request"
* ^context[+].type = #element
* ^context[=].expression = "Dosage.timing"

Extension: DeliveryPattern
Id: extension-timingdeliverypattern
Title: "Delivery Pattern"
Description: "A code representing the specific delivery of a service being requested"
* value[x] only CodeableConcept
* valueCodeableConcept from https://valueset.x12.org/x217/005010/request/2000F/HSD/1/08/00/679 (required)
* valueCodeableConcept  ^binding.description = "Codes which specifies the time for routine shipments or deliveries
. These codes are listed within an X12 implementation guide (TR3) and maintained by X12. All X12 work products are copyrighted. See their website for licensing terms and conditions."
* ^context[+].type = #element
* ^context[=].expression = "Request"
* ^context[+].type = #element
* ^context[=].expression = "Dosage.timing"