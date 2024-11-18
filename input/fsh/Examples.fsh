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
* entry[6].fullUrl = "http://example.org/fhir/PractitionerRole/ReferralPractitionerRoleExample"
* entry[6].resource = ReferralPractitionerRoleExample
* entry[7].fullUrl = "http://example.org/fhir/Practitioner/ReferralPractitionerExample"
* entry[7].resource = ReferralPractitionerExample
* entry[8].fullUrl = "http://example.org/fhir/Location/ReferralLocationExample"
* entry[8].resource = ReferralLocationExample

Instance: ReferralAuthorizationExample
InstanceOf: PASClaim
Title: "Referral Authorization Example"
Description: "An example of a Claim resource requesting prior authorization of a referral."
* extension[levelOfServiceType].valueCodeableConcept = https://codesystem.x12.org/005010/1338#U "Urgent"
* identifier.system = "http://example.org/PATIENT_EVENT_TRACE_NUMBER"
* identifier.value = "111099"
* identifier.assigner.identifier.system = "http://example.org/USER_ASSIGNED"
* identifier.assigner.identifier.value = "9012345678"
* identifier.extension[jurisdiction].valueCodeableConcept = https://www.usps.com/#MA
* identifier.extension[subDepartment].valueString = "223412"
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
* diagnosis.extension[recordedDate].valueDate = "2021-05-10"
* insurance.sequence = 1
* insurance.focal = true
* insurance.coverage = Reference(InsuranceExample)
* item.extension[itemTraceNumber].valueIdentifier.system = "http://example.org/ITEM_TRACE_NUMBER"
* item.extension[itemTraceNumber].valueIdentifier.value = "1122334"
* item.extension[authorizationNumber].valueString = "1122445"
* item.extension[administrationReferenceNumber].valueString = "9988311"
* item.extension[requestType].valueCodeableConcept = https://codesystem.x12.org/005010/1525#SC "Specialty Care Review"
* item.extension[certificationType].valueCodeableConcept = https://codesystem.x12.org/005010/1322#I "Initial"
* item.extension[requestedService].valueReference = Reference(ReferralRequestExample)
* item.extension[epsdtIndicator].valueBoolean = false
* item.extension[nursingHomeResidentialStatus].valueCodeableConcept = https://codesystem.x12.org/005010/1345#2 "Newly Admitted"
* item.extension[nursingHomeLevelOfCare].valueCodeableConcept = https://codesystem.x12.org/005010/1337#2 "Intermediate Care Facility (ICF)"
* item.extension[revenueUnitRateLimit].valueDecimal = 100.00
* item.sequence = 1
* item.careTeamSequence = 1
* item.diagnosisSequence = 1
* item.category = https://codesystem.x12.org/005010/1365#3 "Consultation"
* item.productOrService = https://codesystem.x12.org/005010/1365#3 "Consultation"
* item.locationCodeableConcept = https://www.cms.gov/Medicare/Coding/place-of-service-codes/Place_of_Service_Code_Set#11
* careTeam.sequence = 1
* careTeam.extension[careTeamClaimScope].valueBoolean = true
* careTeam.provider = Reference(ReferralPractitionerRoleExample)

Instance: ReferralAuthorizationResponseBundleExample
InstanceOf: PASResponseBundle
Title: "Referral Authorization Response Bundle Example"
Description: "An example of a ClaimResponse bundle approving the authorization of a referral."
* type = #collection
* timestamp = 2005-05-02T11:02:00+05:00
* entry[ClaimResponse].fullUrl = "http://example.org/fhir/ClaimResponse/PractitionerRequestorResponseExample"
* entry[ClaimResponse].resource = PractitionerRequestorResponseExample
* entry[1].fullUrl = "http://example.org/fhir/Organization/UMOExample"
* entry[1].resource = UMOExample
* entry[2].fullUrl = "http://example.org/fhir/Organization/InsurerExample"
* entry[2].resource = InsurerExample
* entry[3].fullUrl = "http://example.org/fhir/Patient/SubscriberExample"
* entry[3].resource = SubscriberExample
* entry[4].fullUrl = "http://example.org/fhir/Practitioner/ReferralPractitionerExample"
* entry[4].resource = ReferralPractitionerExample

Instance: ReferralPendingAuthorizationResponseBundleExample
InstanceOf: PASResponseBundle
Title: "Referral Pending Authorization Response Bundle Example"
Description: "An example of a ClaimResponse bundle with a pending authorization of a referral."
* type = #collection
* timestamp = 2005-05-02T11:02:00+05:00
* entry[ClaimResponse].fullUrl = "http://example.org/fhir/ClaimResponse/PractitionerRequestorPendingResponseExample"
* entry[ClaimResponse].resource = PractitionerRequestorPendingResponseExample
* entry[1].fullUrl = "http://example.org/fhir/Organization/UMOExample"
* entry[1].resource = UMOExample
* entry[2].fullUrl = "http://example.org/fhir/Organization/InsurerExample"
* entry[2].resource = InsurerExample
* entry[3].fullUrl = "http://example.org/fhir/Patient/SubscriberExample"
* entry[3].resource = SubscriberExample
* entry[4].fullUrl = "http://example.org/fhir/Practitioner/ReferralPractitionerExample"
* entry[4].resource = ReferralPractitionerExample

