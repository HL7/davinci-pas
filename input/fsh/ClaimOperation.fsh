Instance: ClaimSubmitOperation
InstanceOf: OperationDefinition
Description: "This operation is used to submit a Claim, Pre-Authorization or Pre-Determination (all instances of Claim resources) for adjudication as a Bundle containing the Claim and other referenced resources for processing. The only input parameter is the single Bundle resource with a Claim instance (along with other referenced resources) and the only output is a single Bundle with a ClaimResponse (and other referenced resources) or an OperationOutcome resource."
Usage: #definition

* id = "Claim-submit"
* url = "http://hl7.org/fhir/us/davinci-pas/OperationDefinition/Claim-submit"
* name = "ClaimSubmit"
* title = "Submit a Claim resource for adjudication"
* status = #draft
* kind = #operation
* code = #submit
* base = "http://hl7.org/fhir/OperationDefinition/Claim-submit"
* resource = #Claim
* system = false
* type = true
* instance = false
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
Description: "This operation is used to make an inquiry for a Claim, Pre-Authorization or Pre-Determination (all instances of Claim resources) as a Bundle containing the Claim and other referenced resources for processing. The only input parameter is the single Bundle resource with a Claim instance (along with other referenced resources) and the only output is a single Bundle with a ClaimResponse (and other referenced resources) or an OperationOutcome resource."
Usage: #definition

* id = "Claim-inquiry"
* url = "http://hl7.org/fhir/us/davinci-pas/OperationDefinition/Claim-inquiry"
* name = "ClaimInquiry"
* title = "Submit a Claim resource for inquiry"
* status = #draft
* kind = #operation
* code = #inquire
* base = "http://hl7.org/fhir/OperationDefinition/Claim-submit"
* resource = #Claim
* system = false
* type = true
* instance = false
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
