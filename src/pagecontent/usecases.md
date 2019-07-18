### Current State
Prior authorization (PA) is performed in the United States by payers and providers to ensure that patience/members receive care and coverage of treatments, testing, referrals, devices appropriate for their specific conditions and the general coverage provided by the specific health plan in which the member is enrolled. 

The PA process involves determining if a proposed treatment for a specific condition is covered by the current payer guidelines/standards. To do this, the provider may submit a request to the payer to determine if prior authorization is required before providing a specific treatment for condition where that treatment is expected to be expected to be covered/paid for by the payer.  The payer then responds to the provider with an indication that prior authorization is or is not required.

If authorization is required and documentation is necessary to substantiate the need for the service, the specific documentation is requested.  The documentation may take the form of attestations by the provider, diagnoses, results of specific diagnostic tests, prior treatment that has been tried and failed, specific studies that need to be performed and other specific documentation such as progress notes or discharge summaries.

Currently, under HIPAA, providers and payers are required to use the 5010 version of the ASC X12 278 request transaction to request prior authorization and the 278 response to respond to that request.  While the X12 275,  for additional documentation, is not currently required it is considered reasonable and appropriate to use this X12 transaction to support the exchange of the additional information that is required for prior authorization.

However, adoption of X12 by EHR implementers has been low.  Discussion with such implementers has suggested that a FHIR-based process for submitting prior authorization requests would have significantly higher uptake.  This implementation guide attempts to do that while still retaining compliance with HIPPA requirements.

TODO:

1.	insert here the appropriate references to HIPPA legislation and the requirement for the ASC X12 278
2.	insert here the diagram showing the exchange requirement for the ASC X12 278 between a provider and a payer  and the different ways in which that requirement can be accommodated 
3.	one provider exchanging the 278 directly with the payer
4.	using business associate(s)  to meet the requirements
5.	conducing the transaction via one or more clearing houses

### Business Requirements
The objective of implementation guide is to provide a vehicle for automation of a prior authorization request and response within the clinical workflow of the provider.  The IG uses the FHIR standard as the basis for assembling the information necessary to substantiate the need for a particular treatment and submitting that information and the request for prior authorization to an intermediary end point.  That endpoint is responsible for ensuring that any HIPAA requirements are met (see above). The response from the payer is intended to come back to that intermediary endpoint and be available to the providers EHR solution using the FHIR  standard.  The goal is to provide real time prior authorization, where possible, in the provider's clinical workflow.

Current industry payer leaders in automating prior authorization indicate that it is possible to achieve a real-time response to the PA request in up to 80% of prior authorizations.  In cases where real time prior authorization is not possible, the payer can provide an indication (PEND) in real-time that the response has been delayed for further review and the results can be delivered later.

This implementation guide also supports business requirements around the management of prior authorizations, including checking on the status of 'pended' authorization requests (by the ordering and/or performing providres), cancelling previously submitted prior authorization requests and updating prior authorization requests to reflect changes in clinical need (e.g. changes to the requested quantity or time-period).

### Work Flow
Within an EHR Client, the prior authorization request process should be capable of being evoked anywhere within the clinical and administrative workflow that is appropriate for that system. Generally, this will be part of any workflows where a provider has made a decision to pursue a specific course of treatment for which prior authorization might be required.  For example, ordering a specific treatment, diagnostic testing, non-clinical service, referral and or device.  (Note: In the U.S., prior authorizations for medications are typically dealt with through NCPDP and are currently out of scope for this implementation guide.)