Instance: RejectionResponseBundleExample
InstanceOf: PASResponseBundle
Title: "Rejection Response Bundle Example"
Description: "An example of a ClaimResponse bundle showing the rejection of a request."
* type = #collection
* timestamp = 2005-05-02T11:02:00+05:00
* entry[ClaimResponse].fullUrl = "http://example.org/fhir/ClaimResponse/RejectionResponseExample"
* entry[ClaimResponse].resource = RejectionResponseExample
* entry[1].fullUrl = "http://example.org/fhir/Organization/UMOExample"
* entry[1].resource = UMOExample
* entry[2].fullUrl = "http://example.org/fhir/Organization/InsurerExample"
* entry[2].resource = InsurerExample
* entry[3].fullUrl = "http://example.org/fhir/Patient/SubscriberExample"
* entry[3].resource = SubscriberExample

Instance: ErrorResponseBundleExample
InstanceOf: PASResponseBundle
Title: "Error Response Bundle Example"
Description: "An example of a ClaimResponse bundle with errors."
* type = #collection
* timestamp = 2005-05-02T11:02:00+05:00
* entry[ClaimResponse].fullUrl = "http://example.org/fhir/ClaimResponse/ErrorResponseExample"
* entry[ClaimResponse].resource = ErrorResponseExample
* entry[1].fullUrl = "http://example.org/fhir/Organization/UMOExample"
* entry[1].resource = UMOExample
* entry[2].fullUrl = "http://example.org/fhir/Organization/InsurerExample"
* entry[2].resource = InsurerExample
* entry[3].fullUrl = "http://example.org/fhir/Patient/SubscriberExample"
* entry[3].resource = SubscriberExample
* entry[4].fullUrl = "http://example.org/fhir/Claim/ReferralAuthorizationExample"
* entry[4].resource = ReferralAuthorizationExample

Instance: ErrorResponseExample
InstanceOf: PASClaimResponse
Title: "Error Response Example"
Description: "An example of a ClaimResponse with errors."
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
* request = Reference(ReferralAuthorizationExample)
* outcome = #error
* error[0].code = https://codesystem.x12.org/005010/901#04
* error[1].code = https://codesystem.x12.org/005010/901#T4
* error[1].extension[errorElement].valueString = "2010A-NM103"
* error[1].extension[errorPath].valueString = "Bundle.entry[1].Organization.name"
* error[1].extension[followupAction].valueCodeableConcept = https://codesystem.x12.org/005010/889#C

Instance: RejectionResponseExample
InstanceOf: PASClaimResponse
Title: "Rejection Response Example"
Description: "An example of a ClaimResponse that is rejected."
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
* request = Reference(HomecareAuthorizationUpdateExample)
* outcome = #error
* error[+].code = https://codesystem.x12.org/005010/901#33
* error[=].extension[errorElement].valueString = "2000E"
* error[=].extension[followupAction].valueCodeableConcept = https://codesystem.x12.org/005010/889#N
* processNote[+].text = "Updates are not allowed. A new auth request must be submitted."
* processNote[=].number = 1

Instance: PractitionerRequestorResponseExample
InstanceOf: PASClaimResponse
Title: "Authorization Response with Practitioner Requestor Example"
Description: "An example of a ClaimResponse where the requestor is a Practitioner."
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
* requestor = Reference(ReferralPractitionerRoleExample)
* request = Reference(ReferralAuthorizationExample)
* outcome = #complete
* item.itemSequence = 1
* item.extension[requestedServiceDate].valuePeriod.start = 2005-05-02
* item.extension[requestedServiceDate].valuePeriod.end = 2005-06-02
* item.extension[preAuthIssueDate].valueDate = 2005-05-02
* item.extension[preAuthPeriod].valuePeriod.start = 2005-05-02
* item.extension[preAuthPeriod].valuePeriod.end = 2005-06-02
* item.extension[authorizedProvider].extension[provider].valueReference = Reference(ReferralPractitionerExample)
* item.extension[authorizedItemDetail].extension[productOrServiceCode].valueCodeableConcept = https://codesystem.x12.org/005010/1365#3 "Consultation"
* item.extension[authorizedItemDetail].extension[unitPrice].valueMoney.value = 100
* item.extension[authorizedItemDetail].extension[unitPrice].valueMoney.currency = #USD
* item.extension[authorizedItemDetail].extension[quantity].valueQuantity.value = 1
* item.adjudication.category = http://terminology.hl7.org/CodeSystem/adjudication#submitted
* item.adjudication.extension[reviewAction].extension[number].valueString = "AUTH0001"
* item.adjudication.extension[reviewAction].extension[code].valueCodeableConcept = https://codesystem.x12.org/005010/306#A1 "Certified in total"

