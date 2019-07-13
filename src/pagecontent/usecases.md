### PAS IG Home Page
### Current Environment
Currently prior authorization (PA) is performed in the United States by payers and providers to ensure that patience/members receive care and coverage of treatments, testing, referrals, devices appropriate for their specific conditions and the general coverage provided by the specific health plan in which the member is enrolled. The prior authorization process involves determining if a proposed treatment for a specific condition is covered by the current payer guidelines/standards. To do this, the provider may submit a request to the payer to determine if prior authorization is required before providing a specific treatment for condition where that treatment is expected to be expected to be covered/paid for by the payer.  The payer then responds to the provider with an indication that prior authorization is or is not required.  If authorization is required and documentation is necessary to substantiate the need for the service, the specific documentation is requested.  The documentation may take the form of attestations by the provider, diagnoses, results of specific diagnostic tests, prior treatment that has been tried and failed, specific studies that need to be performed and other specific documentation such as progress notes or discharge summaries. Currently, under HIPAA, providers and payers are required to utilize  the 5010 version of the ASC X12 278 request transaction to request prior authorization and the 278 response to respond to that request.  While the X12 275,  for additional documentation, is not currently required it is considered reasonable and appropriate to use this X12 transaction to support the exchange of the additional information that is required for prior authorization.
Notes:

1.	insert here the appropriate references to HIPPA legislation and the requirement for the ASC X12 278
2.	insert here the diagram showing the exchange requirement for the ASC X12 278 between a provider and a payer  and the different ways in which that requirement can be accommodated 
3.	one provider exchanging the 278 directly with the payer
4.	using business associate(s)  to meet the requirements
5.	conducing the transaction via one or more clearing houses

### Business Requirements
The business requirement leading to this implementation guide is to provide a vehicle for automation of a prior authorization request and response within the clinical workflow of the provider using the FHIR standard as the basis for assembling the information necessary to substantiate the need for a particular treatment and submitting that information and the request for prior authorization using the FHIR standard to an end point that then is responsible for ensuring that any HIPAA requirements are met  (see above). The response from the payer is intended to come back to that operation endpoint and be available to the providers EHR technology using the FHIR  standard.  The goal is to provide real time prior authorization, where possible, in the providers clinical workflow.  Current industry payer leaders in automation prior authorization indicate that it is possible to achieve a real-time response to the PA request up to 80% of prior authorizations. Where real time prior authorization is not possible the payer will provide an indication (PEND) in real-time that the response has been delayed for further review 
The goal of this implementation guide is to define the process and related implementation guides that will standardize the query to see if prior authorization is required (CRD), assemble the necessary supporting information (DTR) and submit the PA request with the supporting documentation for payer review and response (this IG).

### Clinical and Documentation Requirements
The prayer authorization request should be capable of being evoked anywhere within the clinical workflow that is appropriate. Ideally, this will take place when the provider has made a decision to pursue a specific course of treatment and is verifying payer coverage for that treatment by using the Coverage Requirements Discovery (CRD) implementation guide to query the provider regarding the need for prior authorization. The provider can determine, from the response, if it is necessary to submit a prior authorization request. In situations where the payer provides, via a process defined by the Documentation Templates and Rules (DTR) implementation guide,  the appropriate payer documentation rules and an associated FHIR questionnaires to support the assembly of information for a prior authorization. The provider can utilize the resulting automated process to assemble the required documentation to support the prior authorization request.  The use of DTR will enable the EHR technology or SMART on FHIR application to retrieve information for the patient’s record that is necessary to support the prior authorization request. In the event such information does not exist in the patient’s clinical record or it is unclear where in the clinical record the information exists, the provider will be asked to provide either the required information or indicate where in the record the information is available. In addition, where attestations are required or appropriate, the questionnaire will enable the provider to make the necessary attestations prior to submission of the prior authorization request.  It is the ability to assemble the necessary supporting documentation that allows implementers of this guide to automate the PA request and approval process within the clinical workflow.  It may be necessary, for certain services, to submit textual documentation that will require semi-automated or manual review by the payer.  In these situations, it is expected that the response to the prior authorization request will be pended waiting on a manual review process and the resulting authorization will be received asynchronously to the request with a delay that will depend upon that particular payer’s standards and review process 
Where possible, structured data available through the EHR’s FHIR APIs supporting FHIR R4 release and the US Core profiles will be exchanged to provide the supporting information requirement for authorization for a specific treatment, diagnostic testing, service, referral and or device.

