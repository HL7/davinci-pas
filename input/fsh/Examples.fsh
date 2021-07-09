Instance: ReferralAuthorizationBundleExample
InstanceOf: PASRequestBundle
Title: "Referral Authorization Bundle Example"
Description: "An example of a Claim bundle requesting prior authorization of a referral."
* identifier.system = "http://example.org/SUBMITTER_TRANSACTION_IDENTIFIER"
* identifier.value = "A12345"
* type = #collection
* timestamp = 2005-05-02T11:01:00+05:00
* entry[Claim].fullUrl = "http://example.org/fhir/Claim/ReferralAuthorizationExample"
* entry[Claim].resource = ReferralAuthorizationExample
* entry[1].fullUrl = "http://example.org/fhir/Organization/UMOExample"
* entry[1].resource = UMOExample
* entry[2].fullUrl = "http://example.org/fhir/Organization/InsurerExample"
* entry[2].resource = InsurerExample
* entry[3].fullUrl = "http://example.org/fhir/Coverage/InsuranceExample"
* entry[3].resource = InsuranceExample
* entry[4].fullUrl = "http://example.org/fhir/Patient/SubscriberExample"
* entry[4].resource = SubscriberExample
* entry[5].fullUrl = "http://example.org/fhir/ServiceRequest/ReferralRequestExample"
* entry[5].resource = ReferralRequestExample

Instance: ReferralAuthorizationExample
InstanceOf: PASClaim
Title: "Referral Authorization Example"
Description: "An example of a Claim resource requesting prior authorization of a referral."
* identifier.system = "http://example.org/PATIENT_EVENT_TRACE_NUMBER"
* identifier.value = "111099"
* identifier.assigner.identifier.system = "http://example.org/USER_ASSIGNED"
* identifier.assigner.identifier.value = "9012345678"
* status = #active
* type = http://terminology.hl7.org/CodeSystem/claim-type#professional
* use = #preauthorization
* patient = Reference(SubscriberExample)
* created = 2005-05-02T11:01:00+05:00
* insurer = Reference(InsurerExample)
* provider = Reference(UMOExample)
* priority = http://terminology.hl7.org/CodeSystem/processpriority#normal
* diagnosis.sequence = 1
* diagnosis.diagnosisCodeableConcept = http://hl7.org/fhir/sid/icd-10-cm#G89.4
* insurance.sequence = 1
* insurance.focal = true
* insurance.coverage = Reference(InsuranceExample)
* item.extension[requestType].valueCodeableConcept = http://codesystem.x12.org/005010/1525#SC "Specialty Care Review"
* item.extension[certificationType].valueCodeableConcept = http://codesystem.x12.org/005010/1322#I "Initial"
* item.extension[requestedService].valueReference = Reference(ReferralRequestExample)
* item.sequence = 1
* item.careTeamSequence = 1
* item.diagnosisSequence = 1
* item.productOrService = http://codesystem.x12.org/005010/1365#3 "Consultation"
* item.locationCodeableConcept = https://www.cms.gov/Medicare/Coding/place-of-service-codes/Place_of_Service_Code_Set#11
* careTeam.sequence = 1
* careTeam.extension[careTeamClaimScope].valueBoolean = true
* careTeam.provider = Reference(ReferralPractitionerExample)

Instance: ReferralAuthorizationResponseBundleExample
InstanceOf: PASResponseBundle
Title: "Referral Authorization Response Bundle Example"
Description: "An example of a ClaimResponse bundle approving the authorization of a referral."
* type = #collection
* timestamp = 2005-05-02T11:02:00+05:00
* entry[ClaimResponse].fullUrl = "http://example.org/fhir/ClaimResponse/ReferralAuthorizationResponseExample"
* entry[ClaimResponse].resource = ReferralAuthorizationResponseExample
* entry[1].fullUrl = "http://example.org/fhir/Organization/UMOExample"
* entry[1].resource = UMOExample
* entry[2].fullUrl = "http://example.org/fhir/Organization/InsurerExample"
* entry[2].resource = InsurerExample
* entry[3].fullUrl = "http://example.org/fhir/Patient/SubscriberExample"
* entry[3].resource = SubscriberExample