Instance: PractitionerRequestorPendingResponseExample
InstanceOf: PASClaimResponse
Title: "Pending Authorization Response with Practitioner Requestor Example"
Description: "An example of a ClaimResponse where the requestor is a Practitioner and the response is pended."
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
* requestor = Reference(ReferralPractitionerRoleExample)
* request = Reference(ReferralAuthorizationExample)
* outcome = #complete
* item.itemSequence = 1
* item.extension[administrationReferenceNumber].valueString = "PEND0001"
* item.adjudication.category = http://terminology.hl7.org/CodeSystem/adjudication#submitted
* item.adjudication.extension[reviewAction].extension[code].valueCodeableConcept = https://codesystem.x12.org/005010/306#A4 "Pending"

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
* extension[homeHealthCareInformation].extension[prognosis].valueCodeableConcept = https://codesystem.x12.org/005010/923#1
* extension[homeHealthCareInformation].extension[date].valueDate = "2005-05-02"
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
* item.extension[requestType].valueCodeableConcept = https://codesystem.x12.org/005010/1525#HS "Health Services Review"
* item.extension[certificationType].valueCodeableConcept = https://codesystem.x12.org/005010/1322#I "Initial"
* item.sequence = 1
* item.category = https://codesystem.x12.org/005010/1365#42 "Home Health Care"
* item.productOrService = http://www.cms.gov/Medicare/Coding/HCPCSReleaseCodeSets#G0154
* item.locationCodeableConcept = https://www.cms.gov/Medicare/Coding/place-of-service-codes/Place_of_Service_Code_Set#11
* item[1].sequence = 2
* item[1].category = https://codesystem.x12.org/005010/1365#42 "Home Health Care"
* item[1].productOrService = http://www.cms.gov/Medicare/Coding/HCPCSReleaseCodeSets#B4184
* item[1].extension[requestType].valueCodeableConcept = https://codesystem.x12.org/005010/1525#HS "Health Services Review"
* item[1].extension[certificationType].valueCodeableConcept = https://codesystem.x12.org/005010/1322#I "Initial"
* item[1].locationCodeableConcept = https://www.cms.gov/Medicare/Coding/place-of-service-codes/Place_of_Service_Code_Set#11

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
* entry[5].fullUrl = "http://example.org/fhir/Claim/HomecareAuthorizationExample"
* entry[5].resource = HomecareAuthorizationExample

Instance: HomecareAuthorizationUpdateExample
InstanceOf: PASClaimUpdate
Title: "Homecare Authorization Update Example"
Description: "An example of a Claim resource updating a prior authorization."
* identifier.system = "http://example.org/PATIENT_EVENT_TRACE_NUMBER"
* identifier.value = "111099-UPDATE"
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
* related.claim = Reference(HomecareAuthorizationExample)
* insurance.sequence = 1
* insurance.focal = true
* insurance.coverage = Reference(InsuranceExample)
* item.extension[requestType].valueCodeableConcept = https://codesystem.x12.org/005010/1525#HS "Health Services Review"
* item.extension[certificationType].valueCodeableConcept = https://codesystem.x12.org/005010/1322#I "Initial"
* item.sequence = 1
* item.category = https://codesystem.x12.org/005010/1365#42 "Home Health Care"
* item.productOrService = http://www.cms.gov/Medicare/Coding/HCPCSReleaseCodeSets#G0154
* item.locationCodeableConcept = https://www.cms.gov/Medicare/Coding/place-of-service-codes/Place_of_Service_Code_Set#11
* item[1].sequence = 2
* item[1].modifierExtension[infoCancelledFlag].valueBoolean = true
* item[1].category = https://codesystem.x12.org/005010/1365#42 "Home Health Care"
* item[1].productOrService = http://www.cms.gov/Medicare/Coding/HCPCSReleaseCodeSets#B4184
* item[1].extension[requestType].valueCodeableConcept = https://codesystem.x12.org/005010/1525#HS "Health Services Review"
* item[1].extension[certificationType].valueCodeableConcept = https://codesystem.x12.org/005010/1322#3 "Cancel"
* item[1].locationCodeableConcept = https://www.cms.gov/Medicare/Coding/place-of-service-codes/Place_of_Service_Code_Set#11
* item[2].sequence = 3
* item[2].extension[infoChanged].valueCode = #added
* item[2].category = https://codesystem.x12.org/005010/1365#42 "Home Health Care"
* item[2].productOrService = http://www.cms.gov/Medicare/Coding/HCPCSReleaseCodeSets#B4185
* item[2].extension[requestType].valueCodeableConcept = https://codesystem.x12.org/005010/1525#HS "Health Services Review"
* item[2].extension[certificationType].valueCodeableConcept = https://codesystem.x12.org/005010/1322#I "Initial"
* item[2].locationCodeableConcept = https://www.cms.gov/Medicare/Coding/place-of-service-codes/Place_of_Service_Code_Set#11

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
* entry[5].fullUrl = "http://example.org/fhir/Claim/HomecareAuthorizationExample"
* entry[5].resource = HomecareAuthorizationExample