### Initial PA Automation Focus
This implementation guard will focus on 3 different basic use cases associated with prior authorization:

1.	the first use case requires supporting documentation that is primarily or solely attestation on the part of the provider as to the need for the need of the patient for a specific treatment or service and  there is no specific clinical data required (a survey of specific payers indicate that is use case may account for up to 50% of prior authorization transactions. Attestations may be collected using the FHIR questionnaire and an appropriate application within the EHR or in a SMAR on FHIR application and exchanged with the payer using the questionnaireResponse resource as part of the documentation sent with the PA request 
2.	the second use case includes not just attestations but also structured clinical data that is accessible as US Core profiles on FHIR R4 resources supporting the ONC USCDI clinical data definitions through the EHR’s FHIR APIs. Based on discussions payers that currently provide currently provide real-time responses (not PEND) for prior authorization transactions using either the ASC X12 standards or portal interactions, the combination of attestation and structured clinical data may support a real-time answer for up to 80% of PA requests
3.	the third use case is where it is necessary to provide information that is traditionally not structured, or the review process is more involved and will not be performed in real time. In this use case, additional information may be in the form of progress notes, therapy notes, diagnostic reports and other information that is necessary to substantiate the need for a specific service, device, referral, and/or diagnostic test.  This information will be exchanged as text or images using the document reference and the expected response from the payer will be pended for review.  The response will be received when the review is complete. 

### Technical requirements
Technical requirements to support this implementation guide include initial support for CRD to determine if prior authorization is required for a particular service, treatment, diagnostic testing, referral, etc.  Based on the response returned by the payer, payer may provide the ability to assemble the relevant information either as part of the EHR's inherent capability or a SMART on FHIR application as defined in DTR IG. The rules defining the necessary documentation will be communicated through a combination of Clinical Quality Language (CQL) and a FHIR questionnaire.  The result of executing the CQL and the FHIR questionnaire will be an assemblage of a questionnaireResponse and specific clinical resources that have been accessed through the EHRs APIs. The expectation is that API will support FHIR R4 and US Core profiles on resources that, at a minimum represent the ONC USCDI data set. 
The EHR and/or SMART on FHIR application will also assemble the information for the prior authorization profile on the claim resource and the coverage resource to provide the information necessary to populate the 5010 version of the ASC X12N 278 prior authorization request and the 6020 version of the ASC X12N 275 additional documentation transaction.  
The information necessary for the payer to review and provide authorization is included with the initial request (e.g. collected via a DTR compliant session) The resulting supporting documentation may be submitted as an unsolicited ASC X12N 275.  The binary segment of the 275 shall contain a base64 encoded copy of the entire FHIR bundle that was provided by the EHR to the operations endpoint.
It is expected that ASC X12N will publish a mapping standard to convert the FHIR profile on the claim resource and coverage resource to the information required by the 5010 ASC X12N 278 request and unsolicited 6020 ASC X12N 275 additional documentation transaction to meet the HIPAA mandated requirements for, at this time, the ASC X12N 278 and the anticipated ASC X12N 275. 
This IG treats everything that happens beyond the defined operations endpoint receiving the FHIR bundle as a black box.  This black box includes any business associate(s), clearinghouse(s), payers, contracted review entities,  and other intermediaries that may be involved in the PA request and response. It is up to that black box to ensure that any regulatory requirements are met.  
This IG requires that the operation endpoint have certain capabilities which will include support to:

1.	receive the FHIR bundle
2.	responding in real-time (<15 seconds) with an appropriate FHIR bundle response (which will be a prior authorization profile on a claim response as well as any other required fire resources defined in this implementation guide)
3.	support a request for status on a prior authorization and return the current PA response – this request may come from either the ordering or performing provider
4.	support receipt of a subscription that will be provided in the event that the result of the real-time response is a pended response. The subscription supports the ability for the endpoint to push a response back to the subscribing provider that an updated response is available.  Since it is possible there may be more than one response depending upon the nature of the request and the ability of the payer to answer more than one specific prior authorization requested within a single 278, in which case the subscription continue to alert the provider when any change is made to the 278 response.
5.	Receive and process an update a specific PA request -- this request may come from either the ordering or performing provider
6.	Receive and process a cancel of  a specific PA request -- this request may come from either the ordering or performing provider

### Testing Requirements
It is the intent of this implementation guide to provide specifications for the exchange of prior authorization in a way that is conducive to developing test scripts and a reference implementation (RI) that can be used to validate/exercise the IG at connectathons and during piloting and production deployment. It is also the intent of this guide that any test scripts will include testing of: 1) resources and profiles defined in this guide, 2) artifacts use from referenced IGs such as DTR and CRD, and 3) testing of conformance to the underlying FHIR standards for the associated release (e.g. FHIR R4). 

