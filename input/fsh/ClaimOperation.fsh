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
Description: "This operation is used to make a search for a Prior Authorization Response by example for a previously-submitted Pre-Authorization.  This Prior Authorization $inquire operation is a query-by-example that follows the X12 278 Inquiry rules.  The only input parameter is the single Bundle resource with a PASClaimInquiry instance (along with other referenced resources) and the only output is a single Bundle with zero-to-many PASClaimInquiryResponses (and other referenced resources) or an OperationOutcome resource."
Usage: #definition

* id = "Claim-inquiry"
* url = "http://hl7.org/fhir/us/davinci-pas/OperationDefinition/Claim-inquiry"
* name = "ClaimInquiry"
* title = "Submit a Claim resource for inquiry"
* status = #draft
* kind = #operation
* description = "This operation is used to make a search for a Prior Authorization Response by example.  This Prior Authorization $inquire operation is a query-by-example that follows the X12 278 Inquiry rules.  The only input parameter is the single Bundle resource with a PASClaimInquiry instance (along with other referenced resources) and the only output is a single Bundle with zero-to-many PASClaimInquiryResponses (and other referenced resources) or an OperationOutcome resource."
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


Instance: EHRCapabilities
InstanceOf: CapabilityStatement
Title: "EHR PAS Capabilities"
Description: "Capabilities required for an EHR participating in a PAS Exchange."
Usage: #definition
* url = Canonical(EHRCapabilities)
* name = "PASEHR"
* status = #active
* experimental = false
* date = "2023-08-08"
* description = "Capabilities required for an EHR participating in a PAS Exchange."
* kind = #requirements
* imports = "http://hl7.org/fhir/us/core/CapabilityStatement/us-core-client"
* fhirVersion = #4.0.1
* format[0] = #json
* format[1] = #xml
* rest
  * mode = #client
  * resource[0]
    * type = #Claim
    * operation[0]
      * name = "PAS Claim Request"
      * definition = Canonical(ClaimSubmitOperation)
    * operation[1]
      * name = "PAS Claim Inquiry"
      * definition = Canonical(ClaimInquiryOperation)
  * resource[1]
    * extension[0]
      * url = "http://hl7.org/fhir/uv/subscriptions-backport/StructureDefinition/capabilitystatement-subscriptiontopic-canonical"
      * valueCanonical = "http://hl7.org/fhir/us/davinci-pas/SubscriptionTopic/PASSubscriptionTopic"
    * type = #Subscription
    * interaction[0]
      * code = #create
    * interaction[1]
      * code = #update
    * interaction[2]
      * code = #delete
	

Instance: IntermediaryCapabilities
InstanceOf: CapabilityStatement
Title: "Intermediary PAS Capabilities"
Description: "Capabilities required for an Intermediary participating in a PAS Exchange."
Usage: #definition
* url = Canonical(IntermediaryCapabilities)
* name = "PASIntermediary"
* status = #active
* experimental = false
* date = "2023-08-08"
* description = "Capabilities required for an Intermediary participating in a PAS Exchange."
* kind = #requirements
* imports = "http://hl7.org/fhir/us/core/CapabilityStatement/us-core-server"
* fhirVersion = #4.0.1
* format[0] = #json
* format[1] = #xml
* rest
  * mode = #server
  * resource[0]
    * type = #Claim
    * operation[0]
      * name = "PAS Claim Request"
      * definition = Canonical(ClaimSubmitOperation)
    * operation[1]
      * name = "PAS Claim Inquiry"
      * definition = Canonical(ClaimInquiryOperation)
  * resource[1]
    * extension[0]
      * url = "http://hl7.org/fhir/uv/subscriptions-backport/StructureDefinition/capabilitystatement-subscriptiontopic-canonical"
      * valueCanonical = "http://hl7.org/fhir/us/davinci-pas/SubscriptionTopic/PASSubscriptionTopic"
    * type = #Subscription
    * interaction[0]
      * code = #create
    * interaction[1]
      * code = #update
    * interaction[2]
      * code = #delete

	