Instance: HomecareAuthorizationDifferentialExample
InstanceOf: PASClaimUpdate
Title: "Homecare Authorization Differential Update Example"
Description: "An example of a Claim resource updating a prior authorization."
* meta.security = http://terminology.hl7.org/CodeSystem/v3-ObservationValue#SUBSETTED
* identifier.system = "http://example.org/PATIENT_EVENT_TRACE_NUMBER"
* identifier.value = "111099-UPDATE-DIFF"
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
* related.claim = Reference(HomecareAuthorizationExample)
* insurance.sequence = 1
* insurance.focal = true
* insurance.coverage = Reference(InsuranceExample)
* item[0].sequence = 2
* item[0].modifierExtension[infoCancelledFlag].valueBoolean = true
* item[0].category = https://codesystem.x12.org/005010/1365#42 "Home Health Care"
* item[0].productOrService = http://www.cms.gov/Medicare/Coding/HCPCSReleaseCodeSets#B4184
* item[0].extension[requestType].valueCodeableConcept = https://codesystem.x12.org/005010/1525#HS "Health Services Review"
* item[0].extension[certificationType].valueCodeableConcept = https://codesystem.x12.org/005010/1322#I "Initial"
* item[0].locationCodeableConcept = https://www.cms.gov/Medicare/Coding/place-of-service-codes/Place_of_Service_Code_Set#11
* item[1].sequence = 3
* item[1].extension[infoChanged].valueCode = #added
* item[1].category = https://codesystem.x12.org/005010/1365#42 "Home Health Care"
* item[1].productOrService = http://www.cms.gov/Medicare/Coding/HCPCSReleaseCodeSets#B4185
* item[1].extension[requestType].valueCodeableConcept = https://codesystem.x12.org/005010/1525#HS "Health Services Review"
* item[1].extension[certificationType].valueCodeableConcept = https://codesystem.x12.org/005010/1322#I "Initial"
* item[1].locationCodeableConcept = https://www.cms.gov/Medicare/Coding/place-of-service-codes/Place_of_Service_Code_Set#11

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
* item.extension[requestType].valueCodeableConcept = https://codesystem.x12.org/005010/1525#IN "Initial Medical Services Reservation"
* item.extension[certificationType].valueCodeableConcept = https://codesystem.x12.org/005010/1322#I "Initial"
* item.extension[authorizationNumber].valueString = "1122344"
* item.extension[administrationReferenceNumber].valueString = "33441122"
* item.sequence = 1
* item.category = https://codesystem.x12.org/005010/1365#1 "Medical Care"
* item.productOrService = http://www.cms.gov/Medicare/Coding/HCPCSReleaseCodeSets#99212 "Established Office Visit"
* item.servicedDate = "2005-05-10"
* item.locationCodeableConcept = https://www.cms.gov/Medicare/Coding/place-of-service-codes/Place_of_Service_Code_Set#11

Instance: PASClaimInquiryBundleExample
InstanceOf: PASInquiryRequestBundle
Title: "PAS Inquiry Request Bundle Example"
Description: "An example of a Claim bundle inquiring about prior authorizations."
* identifier.system = "http://example.org/SUBMITTER_TRANSACTION_IDENTIFIER"
* identifier.value = "5269367"
* type = #collection
* timestamp = 2005-05-02T11:01:00+05:00
* entry[Claim].fullUrl = "http://example.org/fhir/Claim/PASClaimInquiryExample"
* entry[Claim].resource = PASClaimInquiryExample
* entry[1].fullUrl = "http://example.org/fhir/Organization/UMOExample"
* entry[1].resource = UMOExample
* entry[2].fullUrl = "http://example.org/fhir/Organization/InsurerExample"
* entry[2].resource = InsurerExample
* entry[3].fullUrl = "http://example.org/fhir/Coverage/InsuranceExample"
* entry[3].resource = InsuranceExample
* entry[4].fullUrl = "http://example.org/fhir/Patient/SubscriberExample"
* entry[4].resource = SubscriberExample

