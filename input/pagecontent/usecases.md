### Current State
Prior authorization (PA) is a process used in the United States that requires providers to receive advanced approval from payers before care delivery to ensure that patients/members receive treatments, testing, referrals, and devices appropriate for their specific conditions and that are covered by the specific health plan in which the member is enrolled.

The PA process involves determining if a proposed treatment for a specific condition is covered by the current payer guidelines/standards. To do this, the provider may submit a request to the payer to determine if prior authorization is required before providing a specific treatment for a condition where that treatment is expected to be covered/paid by the payer.  The payer then responds to the provider with an indication that prior authorization is or is not required.

If authorization is required and documentation is necessary to substantiate the need for the service, the specific documentation is requested.  The documentation may take the form of attestations by the provider, diagnoses, results of specific diagnostic tests, prior treatment that has been tried and failed, specific studies that need to be performed and other specific documentation such as progress notes or discharge summaries.

{::options parse_block_html="false" /}
<figure>
  <img style="padding-top:0;padding-bottom:30px" width="800px" src="current.png" alt="Current HIPAA approach diagram"/>
  <figcaption>Figure 2.1 - Current HIPAA Approach</figcaption>
</figure>
{::options parse_block_html="true" /}

Currently, under HIPAA, providers and payers are required to use the 5010 version of the ASC X12 278 Health Care Services Review - Request and Response.  See further details on relevant HIPAA requirements [here](regulations.html).  While the X12 275, which is used to transmit additional documentation, is not currently mandated under HIPAA, it is considered reasonable and appropriate to use this X12 transaction to support the exchange of the additional information that is required for prior authorization.