Instance: ReferralAuthorizationResponseExample
InstanceOf: PASClaimResponse
Title: "Referral Authorization Response Example"
Description: "An example of a ClaimResponse giving approval for a referral."
* identifier.system = "http://example.org/PATIENT_EVENT_TRACE_NUMBER"
* identifier.value = "111099"
* identifier.assigner.identifier.system = "http://example.org/USER_ASSIGNED"
* identifier.assigner.identifier.value = "9012345678"
* status = #active
* type = http://terminology.hl7.org/CodeSystem/claim-type#professional
* use = #preauthorization
* patient = Reference(SubscriberExample)
* created = 2005-05-02T11:02:00+05:00
* insurer = Reference(InsurerExample)
* requestor = Reference(UMOExample)
* outcome = #complete
* item.itemSequence = 1
* item.extension[authorizedDate].valuePeriod.start = 2005-05-02
* item.extension[authorizedDate].valuePeriod.end = 2005-06-02
* item.adjudication.category = http://terminology.hl7.org/CodeSystem/adjudication#submitted
* item.adjudication.extension[reviewAction].extension[number].valueString = "AUTH0001"
* item.adjudication.extension[reviewAction].extension[code].valueCodeableConcept = http://codesystem.x12.org/005010/306#A1 "Certified in total"

Instance: HomecareAuthorizationBundleExample
InstanceOf: PASRequestBundle
Title: "Homecare Authorization Bundle Example"
Description: "An example of a Claim bundle requesting prior authorization of a home healthcare service."
* identifier.system = "http://example.org/SUBMITTER_TRANSACTION_IDENTIFIER"
* identifier.value = "B56789"
* type = #collection
* timestamp = 2005-05-02T14:30:00+05:00
* entry[Claim].fullUrl = "http://example.org/fhir/Claim/HomecareAuthorizationExample"
* entry[Claim].resource = HomecareAuthorizationExample
* entry[1].fullUrl = "http://example.org/fhir/Organization/UMOExample"
* entry[1].resource = UMOExample
* entry[2].fullUrl = "http://example.org/fhir/Organization/InsurerExample"
* entry[2].resource = InsurerExample
* entry[3].fullUrl = "http://example.org/fhir/Coverage/InsuranceExample"
* entry[3].resource = InsuranceExample
* entry[4].fullUrl = "http://example.org/fhir/Patient/SubscriberExample"
* entry[4].resource = SubscriberExample

Instance: HomecareAuthorizationExample
InstanceOf: PASClaim
Title: "Homecare Authorization Example"
Description: "An example of a Claim resource requesting prior authorization of a home healthcare service."
* identifier.system = "http://example.org/PATIENT_EVENT_TRACE_NUMBER"
* identifier.value = "111099"
* identifier.assigner.identifier.system = "http://example.org/USER_ASSIGNED"
* identifier.assigner.identifier.value = "9012345678"
* status = #active
* type = http://terminology.hl7.org/CodeSystem/claim-type#professional
* use = #preauthorization
* patient = Reference(SubscriberExample)
* created = 2019-07-20T11:01:00+05:00
* insurer = Reference(InsurerExample)
* provider = Reference(UMOExample)
* priority = http://terminology.hl7.org/CodeSystem/processpriority#normal
* insurance.sequence = 1
* insurance.focal = true
* insurance.coverage = Reference(InsuranceExample)
* item.extension[requestType].valueCodeableConcept = http://codesystem.x12.org/005010/1525#HS "Health Services Review"
* item.extension[certificationType].valueCodeableConcept = http://codesystem.x12.org/005010/1322#I "Initial"
* item.sequence = 1
* item.productOrService = http://www.ama-assn.org/go/cpt#G0154
* item[1].sequence = 2
* item[1].productOrService = http://www.ama-assn.org/go/cpt#B4184
* item[1].extension[requestType].valueCodeableConcept = http://codesystem.x12.org/005010/1525#HS "Health Services Review"
* item[1].extension[certificationType].valueCodeableConcept = http://codesystem.x12.org/005010/1322#I "Initial"