Instance: PASClaimInquiryExample
InstanceOf: PASClaimInquiry
Title: "PAS Claim Inquiry Example"
Description: "An example of a Claim resource used to search for prior authorizations that match the example."
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
* item.extension[requestType].valueCodeableConcept = https://codesystem.x12.org/005010/1525#HS "Health Services Review"
* item.extension[certificationType].valueCodeableConcept = https://codesystem.x12.org/005010/1322#I "Initial"
* item.sequence = 1
* item.productOrService = http://www.cms.gov/Medicare/Coding/HCPCSReleaseCodeSets#G0154
* item[1].sequence = 2
* item[1].productOrService = http://www.cms.gov/Medicare/Coding/HCPCSReleaseCodeSets#B4184
* item[1].extension[requestType].valueCodeableConcept = https://codesystem.x12.org/005010/1525#HS "Health Services Review"
* item[1].extension[certificationType].valueCodeableConcept = https://codesystem.x12.org/005010/1322#I "Initial"
* item[1].extension[certIssueDate].valueDate = "2019-07-01"
* item[1].extension[certEffectiveDate].valueDate = "2019-07-01"
* item[1].extension[certExpirationDate].valueDate = "2019-07-31"
* item[1].extension[reviewActionCode].valueCodeableConcept = https://codesystem.x12.org/005010/306#A1 "Certified in total"
* item[1].extension[productOrServiceCodeEnd].valueCodeableConcept = http://www.cms.gov/Medicare/Coding/HCPCSReleaseCodeSets#B4190

Instance: PASClaimInquiryResponseBundleExample
InstanceOf: PASInquiryResponseBundle
Title: "PAS Inquiry Response Bundle Example"
Description: "An example of a ClaimResponse bundle returning a response to a claims inquiry."
* identifier.system = "http://example.org/SUBMITTER_TRANSACTION_IDENTIFIER"
* identifier.value = "5269367"
* type = #collection
* timestamp = 2005-05-02T11:01:00+05:00
* entry[ClaimResponse].fullUrl = "http://example.org/fhir/ClaimResponse/PASClaimInquiryResponseExample"
* entry[ClaimResponse].resource = PASClaimInquiryResponseExample
* entry[1].fullUrl = "http://example.org/fhir/Organization/UMOExample"
* entry[1].resource = UMOExample
* entry[2].fullUrl = "http://example.org/fhir/Organization/InsurerExample"
* entry[2].resource = InsurerExample
* entry[3].fullUrl = "http://example.org/fhir/Coverage/InsuranceExample"
* entry[3].resource = InsuranceExample
* entry[4].fullUrl = "http://example.org/fhir/Patient/SubscriberExample"
* entry[4].resource = SubscriberExample
* entry[5].fullUrl = "http://example.org/fhir/Claim/ReferralAuthorizationExample"
* entry[5].resource = ReferralAuthorizationExample

Instance: PASClaimInquiryResponseExample
InstanceOf: PASClaimInquiryResponse
Title: "PAS Claim Inquiry ResponseExample"
Description: "An example of a ClaimResponse resource that is a response to a claims inquiry."
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
* insurance.sequence = 1
* insurance.focal = true
* insurance.coverage = Reference(InsuranceExample)
* request = Reference(ReferralAuthorizationExample)
* outcome = #complete
* item.itemSequence = 1
* item.extension[requestedServiceDate].valuePeriod.start = 2005-05-02
* item.extension[requestedServiceDate].valuePeriod.end = 2005-06-02
* item.adjudication.category = http://terminology.hl7.org/CodeSystem/adjudication#submitted
* item.adjudication.extension[reviewAction].extension[number].valueString = "AUTH0001"
* item.adjudication.extension[reviewAction].extension[code].valueCodeableConcept = https://codesystem.x12.org/005010/306#A1 "Certified in total"

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
* identifier.value = "1234567893"

Instance: ReferralPractitionerRoleExample
InstanceOf: PASPractitionerRole
Title: "Submit Claim Referral Practitioner Role Example"
Description: "A sample practitioner role instance."
* practitioner = Reference(ReferralPractitionerExample)
* location = Reference(ReferralLocationExample)

Instance: ReferralLocationExample
InstanceOf: PASLocation
Title: "Submit Claim Referral Location Example"
Description: "A sample location."
* name = "REFERRAL CLINIC"
* address.line = "111 1ST STREET"
* address.city = "SAN DIEGO"
* address.state = "CA"
* address.country = "US"
* address.postalCode = "92101"

Instance: ReferralPractitionerExample
InstanceOf: PASPractitioner
Title: "Submit Claim Referral Practitioner Example"
Description: "A sample practitioner who is being referred to."
* identifier.system = "http://hl7.org/fhir/sid/us-npi"
* identifier.value = "1234567893"
* name.family = "WATSON"
* name.given = "SUSAN"
* telecom.system = #phone
* telecom.value = "4029993456"

