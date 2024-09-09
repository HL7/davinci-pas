Profile: PASRequestBundle
Parent: Bundle
Id: profile-pas-request-bundle
Title: "PAS Request Bundle"
Description: "PAS constraints on Bundle resource ensuring that a claim/claim update resource is present and that non-supported elements are not."
* identifier 1..1 MS
* identifier ^short = "Submitted Transaction Identifier - this number will be assigned by the originator or sender to identify the transaction within the sender's business application system"
* type = #collection
* timestamp 1..1 MS
* entry 1..* MS
* entry.fullUrl 1..1 MS
* entry.resource 1..1 MS
* entry.search 0..0
* entry.request 0..0
* entry.response 0..0
* entry ^slicing.discriminator.type = #type
* entry ^slicing.discriminator.path = "resource"
* entry ^slicing.rules = #open
* entry ^slicing.description = "Slice different resources included in the bundle"
* entry contains Claim 1..1 MS
* entry[Claim].resource only PASClaimUpdate or PASClaim

Profile: PASInquiryRequestBundle
Parent: Bundle
Id: profile-pas-inquiry-request-bundle
Title: "PAS Inquiry Request Bundle"
Description: "PAS constraints on Bundle resource ensuring that a claim inquiry resource is present and that non-supported elements are not."
* identifier 1..1 MS
* type = #collection
* timestamp 1..1 MS
* entry 1..* MS
* entry.fullUrl 1..1 MS
* entry.resource 1..1 MS
* entry.search 0..0
* entry.request 0..0
* entry.response 0..0
* entry ^slicing.discriminator.type = #type
* entry ^slicing.discriminator.path = "resource"
* entry ^slicing.rules = #open
* entry ^slicing.description = "Slice different resources included in the bundle"
* entry contains Claim 1..1 MS
* entry[Claim].resource MS
* entry[Claim].resource only PASClaimInquiry

Profile: PASResponseBundle
Parent: Bundle
Id: profile-pas-response-bundle
Title: "PAS Response Bundle"
Description: "PAS constraints on Bundle resource ensuring that a claim response resource is present and that non-supported elements are not."
* type = #collection (exactly)
* timestamp 1..1 MS
* entry 1..* MS
* entry.fullUrl 1..1 MS
* entry.resource 1..1 MS
* entry.search 0..0
* entry.request 0..0
* entry.response 0..0
* entry ^slicing.discriminator.type = #type
* entry ^slicing.discriminator.path = "resource"
* entry ^slicing.rules = #open
* entry ^slicing.description = "Slice different resources included in the bundle"
* entry contains ClaimResponse 1..1 MS
* entry[ClaimResponse].resource MS
* entry[ClaimResponse].resource only PASClaimResponse

Profile: PASInquiryResponseBundle
Parent: Bundle
Id: profile-pas-inquiry-response-bundle
Title: "PAS Inquiry Response Bundle"
Description: "PAS constraints on Bundle resource ensuring that a claim inquiry response resource is present and that non-supported elements are not."
* type = #collection (exactly)
* timestamp 1..1 MS
* entry 1..* MS
* entry.fullUrl 1..1 MS
* entry.resource 1..1 MS
* entry.search 0..0
* entry.request 0..0
* entry.response 0..0
* entry ^slicing.discriminator.type = #type
* entry ^slicing.discriminator.path = "resource"
* entry ^slicing.rules = #open
* entry ^slicing.description = "Slice different resources included in the bundle"
* entry contains ClaimResponse 0..* MS
* entry[ClaimResponse].resource MS
* entry[ClaimResponse].resource only PASClaimInquiryResponse