Instance: HomecareAuthorizationUpdateBundleExample
InstanceOf: PASRequestBundle
Title: "Homecare Authorization Update Bundle Example"
Description: "An example of a Claim bundle updating a previously sent prior authorization request."
* identifier.system = "http://example.org/SUBMITTER_TRANSACTION_IDENTIFIER"
* identifier.value = "A12345"
* type = #collection
* timestamp = 2005-05-02T11:01:00+05:00
* entry[Claim].fullUrl = "http://example.org/fhir/Claim/HomecareAuthorizationUpdateExample"
* entry[Claim].resource = HomecareAuthorizationUpdateExample
* entry[1].fullUrl = "http://example.org/fhir/Organization/UMOExample"
* entry[1].resource = UMOExample
* entry[2].fullUrl = "http://example.org/fhir/Organization/InsurerExample"
* entry[2].resource = InsurerExample
* entry[3].fullUrl = "http://example.org/fhir/Coverage/InsuranceExample"
* entry[3].resource = InsuranceExample
* entry[4].fullUrl = "http://example.org/fhir/Patient/SubscriberExample"
* entry[4].resource = SubscriberExample

Instance: HomecareAuthorizationUpdateExample
InstanceOf: PASClaimUpdate
Title: "Homecare Authorizaion Update Example"
Description: "An example of a Claim resource updating a prior authorization."
* identifier.system = "http://example.org/PATIENT_EVENT_TRACE_NUMBER"
* identifier.value = "111099"
* identifier.assigner.identifier.system = "http://example.org/USER_ASSIGNED"
* identifier.assigner.identifier.value = "9012345678"
* status = #active
* type = http://terminology.hl7.org/CodeSystem/claim-type#professional
* use = #preauthorization
* patient = Reference(SubscriberExample)
* created = 2019-07-20T11:01:00+05:00
* insurer = Reference(InsurerExample)
* provider = Reference(UMOExample)
* priority = http://terminology.hl7.org/CodeSystem/processpriority#normal
* insurance.sequence = 1
* insurance.focal = true
* insurance.coverage = Reference(InsuranceExample)
* item.extension[requestType].valueCodeableConcept = http://codesystem.x12.org/005010/1525#HS "Health Services Review"
* item.extension[certificationType].valueCodeableConcept = http://codesystem.x12.org/005010/1322#I "Initial"
* item.sequence = 1
* item.productOrService = http://www.ama-assn.org/go/cpt#G0154
* item[1].sequence = 2
* item[1].modifierExtension[infoCancelledFlag].valueBoolean = true
* item[1].productOrService = http://www.ama-assn.org/go/cpt#B4184
* item[1].extension[requestType].valueCodeableConcept = http://codesystem.x12.org/005010/1525#HS "Health Services Review"
* item[1].extension[certificationType].valueCodeableConcept = http://codesystem.x12.org/005010/1322#3 "Cancel"
* item[2].sequence = 3
* item[2].extension[infoChanged].valueCode = #added
* item[2].productOrService = http://www.ama-assn.org/go/cpt#B4185
* item[2].extension[requestType].valueCodeableConcept = http://codesystem.x12.org/005010/1525#HS "Health Services Review"
* item[2].extension[certificationType].valueCodeableConcept = http://codesystem.x12.org/005010/1322#I "Initial"

