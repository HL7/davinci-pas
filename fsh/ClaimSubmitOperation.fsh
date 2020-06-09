Instance: ClaimSubmitOperation
InstanceOf: OperationDefinition
Description: "Da Vinci Prior Authorization Support This operation is used to submit a Claim, Pre-Authorization or Pre-Determination (all instances of Claim resources) for adjudication either as a single Claim resource instance or as a Bundle containing the Claim and other referenced resources, or Bundle containing a batch of Claim resources, either as single Claims resources or Bundle resources, for processing. The only input parameter is the single Claim or Bundle resource and the only output is a single ClaimResponse, Bundle of ClaimResponses or an OperationOutcome resource."
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
* parameter[0].documentation = "A Claim resource or Bundle of claims, either as individual Claim resources or as Bundles each containing a single Claim plus referenced resources."
* parameter[0].type = #Bundle
* parameter[1].name = #return
* parameter[1].use = #out
* parameter[1].min = 1
* parameter[1].max = "1"
* parameter[1].documentation = "A ClaimResponse resource or Bundle of claim responses, either as individual ClaimResponse resources or as Bundles each containing a single ClaimResponse plus referenced resources."
* parameter[1].type = #Bundle
