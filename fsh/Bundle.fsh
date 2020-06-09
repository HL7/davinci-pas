Profile: PASBundle
Parent: Bundle
Id: profile-pas-bundle
Title: "PAS Bundle"
Description: "PAS constraints on Bundle resource ensuring that a claim/claim update/claim response resource is present and that non-supported elements are not."
* identifier 1..1 MS
* type = #collection (exactly)
* timestamp 1..1 MS
* entry 1..* MS
* entry.fullUrl 1..1 MS
* entry.resource 1..1 MS
* entry.resource only PASClaim or PASClaimUpdate or PASClaimResponse
* entry.search 0..0
* entry.request 0..0
* entry.response 0..0