Instance: HomecareAuthorizationDifferentialBundleExample
InstanceOf: PASRequestBundle
Title: "Homecare Authorization Differential Update Bundle Example"
Description: "An example of a Claim bundle changing elements of a previously sent prior authorization request."
* identifier.system = "http://example.org/SUBMITTER_TRANSACTION_IDENTIFIER"
* identifier.value = "A12345"
* type = #collection
* timestamp = 2005-05-02T11:01:00+05:00
* entry[Claim].fullUrl = "http://example.org/fhir/Claim/HomecareAuthorizationDifferentialExample"
* entry[Claim].resource = HomecareAuthorizationDifferentialExample
* entry[1].fullUrl = "http://example.org/fhir/Organization/UMOExample"
* entry[1].resource = UMOExample
* entry[2].fullUrl = "http://example.org/fhir/Organization/InsurerExample"
* entry[2].resource = InsurerExample
* entry[3].fullUrl = "http://example.org/fhir/Coverage/InsuranceExample"
* entry[3].resource = InsuranceExample
* entry[4].fullUrl = "http://example.org/fhir/Patient/SubscriberExample"
* entry[4].resource = SubscriberExample

Instance: HomecareAuthorizationDifferentialExample
InstanceOf: PASClaimUpdate
Title: "Homecare Authorization Differential Update Example"
Description: "An example of a Claim resource updating a prior authorization."
* meta.security = http://terminology.hl7.org/CodeSystem/v3-ObservationValue#SUBSETTED
* identifier.system = "http://example.org/PATIENT_EVENT_TRACE_NUMBER"
* identifier.value = "111099"
* identifier.assigner.identifier.system = "http://example.org/USER_ASSIGNED"
* identifier.assigner.identifier.value = "9012345678"
* status = #active
* type = http://terminology.hl7.org/CodeSystem/claim-type#professional
* use = #preauthorization
* patient = Reference(SubscriberExample)
* created = 2019-07-20T11:01:00+05:00
* insurer = Reference(InsurerExample)
* provider = Reference(UMOExample)
* priority = http://terminology.hl7.org/CodeSystem/processpriority#normal
* insurance.sequence = 1
* insurance.focal = true
* insurance.coverage = Reference(InsuranceExample)
* item[0].sequence = 2
* item[0].modifierExtension[infoCancelledFlag].valueBoolean = true
* item[0].productOrService = http://www.ama-assn.org/go/cpt#B4184
* item[0].extension[requestType].valueCodeableConcept = http://codesystem.x12.org/005010/1525#HS "Health Services Review"
* item[0].extension[certificationType].valueCodeableConcept = http://codesystem.x12.org/005010/1322#I "Initial"
* item[1].sequence = 3
* item[1].extension[infoChanged].valueCode = #added
* item[1].productOrService = http://www.ama-assn.org/go/cpt#B4185
* item[1].extension[requestType].valueCodeableConcept = http://codesystem.x12.org/005010/1525#HS "Health Services Review"
* item[1].extension[certificationType].valueCodeableConcept = http://codesystem.x12.org/005010/1322#I "Initial"

Instance: MedicalServicesAuthorizationBundleExample
InstanceOf: PASRequestBundle
Title: "Medical Services Authorization Bundle Example"
Description: "An example of a Claim bundle requesting Medical Services Reservation."
* identifier.system = "http://example.org/SUBMITTER_TRANSACTION_IDENTIFIER"
* identifier.value = "5269367"
* type = #collection
* timestamp = 2005-05-02T11:01:00+05:00
* entry[Claim].fullUrl = "http://example.org/fhir/Claim/MedicalServicesAuthorizationExample"
* entry[Claim].resource = MedicalServicesAuthorizationExample
* entry[1].fullUrl = "http://example.org/fhir/Organization/UMOExample"
* entry[1].resource = UMOExample
* entry[2].fullUrl = "http://example.org/fhir/Organization/InsurerExample"
* entry[2].resource = InsurerExample
* entry[3].fullUrl = "http://example.org/fhir/Coverage/InsuranceExample"
* entry[3].resource = InsuranceExample
* entry[4].fullUrl = "http://example.org/fhir/Patient/SubscriberExample"
* entry[4].resource = SubscriberExample

