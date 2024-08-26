[Previous Page - Home Page](index.html)
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

Currently, under HIPAA, providers and payers are required to use the 5010 version of the ASC X12 278 Health Care Services Review - Request and Response.  See further details on relevant HIPAA requirements [here](regulations.html).  While the X12 275, which is used to transmit additional documentation, is not currently mandated under HIPAA, it is considered reasonable and appropriate to use this X12 transaction to support the exchange of the additional information required for prior authorization.

However, adoption of X12 Authorization and Attachment transactions by EHR implementers has been low.  Surveys from CAQH and the AMA support this.   The [2022 CAQH Index survey](https://www.caqh.org/sites/default/files/2022-caqh-index-report%20FINAL%20SPREAD%20VERSION.pdf) indicated that ~28% of Prior Authorization transactions were fully automated X12 278.  The [2022 AMA Prior Authorization Survey](https://www.ama-assn.org/system/files/prior-authorization-survey.pdf) provides information around the burden that current Prior Authorization places on clinicians.

Clinicians and their office staff spend hours each week trying to verify coverage requirements for specific treatments, submitting prior authorization requests, following up on prior authorization requests, transmitting supporting documentation to support follow-up requests for information and then communicating the prior authorization final decision with the care team and the patient.  Mechanisms they utilize phone, fax, custom portals, but rarely automated data feeds. Automating even a few steps of the prior authorization process could make the work of healthcare team members across the country much easier.

Discussion with EHR implementers has suggested that a FHIR-based process for submitting prior authorization requests would have a significantly higher uptake.  As well, there is a desire by some payers to consume content in FHIR format.  This implementation guide attempts to do that while still retaining compliance with HIPAA requirements.

### Business Requirements
The objective of this implementation guide is to provide a vehicle for automation of a prior authorization request and response within the clinical workflow of the provider.  The IG uses the FHIR standard as the basis for assembling the information necessary to substantiate the need for a particular treatment, and to submit that information and the request for prior authorization to an intermediary end point.  That endpoint is responsible for ensuring that any HIPAA Transaction and Code Set requirements are met (see above). The response from the payer is intended to come back to that intermediary endpoint and be available to the provider's EHR solution using the FHIR  standard.  The goal is to provide real time prior authorization, where possible, in the provider's clinical workflow.  The X12 portion of the exchange happens in a 'black box' that the submitting system needs no visibility into.  This 'black box' is a service responsible for communication with a payer or their agent and handles any HIPAA requirements that may exist.  This service can be the provider's software, an external agent, a clearinghouse, or, if there is a HIPAA exception, the payer.  In the latter case, there may not be a requirement to convert into and out of X12 and the FHIR bundle will be exchanged directly with the payer.

{::options parse_block_html="false" /}
<figure>
  <img style="padding-top:0;padding-bottom:30px" width="800px" src="pas-architecture.png" alt="Diagram showing PAS participants and flows"/>
  <figcaption>Figure 2.2 - PAS Participants and Flows</figcaption>
</figure>
{::options parse_block_html="true" /}

Current industry payer leaders in automating prior authorization indicate that it is possible to achieve a real-time response to the PA request in up to 80% of prior authorizations.  In cases where real time prior authorization is not possible, the payer can provide an indication (PEND) in real-time that the response has been delayed for further review and the results will be delivered later.

Currently, the overwhelming majority of real-time responses to PA requests are 'pended'. This is, in a large part, due to the need for additional documentation.  By using a combination of the [Documentation Templates and Rules (DTR) Implementation Guide](http://hl7.org/fhir/us/davinci-dtr/) and this IG to provide the documentation with the PA request, we expect payers to enable real-time responses to significantly more PA requests.

This implementation guide also supports business requirements around the management of prior authorizations, including checking on the status of 'pended' authorization requests (by the ordering and/or performing providers), canceling previously submitted prior authorization requests and updating prior authorization requests to reflect changes in clinical need (e.g. changes to the requested quantity or time-period).

### Supported Use Cases
This version of the Implementation Guide does not support all of the use cases that the current X12 278 Prior Authorization Request supports.  The following list highlights the segments that are not currently mapped/supported by the FHIR profiles in this guide:

1.  Loop 2000E, Segment CRC
	a. Ambulance Certification
	b. Chiropractic Cerfication
	c. Durable Medical Equipment
	d. Oxygen Therapy Certification
	e. Functional Limitations
	f. Activities Permitted
	g. Mental Status
2. Loop 2000E, Segment CR1 - Ambulance Transport
3. Loop 2000E, Segment CR2 - Spinal Manipulation Service
4. Loop 2000E, Segment CR5 - Home Oxygen Therapy
5. Loop 2000E, Segment CR6 - Home Health Care
6. Loop 2010EB - Patient Event Transport
7. Loop 2000F, Segment SV3 - Dental Service

#### Patient Event vs Service Line Items
In FHIR, the Claim resource which is being used for Prior Authorization does not have the concept of patient events like the X12 278 request.  All services being requested are found in the Claim items.  This means that when a Prior Authorization is being created in FHIR, all of the services will be found in the Claim items.  The assumption that we have made in the guide is that the resulting transformed X12 278 request will have the services being requested detailed in the Service Event line level.


### Workflow
Within an EHR Client, the prior authorization request process should be capable of being evoked anywhere within the clinical and administrative workflow that is appropriate for that system. Generally, this will be part of any workflows where a provider has made the decision to pursue a specific course of treatment for which prior authorization might be required.  For example, ordering a specific treatment, diagnostic testing, non-clinical service, referral and or device.  As an alternative option, the [FHIR Orders Exchange Implementation Guide](http://hl7.org/fhir/us/dme-orders/2020Sep/) can be used to send information regarding the prior authorization to a performing provider.

#### Scope of Work Flow
In Scope

1. Prior Auth for services/devices performed/supplied by the ordering provider
2. Prior Auth for services/devices performed/supplied by a different provider where the ordering provider is required or permitted to request authorization for another entity to provide the services
3. Prior Auth for medications that are covered under a medical benefit
4. Prior Auth is required for the rendering provider

Out Of Scope

1. **SHOULD NOT** be used for any Medication that is covered under a prescription drug program benefit where Prior Auth is provided by another electronic exchange process (e.g. NCPCP SCRIPT)

#### Prior Authorization Process
The prior authorization process from the EHR side consists of five steps:

1. Determine whether prior authorization is required and if so, the documentation required by the payer to support the authorization
2. Gather information necessary to support the prior authorization request
3. Submit the request for prior authorization
4. Monitor the prior authorization request for resolution
5. If need be, supplement the prior authorization request with additional required information (and resume at step #4).  See section 5.2.9 for when and how updates are made.

{::options parse_block_html="false" /}
<figure>
  <img style="padding-top:0;padding-bottom:30px" width="800px" src="pas-flow.png" alt="High-level PAS workflow"/>
  <figcaption>Figure 2.3 - High-level PAS Workflow</figcaption>
</figure>
{::options parse_block_html="true" /}

NOTE:

1. The intermediary **SHALL** always exchange a FHIR bundle with the EHR (on left in the drawing above)
2. The intermediary **SHALL** convert the FHIR bundle to and from an X12 278 (and optionally to an X12 275) if necessary to meet the HIPAA  transaction requirements
3. The intermediary is responsible for obtaining a status of the PA request from the Payer (may use the X12 278 Inquiry) when requested by the EHR
4. The intermediary **MAY** convert the X12 278 to and from a FHIR bundle and exchange it with a payer as long as the PA request and response are in an X12 278 format at some time between the exchange with the EHR  and the payer

#### Is Prior Authorization Required?
In some cases, the provider may know beforehand whether PA is required for a given service (either because of intimate familiarity with a given payer's requirements or because of broad consistency across payers).  However, in most cases, the need for prior authorization will be uncertain.  Ideally, initiation of prior authorization will occur as part of a workflow that includes verification of payer coverage and determination that prior authorization is required using the [Coverage Requirements Discovery (CRD)](http://www.hl7.org/fhir/us/davinci-crd) implementation guide.  As shown in the above diagram, this can be accomplished using [CDS Hooks](https://cds-hooks.hl7.org). The goal of the Burden Reduction IGs is to move from Telephone, FAX, Portal, and mail to electronic transaction defined by these three IGs.  We recognize it will take time for provider and payer to fully implement these IGs and that certain PAs may never be implemented due to complexity.  However, the intent is to move as rapidly as possible to full support of these IGs by Payer, providers and any required intermediaries.

#### Gather Prior Authorization Information
Again, in some cases, the provider may know exactly what information needs to be provided in a prior authorization request for a particular type of service from a given payer.  When this is not known, the vendor website or phone calls may help determine the required information, though this is sometimes an iterative process - certain information may trigger the need for additional information, which may then trigger the need for yet more information.  Historically, this process has been handled by submitting an initial prior authorization request and then responding to payer requests for additional detail through the submission of supplementary attachments.

However, with the [Documentation Templates and Rules (DTR)](http://www.hl7.org/fhir/us/davinci-dtr) implementation guide, the EHR can retrieve relevant payer documentation rules in computable form, as well as associated FHIR questionnaires to support the assembly of information for a prior authorization. The provider can use the resulting automated process to assemble the required documentation to support the prior authorization request.  As well, DTR enables the EHR system or a launched SMART on FHIR application to retrieve information from the patient's record that is necessary to support the prior authorization request.  DTR also allows prompting for information that can't be (automatically) found in the patient's clinical record and/or to allow the provider to attest that the information is present in the record without actually exchanging it.

As a result, with DTR, it is possible to minimize or eliminate the need for multiple back-and-forth 'supplemental documentation' exchanges and to maximize the likelihood that the submitted prior authorization supporting information is suitable for automated decision making.

Information gathered to support prior authorization is expected to be stored in the EHR in addition to being used as part of the prior authorization request process.  As well, EHRs **SHOULD** annotate their orders with the decisions contained in the PAS Response.  Guidance on how to annotate the orders is not included in this IG as it was determined to be EHR-specific.

Also see the section below on [supporting information](#supporting-information).

#### Submit Prior Authorization
Prior to sending clinical data as part of the PAS exchange, the provider (or their designated agent) **SHALL** have the ability, but not an obligation, to review patient information and where appropriate amend or withhold the submission to comply with current regulations and relevant provider policies.  The provider can choose to turn off the ability to review documentation. The vendor must allow them this option.

The prior authorization request will involve a FHIR operation, passing in a Bundle of FHIR resources that includes the authorizing request as well as any other necessary supporting information.  That operation will typically (for HIPAA reasons) be invoked on an intermediary that will translate the request into the corresponding X12 messages.  However, where there is no regulatory requirement for X12 use (e.g. if this specification is adopted in non-U.S. environments, for non-HIPAA-covered payers, or under a granted exception), the operation could potentially be invoked directly on the payer system.

The payer system is expected to immediately generate an automated response.  Ideally, this will represent a final decision on the prior authorization request.  However, in some cases, it may be necessary to submit textual documentation that will require semi-automated or manual review by the payer.  In these situations, the prior authorization response will have a status of 'pended' and will be pended by the payer.  In either event, if the response is provided via X12, the intermediary will convert the X12 back to FHIR and will return the result as the result of the synchronous operation.

#### Monitor for Resolution
In those situations where the prior authorization request is ‘pended’, the EHR must monitor for changes to the request until the results are finalized. This monitoring might be done by the system of the provider that submitted the request for prior authorization, and/or the system of the provider that is expected to actually perform the authorized procedure (e.g. the family physician system or the imaging center system).

A PAS Subscription has been created to allow systems to monitor for specific requests.  In response to a subscription notification indicating that the prior authorization has been changed, there is an inquiry operation that allows for returning information about prior authorization submissions.  This operation can also be used for generic inquiries about a prior submission.

There is also guidance on monitoring in the CDex IG: [Using CDex Attachments with DaVinci PAS](http://build.fhir.org/ig/HL7/davinci-ecdx/burden-reduction.html)

Also, in situations where a request is 'pended', there may occasionally be a need to update the authorization request.  This might involve the provider canceling it or adjusting the description of the procedure for which authorization is requested (e.g. minor change to a procedure, update to the timeframe or dosage based on new clinical information).

### Supporting Information
To evaluate whether a given service will be covered, a payer may need to understand additional information about the patient.  There are three main categories of such information:

1.	Attestation by the provider as to the patient's need for a specific treatment or service.  In this case, there is no specific clinical data required.  Such attestations are generally collected as answers to questions as part of FHIR QuestionnaireResponses completed within the EHR or via a SMART on FHIR application.

2.	Structured clinical data that is available through the EHR's FHIR APIs. This might include laboratory results, scores or assessments, past medications or procedures represented using the appropriate US Core profiles.  Based on discussions with payers that currently provide real-time responses for prior authorization transactions, the combination of attestation and structured clinical data may result in far more real-time answers to PA requests.

3.	Information that is traditionally not structured, or where the review process is more involved and will not be performed in real time. In this use case, additional information may be in the form of progress notes, therapy notes, diagnostic reports, etc.  This information will be exchanged as text or images using the document reference.  Where such information is necessary, the initial request will typically be 'pended', with a final decision returned later once manual review is complete.  All exchanges should meet Federal and state regulations, including any HIPAA restrictions and restrictions on sensitive data.

[Next Page - Request for Additional Information](additionalinfo.html)