The prior authorization process consists of five steps:
1. Determine whether prior authorization is required
2. Gather information necessary to support the prior authorization request
3. Submit the request for prior authorization
4. Monitor the prior authorization request for resolution
5. If need be, supplement the prior authorization request with additional required information (and resume at step #4)

#### Is prior authorization necessary?
In some cases, the provider may know <i>a priori</i> whether PA is necessary for a given service (either because of intimate familiarity with a given payer's requirements or because of broad consistency across payers.  However, in most cases, the need for prior authorization will be uncertain.  Ideally, initiation of prior authorization will occur as part of a workflow that includes verification of payer coverage and determination that prior authorization is required using the [Coverage requirements Discovery (CRD)](http://www.hl7.org/fhir/us/davinci-crd) implementation guide.  In the absence of CRD support by EHR or payer, other mechanisms such as consulting the payer's website and/or emailing or faxing the payer must be used.

#### Gather PA information
Again, in some cases, the provider may know exactly what information needs to be provided in a prior authorization request for a particular type of service from a given payer.  When this is not known, the vendor website or phone calls may help determine the required information, though this is sometimes an iterative process - certain information may trigger the need for additional information which may then trigger the need for yet more information.  Historically, this process has been handled by submitting an initial prior authorization request and then responding to payer requests for additional detail through the submission of supplementary attachments.

However, with the [Documentation Templates and Rules (DTR)](http://www.hl7.org/fhir/us/davinci-dtr) implementation guide, the EHR can retrieve relevant payer documentation rules in computable form as well as associated FHIR questionnaires to support the assembly of information for a prior authorization. The provider can use the resulting automated process to assemble the required documentation to support the prior authorization request.  As well, DTR enable the EHR system or a launched SMART on FHIR application to retrieve information from the patient's record that is necessary to support the prior authorization request.  DTR also allows prompting for information that can't be (automatically) found in the patient's clinical record and/or to allow the provider to attest that the information is present in the record without actually exchanging it.

As a result, with DTR, it is possible to minimize or eliminate the need for multiple back-and forth 'supplemental documentation' exchanges and to maximize the likelihood that the submitted prior authorization supporting information is suitable for automated decision making.

Information gathered to support prior authorization is expected to be stored in the EHR in addition to being used as part of the prior authorization request process.

Also see the section below on [supporting information](#supporting_information)

#### Submit prior authorization
The EHR may choose to allow the ordering provider to review the information submitted as part of the prior authorization request and/or determine whether or not such a request should be submitted.  However, this is not mandated by this implementation guide.

The prior authorization request will involve invoking a FHIR operation, passing in a Bundle of FHIR resources that includes the authorizing request as well as any other necessary supporting information.  That operation will typically (for HIPPA reasons) be invoked on an intermediary that will translate the request into the corresponding X12 messages.  However, where there is no regulatory requirement for X12 use (e.g. if this specification is adopted in non-U.S. environments or for non-HIPPA-covered claims), the operation could potentially be invoked directly on the payer system.

The payer system is expected to immediately generate an automated response.  Ideally, this will represent a final decision on the prior authorization request.  However, in some cases, it may be necessary to submit textual documentation that will require semi-automated or manual review by the payer.  In these situations, the prior authorization response will have a status of 'pended' will be pended.  In either event, if the response is provided via X12, the intermediary will convert the X12 back to FHIR and will return the result as the result of the synchronous operation.

#### Monitor for resolution
In those situations where the prior authorization request is 'pended', the EHR must monitor for changes to the request until such time as the results are finalized.  This monitoring might be done by the system of the provider that submitted the request for prior authorization, and/or the system of the provider that is expected to actually perform the authorized procedure.  (E.g. the family physician system or the imaging center system).  This will be done by querying the payer system/intermediary.  This might be done at regular intervals (polling) or it might be done in response to a subscription notification indicating that the prior authorization has been changed.

Also, in situations where a request is 'pended', there may occasionally be needs to update the authorization request.  This might involve cancelling it (because the service is no longer needed/relevant) or adjusting the description of the procedure for which authorization is requested (e.g. changing the timeframe or required number of repetitions based on new clinical information)

#### Submit additional information
With the use of DTR, this scenario should be extremely uncommon.  However, in some cases an authorization might be rejected due to insufficient information.  In this case, a new authorization can be submitted with additional information supplied to support the decision-making process.

### Supporting information
To evaluate whether a given service will be covered, a payer may need to understand clinical information about the patient.  There are three main categories of such information:

1.	Attestation by the provider as to the patient need for a specific treatment or service.  In this case, there is no specific clinical data required.  Payers indicate that this scenario may account for up to 50% of prior authorization transactions. Such attestations are generally collected as answers to questions as part of QuestionnaireResponses completed within the EHR or via a a SMART on FHIR application.

2.	Structured clinical data that is available through the EHR's FHIR APIs. This might include lab results, scores or assessments, past medications or procedures represented using the appropriate US Core profiles.  Based on discussions payers that currently provide currently provide real-time responses (not PEND) for prior authorization transactions using either the ASC X12 standards or portal interactions, the combination of attestation and structured clinical data may support a real-time answer for up to 80% of PA requests

3.	Information that is traditionally not structured, or where the review process is more involved and will not be performed in real time. In this use case, additional information may be in the form of progress notes, therapy notes, diagnostic reports, etc.  This information will be exchanged as text or images using the document reference.  Where such information, the initial request will typically be 'pended', with a final decision returned later once manual review is complete


### Use cases
This IG will use specific PA use cases to illustrate the information and workflow requirements.  The use cares defined below show how prior authorization would be managed for: 

1. home oxygen therapy,
2. CPAP  device,
3. diabetic testing supplies
4. advanced imaging, and  
5. home health services