Instance: MedicalServicesAuthorizationExample
InstanceOf: PASClaim
Title: "Medical Services Authorization Example"
Description: "An example of a Claim resource requesting prior authorization of Medical Services Reservation."
* identifier.system = "http://example.org/PATIENT_EVENT_TRACE_NUMBER"
* identifier.value = "111099"
* identifier.assigner.identifier.system = "http://example.org/USER_ASSIGNED"
* identifier.assigner.identifier.value = "9012345678"
* status = #active
* type = http://terminology.hl7.org/CodeSystem/claim-type#professional
* use = #preauthorization
* patient = Reference(SubscriberExample)
* created = 2005-05-02T11:01:00+05:00
* insurer = Reference(InsurerExample)
* provider = Reference(UMOExample)
* priority = http://terminology.hl7.org/CodeSystem/processpriority#normal
* insurance.sequence = 1
* insurance.focal = true
* insurance.coverage = Reference(InsuranceExample)
* item.extension[requestType].valueCodeableConcept = http://codesystem.x12.org/005010/1525#IN "Initial Medical Services Reservation"
* item.extension[certificationType].valueCodeableConcept = http://codesystem.x12.org/005010/1322#I "Initial"
* item.sequence = 1
* item.productOrService = http://www.ama-assn.org/go/cpt#99212 "Established Office Visit"
* item.servicedDate = "2005-05-10"
* item.locationCodeableConcept = https://www.cms.gov/Medicare/Coding/place-of-service-codes/Place_of_Service_Code_Set#11

Instance: UMOExample
InstanceOf: PASRequestor
Title: "Submit Claim Requestor Example"
Description: "A sample organization that is requesting a prior authorization."
* active = true
* type = https://codesystem.x12.org/005010/98#X3
* name = "DR. JOE SMITH CORPORATION"
* identifier.system = "http://hl7.org/fhir/sid/us-npi"
* identifier.value = "8189991234"
* address.line = "111 1ST STREET"
* address.city = "SAN DIEGO"
* address.state = "CA"
* address.country = "US"
* address.postalCode = "92101"

Instance: InsurerExample
InstanceOf: PASInsurer
Title: "Submit Claim Insurer Example"
Description: "A sample payor organization."
* active = true
* type = https://codesystem.x12.org/005010/98#PR
* name = "MARYLAND CAPITAL INSURANCE COMPANY"
* identifier.system = "http://hl7.org/fhir/sid/us-npi"
* identifier.value = "789312"

Instance: ReferralPractitionerExample
InstanceOf: PASPractitioner
Title: "Submit Claim Referral Practitioner Example"
Description: "A sample practitioner who is being referred to."
* identifier.system = "http://hl7.org/fhir/sid/us-npi"
* identifier.value = "987654321"
* name.family = "WATSON"
* name.given = "SUSAN"
* telecom.system = #phone
* telecom.value = "4029993456"

Instance: InsuranceExample
InstanceOf: PASCoverage
Title: "Submit Claim Insurance Example"
Description: "Sample insurance for a prior authorization."
* status = #active
* beneficiary = Reference(SubscriberExample)
* payor = Reference(InsurerExample)

Instance: SubscriberExample
InstanceOf: PASSubscriber
Title: "Submit Claim Subscriber Example"
Description: "Sample patient who is a subscriber of an insurance plan."
* identifier.system = "http://example.org/MIN"
* identifier.value = "12345678901"
* name.family = "SMITH"
* name.given = "JOE"
* gender = #male
* extension[militaryStatus].valueCodeableConcept = https://codesystem.x12.org/005010/584#RU

Instance: ReferralRequestExample
InstanceOf: PASServiceRequest
Title: "Submit Claim Referral Request Example"
Description: "A sample referral request that is the subject of a prior authorization."
* status = #active
* intent = #order
* subject = Reference(SubscriberExample)
* code = http://codesystem.x12.org/005010/1365#3 "Consultation"
* quantityQuantity = 1 '{visit}'
