Instance: ClaimSubmitOperation
InstanceOf: OperationDefinition
Description: "This operation is used to submit a Pre-Authorization Claim Request for adjudication as a Bundle containing the PASClaimRequest and other referenced resources for processing. The only input parameter is the single Bundle resource with a PASClaimRequest instance (along with other referenced resources) and the only output is a single Bundle with a PASClaimResponse (and other referenced resources) or an OperationOutcome resource.  This is a variant of the FHIR Core Claim $submit operation."
Usage: #definition

* id = "Claim-submit"
* url = "http://hl7.org/fhir/us/davinci-pas/OperationDefinition/Claim-submit"
* name = "ClaimSubmit"
* title = "Submit a Claim resource for adjudication"
* status = #draft
* kind = #operation
* description = "This operation is used to submit a Pre-Authorization Claim Request for adjudication as a Bundle containing the PASClaimRequest and other referenced resources for processing. The only input parameter is the single Bundle resource with a PASClaimRequest instance (along with other referenced resources) and the only output is a single Bundle with a PASClaimResponse (and other referenced resources) or an OperationOutcome resource.  This is a variant of the FHIR Core Claim $submit operation."
* code = #submit
* base = "http://hl7.org/fhir/OperationDefinition/Claim-submit"
* resource = #Claim
* system = false
* type = true
* instance = false
* inputProfile = Canonical(PASRequestBundle)
* outputProfile = Canonical(PASResponseBundle)
* parameter[0].name = #resource
* parameter[0].use = #in
* parameter[0].min = 1
* parameter[0].max = "1"
* parameter[0].documentation = "A Bundle containing a single Claim plus referenced resources."
* parameter[0].type = #Bundle
* parameter[1].name = #return
* parameter[1].use = #out
* parameter[1].min = 1
* parameter[1].max = "1"
* parameter[1].documentation = "A Bundle containing a single ClaimResponse plus referenced resources."
* parameter[1].type = #Bundle

Instance: ClaimInquiryOperation
InstanceOf: OperationDefinition
Description: "This operation is used to make an inquiry for a previously-submitted Pre-Authorization.  This Prior Authorization $inquire operation is a query-by-example that follows the X12 278 Inquiry rules.  The only input parameter is the single Bundle resource with a PASClaimInquiry instance (along with other referenced resources) and the only output is a single Bundle with zero-to-many PASClaimInquiryResponses (and other referenced resources) or an OperationOutcome resource."
Usage: #definition

* id = "Claim-inquiry"
* url = "http://hl7.org/fhir/us/davinci-pas/OperationDefinition/Claim-inquiry"
* name = "ClaimInquiry"
* title = "Submit a Claim resource for inquiry"
* status = #draft
* kind = #operation
* description = "This operation is used to make an inquiry for a previously-submitted Pre-Authorization.  This Prior Authorization $inquire operation is a query-by-example that follows the X12 278 Inquiry rules.  The only input parameter is the single Bundle resource with a PASClaimInquiry instance (along with other referenced resources) and the only output is a single Bundle with zero-to-many PASClaimInquiryResponses (and other referenced resources) or an OperationOutcome resource."
* code = #inquire
* base = "http://hl7.org/fhir/OperationDefinition/Claim-submit"
* resource = #Claim
* system = false
* type = true
* instance = false
* inputProfile = Canonical(PASInquiryRequestBundle)
* outputProfile = Canonical(PASInquiryResponseBundle)
* parameter[0].name = #resource
* parameter[0].use = #in
* parameter[0].min = 1
* parameter[0].max = "1"
* parameter[0].documentation = "A Bundle containing a single ClaimInquiry plus referenced resources."
* parameter[0].type = #Bundle
* parameter[1].name = #return
* parameter[1].use = #out
* parameter[1].min = 1
* parameter[1].max = "1"
* parameter[1].documentation = "A Bundle containing a single ClaimInquiryResponse plus referenced resources."
* parameter[1].type = #Bundle