### Use cases
This IG will use specific PA use cases to illustrate the information and workflow requirements.  The use cares define below are a request for prior authorization for: 

1.	home oxygen therapy,
2.	CPAP  device,
3.	diabetic testing supplies
4.	advanced imaging, and  
5.	home health services

### Workflow
The workflow defined in this IG is summarized below.

1.	Provider uses a CRD compliant request to the payer to determine if PA is required
2.	If PA is required, the payer should return a link to allow the EHR and/or a SMART on FHIR application to retrieve the specific rules and FHIR questionnaire to collect the required supporting documentation 
3.	The EHR and/or SMART on FHIR application
    1.	executes the CQL and FHIR questionnaire to assemble the required documentation from the clinical record for the patient and, where necessary, from the providers direct input
    2.	stores resulting information in the clinical record
    3.	assembles the information and populates the claim and coverage resources based on the profiles defined in this guide
    4.	verifies that the provider wishes to submit the PA (optional)
    5.	assembles a FHIR bundle and submits it to the appropriate FHIR operation endpoint for the responsible payer 
    6.	receives the response from the endpoint within 15 seconds and display the result to the provider 
    7.	if the result is a pended response, a subscription is sent to the operations endpoint for the specific PA request
4.	If pended and a subscription is issued, receiving a response to the subscription and requesting the updated PA response
5.	Query for a PA by ordering or performing provider (may be converted to a 278i in the “black box”
6.	Update for a PA by ordering or performing provider (e.g. for additional physical therapy sessions or to request the use of a contrast agent for an MRI study)
7.	Cancel for a PA by the ordering or performing provider

### Specific workflow diagrams
We need workflow diagrams to show:

1.	 the traditional approach of submitting a 278 getting back into 78 response requesting information submitting matters at 275 and ultimately getting back at 278 reply 
2.	CRD, DTR and ultimately prior authorization support exchanges (including all of the variations – subscription, inquiry, update, cancel)
3.	the different methods of communication between a provider and payer as described above
4.	the contents of the requesting FHIR bundle including the questionnaireResponse, clinical resources using the US Core profiles, the claim resource (PA profile) and coverage resource (HRex profile)
5.	the contents of the received FHIR bundle including the PA profile on the claim response
6).	processing of the result and possible error codes (e.g. from the AAA segments)

### Da Vinci
Da Vinci is an HL7-sponsored project that brings together the U.S. payer ,providers, and technology suppliers (including EHR vendors)  to help payers and providers to positively impact clinical, quality, cost, and care management outcomes using FHIR-related technologies. The project organizes meetings (face-to-face and conference calls) as well as connectathons to find ways to leverage FHIR technologies to support and integrate value-based care (VBC) data exchange across communities. Da Vinci identifies value-based care use cases of interest to its member and the community as a whole.  The process that Da Vinci has adopted includes: 

1. identify business, clinical, technical and testing requirements, 
2. develop and ballot a FHIR based implementation guide (IG),
3. develop a reference implementation (RI) that is used to demonstrate that the concepts in the IG are possible to implement,
4. pilot the standard
5. support the production use of the IG to enable exchange of data to support interoperability for value-based care.   Additional information about Da Vinci, its members, the use cases and the implementation guides being developed can all be found on the HL7 website. Meeting minutes and other materials can be found on the Da Vinci Confluence page.