However, adoption of X12 Authorization and Attachment transactions by EHR implementers has been low.  Surveys from CAQH & WEDI indicate that, for 2018, less than 12% of prior authorizations are processed using the 278 request & response.  For details, see the [WEDI survey from January 2020](https://growthzonesitesprod.azureedge.net/wp-content/uploads/sites/1238/2020/01/WEDI-PriorAuthSurveyResults-FINAL.pdf).  The [2019 CAQH Index survey](https://www.caqh.org/sites/default/files/explorations/index/report/2019-caqh-index.pdf?token=SP6YxT4u) indicated that <13% of Prior Authorization transactions are fully automated X12 278.  Clinicians and their office staff spend hours each week trying to verify coverage requirements for specific treatments, submitting prior authorization requests, following up on prior authorization requests, transmitting supporting documentation to support follow-up requests for information and then communicating the prior authorization final decision within the care team and the patient.  Mechanisms include phone, fax, custom portals, but rarely automated data feeds. Automating even a few steps of the prior authorization process could make the work of healthcare team members across the country much easier.

Discussion with EHR implementers has suggested that a FHIR-based process for submitting prior authorization requests would have significantly higher uptake.  As well, there is a desire by some payers to consume content in FHIR format.  This implementation guide attempts to do that while still retaining compliance with HIPAA requirements.

### Business Requirements
The objective of this implementation guide is to provide a vehicle for automation of a prior authorization request and response within the clinical workflow of the provider.  The IG uses the FHIR standard as the basis for assembling the information necessary to substantiate the need for a particular treatment, and to submit that information and the request for prior authorization to an intermediary end point.  That endpoint is responsible for ensuring that any HIPAA Transaction and Code Set requirements are met (see above). The response from the payer is intended to come back to that intermediary endpoint and be available to the provider's EHR solution using the FHIR  standard.  The goal is to provide real time prior authorization, where possible, in the provider's clinical workflow.  The X12 portion of the exchange happens in a 'black box' that the submitting system needs no visibility into.  This 'black box' is a service responsible for communication with a payer or their agent and handles any HIPAA requirements that may exist.  This service can be the provider's software, an external agent, a clearinghouse, or, if there is a HIPAA exception, the payer.  In the latter case, there may not be a requirement to convert into and out of X12 and the FHIR bundle will be exchanged directly with the payer.

{::options parse_block_html="false" /}
<figure>
  <img style="padding-top:0;padding-bottom:30px" width="800px" src="pas-architecture.png" alt="Diagram showing PAS participants and flows"/>
  <figcaption>Figure 2.2 - PAS Participants and Flows</figcaption>
</figure>
{::options parse_block_html="true" /}

Current industry payer leaders in automating prior authorization indicate that it is possible to achieve a real-time response to the PA request in up to 80% of prior authorizations.  In cases where real time prior authorization is not possible, the payer can provide an indication (PEND) in real-time that the response has been delayed for further review and the results will be delivered later.

Currently, the overwhelming majority of real-time responses to the PA request are pended. This is, in a large part, due to the need for additional documentation.  By using the combination of the [Documentation Templates and Rules (DTR) Implementation Guide](http://hl7.org/fhir/us/davinci-dtr/2019Sep/) and this IG to provide the documentation with the PA request, we expect payers to enable real-time response to significantly more PA requests.

This implementation guide also supports business requirements around the management of prior authorizations, including checking on the status of 'pended' authorization requests (by the ordering and/or performing providers), cancelling previously submitted prior authorization requests and updating prior authorization requests to reflect changes in clinical need (e.g. changes to the requested quantity or time-period).

### Work Flow
Within an EHR Client, the prior authorization request process should be capable of being evoked anywhere within the clinical and administrative workflow that is appropriate for that system. Generally, this will be part of any workflows where a provider has made a decision to pursue a specific course of treatment for which prior authorization might be required.  For example, ordering a specific treatment, diagnostic testing, non-clinical service, referral and or device.

#### Scope of Work Flow
In Scope

1. Prior Auth for services/devices performed/supplied by the ordering provider
2. Prior Auth for services/devices performed/supplied by a different provider where the ordering provider is required or permitted to request authorization for another entity to provide the services
3. Prior Auth for medications that are covered under a medical benefit
4. When Prior Auth is required by the rendering provider

Out Of Scope

1. SHOULD not be used for any Medication that is covered under a prescription drug program benefit where PA is provided by another electronic exchange process (e.g. NCPCP SCRIPT)

#### Prior Authorization Process
The prior authorization process from the EHR side consists of five steps:
1. Determine whether prior authorization is required
2. Gather information necessary to support the prior authorization request
3. Submit the request for prior authorization
4. Monitor the prior authorization request for resolution
5. If need be, supplement the prior authorization request with additional required information (and resume at step #4)

From the intermediary's perspective

{::options parse_block_html="false" /}
<figure>
  <img style="padding-top:0;padding-bottom:30px" width="800px" src="pas-flow.png" alt="High-level PAS workflow"/>
  <figcaption>Figure 2.3 - High-level PAS Workflow</figcaption>
</figure>
{::options parse_block_html="true" /}



#### Is prior authorization required?
In some cases, the provider may know beforehand whether PA is required for a given service (either because of intimate familiarity with a given payer's requirements or because of broad consistency across payers).  However, in most cases, the need for prior authorization will be uncertain.  Ideally, initiation of prior authorization will occur as part of a workflow that includes verification of payer coverage and determination that prior authorization is required using the [Coverage Requirements Discovery (CRD)](http://www.hl7.org/fhir/us/davinci-crd) implementation guide.  As shown in the above diagram, this can be accomplished using [CDS Hooks](https://cds-hooks.hl7.org). In the absence of CRD support by EHR or payer, other mechanisms such as consulting the payer's website and/or emailing or faxing the payer must be used.

#### Gather PA information
Again, in some cases, the provider may know exactly what information needs to be provided in a prior authorization request for a particular type of service from a given payer.  When this is not known, the vendor website or phone calls may help determine the required information, though this is sometimes an iterative process - certain information may trigger the need for additional information which may then trigger the need for yet more information.  Historically, this process has been handled by submitting an initial prior authorization request and then responding to payer requests for additional detail through the submission of supplementary attachments.

However, with the [Documentation Templates and Rules (DTR)](http://www.hl7.org/fhir/us/davinci-dtr) implementation guide, the EHR can retrieve relevant payer documentation rules in computable form as well as associated FHIR questionnaires to support the assembly of information for a prior authorization. The provider can use the resulting automated process to assemble the required documentation to support the prior authorization request.  As well, DTR enable the EHR system or a launched SMART on FHIR application to retrieve information from the patient's record that is necessary to support the prior authorization request.  DTR also allows prompting for information that can't be (automatically) found in the patient's clinical record and/or to allow the provider to attest that the information is present in the record without actually exchanging it.

As a result, with DTR, it is possible to minimize or eliminate the need for multiple back-and forth 'supplemental documentation' exchanges and to maximize the likelihood that the submitted prior authorization supporting information is suitable for automated decision making.

Information gathered to support prior authorization is expected to be stored in the EHR in addition to being used as part of the prior authorization request process.

Also see the section below on [supporting information](#supporting-information)

#### Submit prior authorization
Prior to sending clinical data as part of the PAS exchange, the provider (or their designated agent) SHALL have the ability, but not an obligation, to review patient information and where appropriate amend or withhold submission to comply with current regulations and relevant provider policies.

The prior authorization request will involve a FHIR operation, passing in a Bundle of FHIR resources that includes the authorizing request as well as any other necessary supporting information.  That operation will typically (for HIPAA reasons) be invoked on an intermediary that will translate the request into the corresponding X12 messages.  However, where there is no regulatory requirement for X12 use (e.g. if this specification is adopted in non-U.S. environments, for non-HIPAA-covered payers, or under a granted exception), the operation could potentially be invoked directly on the payer system.

The payer system is expected to immediately generate an automated response.  Ideally, this will represent a final decision on the prior authorization request.  However, in some cases, it may be necessary to submit textual documentation that will require semi-automated or manual review by the payer.  In these situations, the prior authorization response will have a status of 'pended' and will be pended by the payer.  In either event, if the response is provided via X12, the intermediary will convert the X12 back to FHIR and will return the result as the result of the synchronous operation.

#### Monitor for resolution
In those situations where the prior authorization request is 'pended', the EHR must monitor for changes to the request until such time as the results are finalized.  This monitoring might be done by the system of the provider that submitted the request for prior authorization, and/or the system of the provider that is expected to actually perform the authorized procedure (e.g. the family physician system or the imaging center system).  This will be done by querying the payer system/intermediary.  This might be done at regular intervals (polling) or it might be done in response to a subscription notification indicating that the prior authorization has been changed.

Also, in situations where a request is 'pended', there may occasionally be needs to update the authorization request.  This might involve the provider cancelling it (because the service is no longer needed/relevant) or adjusting the description of the procedure for which authorization is requested (e.g. minor change to a procedure code, changing the timeframe or required number of repetitions based on new clinical information).

#### Submit additional information
With the use of DTR, this scenario should be extremely uncommon.  However, in some cases an authorization will have a status of denied or pended due to insufficient information, which will normally be indicated either by error messages indicating which mandatory elements were missing or with a request for specific additional information to be provided.  In this case, a new or revised authorization request can be submitted with additional information supplied to support the decision-making process.  Alternately, the payor may keep the request pended and simply request additional information.  This specification does not cover the process of appeals. Providers should consult the payer in question to determine the appropriate appeals mechanism.

{% raw %}
<blockquote class="stu-note">
<p>
The following section was added in the May 2022 ballot of PAS and we are seeking balloter feedback on it.
</p>
</blockquote>
{% endraw %}

If additional information is needed, the payer can request the information in a number of means:

1.	Respond with an FAX or upload to a portal
2.	An X12 275 response (by provider) to a X12 278 response (as represented in the response FHIR bundle)
3.	A CDex "Push" transition based on an X12 278 response 
4.	Resubmission of the PA request with additional information
5.	A FHIR based request for additional information using DTR.  The note that would be returned would be "please launch DTR with a context of this authorization request."

Here is a diagram that shows the workflow associated with a request for additional information:

{::options parse_block_html="false" /}
<figure>
  <img style="padding-top:0;padding-bottom:30px" width="800px" src="pas-additionaldoc-workflow.png" alt="PAS Additional Documentation Request Workflow"/>
  <figcaption>Figure 2.4 - Additional Documentation Request Workflow</figcaption>
</figure>
{::options parse_block_html="true" /}

### Supporting information
To evaluate whether a given service will be covered, a payer may need to understand additional information about the patient.  There are three main categories of such information:

1.	Attestation by the provider as to the patient need for a specific treatment or service.  In this case, there is no specific clinical data required.  Such attestations are generally collected as answers to questions as part of FHIR QuestionnaireResponses completed within the EHR or via a SMART on FHIR application.

2.	Structured clinical data that is available through the EHR's FHIR APIs. This might include laboratory results, scores or assessments, past medications or procedures represented using the appropriate US Core profiles.  Based on discussions with payers that currently provide real-time responses for prior authorization transactions, the combination of attestation and structured clinical data may result in far more real-time answers to PA requests.

3.	Information that is traditionally not structured, or where the review process is more involved and will not be performed in real time. In this use case, additional information may be in the form of progress notes, therapy notes, diagnostic reports, etc.  This information will be exchanged as text or images using the document reference.  Where such information is necessary, the initial request will typically be 'pended', with a final decision returned later once manual review is complete.  All exchanges should meet Federal and state regulations, including any HIPAA restrictions and restrictions on sensitive data.


<!--### Use cases
This IG will use specific PA use cases to illustrate the information and workflow requirements.  The use cares defined below show how prior authorization would be managed for: 

1. home oxygen therapy,
2. CPAP  device,
3. diabetic testing supplies
4. advanced imaging, and  
5. home health services
-->