Instance: InsuranceExample
InstanceOf: PASCoverage
Title: "Submit Claim Insurance Example"
Description: "Sample insurance for a prior authorization."
* status = #active
* subscriberId = "1122334455"
* beneficiary = Reference(SubscriberExample)
* relationship.coding[+] = http://terminology.hl7.org/CodeSystem/subscriber-relationship#self
* relationship.coding[+] = https://codesystem.x12.org/005010/1069#18
* payor = Reference(InsurerExample)

Instance: SubscriberExample
InstanceOf: PASSubscriber
Title: "Submit Claim Subscriber Example"
Description: "Sample patient who is a subscriber of an insurance plan."
* identifier[memberIdentifier].system = "http://example.org/MIN"
* identifier[memberIdentifier].value = "12345678901"
* name.family = "SMITH"
* name.given = "JOE"
* gender = #male
* extension[militaryStatus].valueCodeableConcept = https://codesystem.x12.org/005010/584#RU

Instance: BeneficiaryExample
InstanceOf: PASBeneficiary
Title: "Submit Claim Beneficiary Example"
Description: "Sample patient who is a beneficiary of an insurance plan."
* identifier[memberIdentifier].system = "http://example.org/MIN"
* identifier[memberIdentifier].value = "12345678902"
* name.family = "SMITH"
* name.given = "JESSE"
* gender = #female
* birthDate = 1947-01-18
* address.country = "US"
* multipleBirthInteger = 1

Instance: ReferralRequestExample
InstanceOf: PASServiceRequest
Title: "Submit Claim Referral Request Example"
Description: "A sample referral request that is the subject of a prior authorization."
* status = #active
* intent = #order
* subject = Reference(SubscriberExample)
* code = https://codesystem.x12.org/005010/1365#3 "Consultation"
* quantityQuantity = 1 '1' "visit"

Instance: CommunicationRequestExample
InstanceOf: PASCommunicationRequest
Title: "Communication Request Example"
Description: "A sample communication request asking for more information about a specific diagnosis."
* status = #active
* category = https://codesystem.x12.org/005010/755#15 "Justification for Admissions"
* payload.extension[serviceLineNumber].valuePositiveInt = 1
* payload.extension[communicatedDiagnosis].valueCodeableConcept = http://hl7.org/fhir/sid/icd-10-cm#G89.4
* payload.extension[contentModifier].valueCodeableConcept = http://loinc.org#18804-5
* payload.contentString = "18657-7"

Instance: DeviceRequestExample
InstanceOf: PASDeviceRequest
Title: "Device Request Example"
Description: "A sample device request for a wheelchair."
* intent = #order
* status = #active
* codeCodeableConcept = http://www.cms.gov/Medicare/Coding/HCPCSReleaseCodeSets#E1223
* subject = Reference(BeneficiaryExample)
* authoredOn = 2005-06-02
* requester = Reference(ReferralPractitionerExample)

Instance: NutritionOrderExample
InstanceOf: PASNutritionOrder
Title: "Nutrition Order Example"
Description: "A sample nutrition order."
* intent = #order
* patient = Reference(BeneficiaryExample)
* status = #active
* oralDiet.type = http://www.cms.gov/Medicare/Coding/HCPCSReleaseCodeSets#B4150
* dateTime = "2005-06-02"

Instance: MedicationRequestExample
InstanceOf: PASMedicationRequest
Title: "Medication Request Example"
Description: "A sample medication request to prescribe a specific drug."
* intent = #order
* status = #active
* medicationCodeableConcept = http://hl7.org/fhir/sid/ndc#0777-3105-02
* subject = Reference(BeneficiaryExample)
* authoredOn = 2005-06-02
* requester = Reference(ReferralPractitionerExample)
* dosageInstruction.timing = TimingExample
* dispenseRequest.quantity = 300 'mg' "mg"

Instance: TimingExample
InstanceOf: PASTiming
Usage: #inline
Title: "Timing Datatype Example"
Description: "An example of a Timing with patterns."
* extension[calendarPattern].valueCodeableConcept = https://codesystem.x12.org/005010/678#L "Monday through Thursday"
* extension[deliveryPattern].valueCodeableConcept = https://codesystem.x12.org/005010/679#D "A.M."

Instance: SurgicalEncounterExample
InstanceOf: PASEncounter
Title: "Encounter Example"
Description: "An example of encounter details for a surgical admission request."
* extension[patientStatus].valueCodeableConcept = https://www.nubc.org/CodeSystem/PatDischargeStatus#30 "Still a patient"
* status = #planned
* class = http://terminology.hl7.org/CodeSystem/v3-ActCode#AMB
* type = https://www.nubc.org/CodeSystem/PriorityTypeOfAdmitOrVisit#2
* subject = Reference(SubscriberExample)
* period.start = "2020-07-02"
* period.end = "2020-07-09"
* hospitalization.admitSource = https://www.nubc.org/CodeSystem/PointOfOrigin#5

