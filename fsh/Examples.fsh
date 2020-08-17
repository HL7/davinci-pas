Instance: ClaimSubmitBundleExample
InstanceOf: PASRequestBundle
Title: "Submit Claim Bundle Example"
Description: "An example of a claim bundle requesting prior authorization of a referral."
* identifier.system = "http://example.org/SUBMITTER_TRANSACTION_IDENTIFIER"
* identifier.value = "A12345"
* type = #collection
* timestamp = 2005-05-02T11:01:00+05:00
* entry[Claim].fullUrl = "http://example.org/fhir/Claim/1"
* entry[Claim].resource = ClaimSubmitExample
* entry[1].fullUrl = "http://example.org/fhir/Organization/umo-1"
* entry[1].resource = UMOExample
* entry[2].fullUrl = "http://example.org/fhir/Organization/insurer-1"
* entry[2].resource = InsurerExample
* entry[3].fullUrl = "http://example.org/fhir/Coverage/insurance-1"
* entry[3].resource = InsuranceExample
* entry[4].fullUrl = "http://example.org/fhir/Patient/subscriber-1"
* entry[4].resource = SubscriberExample
* entry[5].fullUrl = "http://example.org/fhir/ServiceRequest/referral-1"
* entry[5].resource = ReferralRequestExample

Instance: ClaimSubmitExample
InstanceOf: PASClaim
Title: "Submit Claim Example"
* identifier.system = "http://example.org/PATIENT_EVENT_TRACE_NUMBER"
* identifier.value = "111099"
* identifier.assigner.identifier.system = "http://example.org/USER_ASSIGNED"
* identifier.assigner.identifier.value = "9012345678"
* status = #active
* type = http://terminology.hl7.org/CodeSystem/claim-type#professional
* use = #preauthorization
* patient = Reference(SubscriberExample)
* created = 2005-05-02T11:01:00+05:00
* provider = Reference(UMOExample)
* priority = http://terminology.hl7.org/CodeSystem/processpriority#normal
* insurance.sequence = 1
* insurance.focal = true
* insurance.coverage = Reference(InsuranceExample)
* item.sequence = 1
* item.productOrService = http://example.org/SERVICE_TYPE_CODE#3 "Consultation"


Instance: UMOExample
InstanceOf: PASRequestor
Title: "Submit Claim Requestor Example"
* active = true
* name = "DR. JOE SMITH CORPORATION"

Instance: InsurerExample
InstanceOf: PASInsurer
Title: "Submit Claim Insurer Example"
* active = true
* name = "MARYLAND CAPITAL INSURANCE COMPANY"

Instance: InsuranceExample
InstanceOf: PASCoverage
Title: "Submit Claim Insurance Example"
* status = #active
* beneficiary = Reference(SubscriberExample)
* payor = Reference(InsurerExample)

Instance: SubscriberExample
InstanceOf: PASSubscriber
Title: "Submit Claim Subscriber Example"
* identifier.system = "http://example.org/MIN"
* identifier.value = "12345678901"
* name.family = "SMITH"
* name.given = "JOE"
* gender = #male

Instance: ReferralRequestExample
InstanceOf: PASServiceRequest
Title: "Submit Claim Referral Request Example"
* status = #active
* intent = #order
* subject = Reference(SubscriberExample)