Instance: SurgicalRequestBundleExample
InstanceOf: PASRequestBundle
Title: "Surgical Admission Request Bundle Example"
Description: "An example of a Claim bundle requesting prior authorization of a surgical service."
* identifier.system = "http://example.org/SUBMITTER_TRANSACTION_IDENTIFIER"
* identifier.value = "16139462398"
* type = #collection
* timestamp = 2020-06-24T07:34:00+05:00
* entry[Claim].fullUrl = "http://example.org/fhir/Claim/SurgicalAuthorizationRequestExample"
* entry[Claim].resource = SurgicalAuthorizationRequestExample
* entry[1].fullUrl = "http://example.org/fhir/Organization/UMOExample"
* entry[1].resource = UMOExample
* entry[2].fullUrl = "http://example.org/fhir/Organization/InsurerExample"
* entry[2].resource = InsurerExample
* entry[3].fullUrl = "http://example.org/fhir/Coverage/InsuranceExample"
* entry[3].resource = InsuranceExample
* entry[4].fullUrl = "http://example.org/fhir/Patient/SubscriberExample"
* entry[4].resource = SubscriberExample
* entry[5].fullUrl = "http://example.org/fhir/Encounter/SurgicalEncounterExample"
* entry[5].resource = SurgicalEncounterExample
* entry[6].fullUrl = "http://example.org/fhir/PractitionerRole/SurgicalPractitionerRoleExample"
* entry[6].resource = SurgicalPractitionerRoleExample
* entry[7].fullUrl = "http://example.org/fhir/Practitioner/SurgicalPractitionerExample"
* entry[7].resource = SurgicalPractitionerExample
* entry[8].fullUrl = "http://example.org/fhir/Location/SurgicalLocationExample"
* entry[8].resource = SurgicalLocationExample

Instance: SurgicalAuthorizationRequestExample
InstanceOf: PASClaim
Title: "Surgical Request Authorization Example"
Description: "An example of a Claim resource requesting prior authorization of a surgical service."
* extension[levelOfServiceType].valueCodeableConcept = https://codesystem.x12.org/005010/1338#E "Elective"
* extension[encounter].valueReference = Reference(SurgicalEncounterExample)
* extension[conditionCode].extension[category].valueCodeableConcept = https://codesystem.x12.org/005010/1136#07
* extension[conditionCode].extension[indicator].valueBoolean = true
* extension[conditionCode].extension[code].valueCodeableConcept = https://codesystem.x12.org/005010/1321#09
* identifier.system = "http://example.org/PATIENT_EVENT_TRACE_NUMBER"
* identifier.value = "16139462398"
* identifier.assigner.identifier.system = "http://example.org/USER_ASSIGNED"
* identifier.assigner.identifier.value = "3030240928"
* status = #active
* type = http://terminology.hl7.org/CodeSystem/claim-type#institutional
* use = #preauthorization
* patient = Reference(SubscriberExample)
* created = 2020-06-24T07:34:00+05:00
* insurer = Reference(InsurerExample)
* provider = Reference(UMOExample)
* priority = http://terminology.hl7.org/CodeSystem/processpriority#normal
* diagnosis.sequence = 1
* diagnosis.diagnosisCodeableConcept = http://hl7.org/fhir/sid/icd-10-cm#C18.9
* diagnosis.extension[recordedDate].valueDate = "2020-06-24"
* insurance.sequence = 1
* insurance.focal = true
* insurance.coverage = Reference(InsuranceExample)
* supportingInfo[AdmissionDates].sequence = 1
* supportingInfo[AdmissionDates].timingPeriod.start = "2020-07-02"
* supportingInfo[AdmissionDates].timingPeriod.end = "2020-07-09"
* item.extension[itemTraceNumber].valueIdentifier.system = "http://example.org/ITEM_TRACE_NUMBER"
* item.extension[itemTraceNumber].valueIdentifier.value = "1122334"
* item.extension[authorizationNumber].valueString = "1122445"
* item.extension[administrationReferenceNumber].valueString = "9988311"
* item.extension[requestType].valueCodeableConcept = https://codesystem.x12.org/005010/1525#AR "Admission Review"
* item.extension[certificationType].valueCodeableConcept = https://codesystem.x12.org/005010/1322#I "Initial"
* item.sequence = 1
* item.careTeamSequence = 1
* item.diagnosisSequence = 1
* item.category = https://codesystem.x12.org/005010/1365#2 "Surgical"
* item.productOrService = http://www.cms.gov/Medicare/Coding/HCPCSReleaseCodeSets#33510 "Under Venous Grafting Only for Coronary Artery Bypass"
* item.locationCodeableConcept = https://www.cms.gov/Medicare/Coding/place-of-service-codes/Place_of_Service_Code_Set#21
* careTeam.sequence = 1
* careTeam.extension[careTeamClaimScope].valueBoolean = true
* careTeam.provider = Reference(SurgicalPractitionerRoleExample)

Instance: SurgicalPractitionerRoleExample
InstanceOf: PASPractitionerRole
Title: "Submit Claim Surgical Practitioner Role Example"
Description: "A sample practitioner role instance."
* practitioner = Reference(ReferralPractitionerExample)
* location = Reference(ReferralLocationExample)

Instance: SurgicalLocationExample
InstanceOf: PASLocation
Title: "Submit Claim Surgical Location Example"
Description: "A sample location."
* name = "REFERRAL CLINIC"
* address.line = "111 1ST STREET"
* address.city = "SAN DIEGO"
* address.state = "CA"
* address.country = "US"
* address.postalCode = "92101"

Instance: SurgicalPractitionerExample
InstanceOf: PASPractitioner
Title: "Submit Claim Surgical Practitioner Example"
Description: "A sample practitioner who is being referred to."
* identifier.system = "http://hl7.org/fhir/sid/us-npi"
* identifier.value = "1234567893"
* name.family = "WATSON"
* name.given = "SUSAN"
* telecom.system = #phone
* telecom.value = "4029993456"

Instance: AdditionalInformationTaskExample
InstanceOf: PASTask
Title: "Additional Information Task Example"
Description: "An example of a PAS Task requesting additional information."
* identifier.system = "http://example.org/ITEM_TRACE_NUMBER"
* identifier.value = "1122334"
* status = http://hl7.org/fhir/task-status#requested
* intent = #order
* code = PASTempCodes#attachment-request-code
* requester.identifier.system = "http://hl7.org/fhir/sid/us-npi"
* requester.identifier.value = "789312"
* owner.identifier.system = "http://hl7.org/fhir/sid/us-npi"
* owner.identifier.value = "789312"
* for = Reference(BeneficiaryExample)
* reasonCode
* reasonReference = Reference(MedicalServicesAuthorizationExample)
* input[PayerURL].valueUrl = "http://example.org/payerURL"
* input[AttachmentsNeeded].valueCodeableConcept = http://loinc.org#28570-0
* input[AttachmentsNeeded].extension[paLineNumber].valueInteger = 1

Instance: PASSubscriptionExample
InstanceOf: PASSubscription
Title: "PAS Subscription example for a specific provider"
Description: "An example of a PAS Subscription submission for a specific provider."
* criteria.extension[filterCriteria].valueString = "orgIdentifier=http://hl7.org/fhir/sid/us-npi|1234567893"
* channel.endpoint = "http://example.org/send-me-subscription-notifications"
* channel.payload = #application/fhir+json
* channel.payload.extension[payloadContent].valueCode = #full-resource
* reason = "Receive notifications about claim responses for my organization."

Instance: PASSubscriptionNotification
InstanceOf: Bundle
Title: "PAS Subscription Notification example"
Description: "An example of a PAS Subscription Notification"
* type = #history
* timestamp = 2020-05-29T11:44:33.188-05:00
* entry[+].fullUrl = "http://example.org/Parameters/SubscriptionNotificationParameters"
* entry[=].resource = SubscriptionNotificationParameters
* entry[=].request.method = #GET
* entry[=].request.url = "https://example.org/Subscription/PAS/$status"
* entry[=].response.status = "200"
* entry[+].fullUrl = "http://example.org/Bundle/ReferralAuthorizationResponseBundleExample"
* entry[=].resource = ReferralAuthorizationResponseBundleExample
* entry[=].request.method = #GET
* entry[=].request.url = "https://example.org/Bundle/ReferralAuthorizationResponseBundleExample"
* entry[=].response.status = "200"

Instance: SubscriptionNotificationParameters
InstanceOf: Parameters
Title: "PAS Subscription Notification Parameters"
Description: "An example of the parameters going back for a PAS subscription notification"
* parameter[+]
  * name = "subscription"
  * valueReference = Reference(PASSubscription)
* parameter[+]
  * name = "topic"
  * valueCanonical = "http://hl7.org/fhir/us/davinci-pas/SubscriptionTopic/PASSubscriptionTopic|2.1.0"
* parameter[+]
  * name = "type"
  * valueCode = #event-notification
* parameter[+]
  * name = "notification-event"
  * part[+]
    * name = "event-number"
    * valueString = "2"
  * part[+]
    * name = "timestamp"
    * valueInstant = "2020-05-29T11:44:33.188-05:00"
  * part[+]
    * name = "focus"
    * valueReference.reference = "http://example.org/Bundle/ReferralAuthorizationResponseBundleExample"
