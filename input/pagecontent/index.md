{% raw %}
<blockquote class="stu-note">
<p>
This specification is currently published as a Standard for Trial Use (STU).  Feedback is welcome and may be submitted through the <a href="http://hl7.org/fhir-issues">FHIR change tracker</a> indicating "US Da Vinci PAS" as the specification.
</p>
<p>
This implementation guide is dependent on other specifications.  Please submit any comments you have on these base specifications as follows:
</p>
<ul>
  <li>Feedback on the FHIR core specification should be submitted to the <a href="http://hl7.org/fhir-issues">FHIR change tracker</a> with "FHIR Core" as the specification.</li>
  <li>Feedback on the US core profiles should be submitted to the <a href="http://hl7.org/fhir-issues">FHIR change tracker</a> with "US Core" as the specification.</li>
</ul>
<p>
Individuals interested in participating in the Prior Authorization Support or other HL7 Da Vinci projects can find information about Da Vinci <a href="http://www.hl7.org/about/davinci">here</a>.
</p>
<p>
Note that this implementation guide is intended to support mapping between FHIR and X12 transactions.  To respect X12 intellectual property, all mapping and X12-specific terminology information will be solely published by X12 and made available in accordance with X12 rules - which may require membership and/or payment.  Please see this <a href="https://confluence.hl7.org/display/DVP/Da+Vinci+Reference+to+External+Standards+and+Terminologies">Da Vinci External Reference page</a> for details on how to get this mapping.
</p>
<p>
Several of the profiles will require use of terminologies that are part of X12 which we anticipate being made publicly available.  At such time as this occurs, the implementation guide will be updated to bind to these as external terminologies.
</p>
</blockquote>
{% endraw %}


### Overview
Prior authorization is a process commonly used by payer organizations to manage healthcare costs.  However, the process of requesting and receiving prior authorizations can be slow and inefficient.  The Administrative Simplification provisions of HIPAA mandate that the X12 278 Health Care Services Review Request for Review and Response be used for communicating prior authorization requests and responses.  While few electronic health record (EHR) systems have implemented this interface, this functionality is often implemented as a portal solution and/or as a part of Practice Management and Revenue Cycle Management solutions.  As a result, prior authorizations are often solicited by fax or by using payer-specific portals where clinicians re-key relevant information.  Fax submission requires manual transcription on the payer side - and may result in significant back-and-forth requesting additional information prior to a decision being made.  Re-keying information is inefficient and can result in data entry errors.

This implementation guide strives to enable direct submission of prior authorization requests from EHR systems using a standard already widely supported by most EHRs - FHIR.  To meet regulatory requirements, these FHIR interfaces will communicate with an intermediary who, when necessary, can convert the FHIR requests to the corresponding X12 instances prior to passing the requests to the payer.  Responses are handled by a reverse mechanism (payer to intermediary as X12, then converted to FHIR and passed to the EHR).  Direct submission of prior authorization requests from the EHR will reduce costs for both providers and payers.  It will also result in faster prior authorization decisions which will lead to improved patient care and experience.

When combined with the Da Vinci [Coverage Requirements Discovery (CRD)](http://www.hl7.org/fhir/us/davinci-crd) and [Documentation Templates and Rules (DTR)](http://www.hl7.org/fhir/us/davinci-dtr) implementation guides, direct submission of prior authorization requests will further increase efficiency by ensuring that authorizations are always sent when (and only when) necessary, and that such requests will almost always contain all relevant information needed to make the authorization decision on initial submission.

The implementation guide also defines capabilities around the management of prior authorization requests, including checking the status of a previously submitted request, revising a previously submitted request and cancelling a request.

A high-level summary of how all of these IGs will work together can be seen below:

{::options parse_block_html="false" /}
<figure>
  <img style="padding-top:0;padding-bottom:0px" width="1000px" src="pa-stack.png" alt="Diagram showing interaction of CRD, DTR and PAS"/>
  <figcaption>Figure 1.1 - Interaction of CRD, DTR, and PAS</figcaption>
</figure>
{::options parse_block_html="true" /}

### CMS Exception
When using PAS under the CMS granted exception (Request Number: HL7 FHIR Exception #2021031001), the implementer(s) SHALL disregard any requirements in this Implementation Guide to translate the PAS FHIR Bundle into or out of the X12 278.  The defined PAS FHIR request bundles SHALL be transmitted intact between the provider and payer.  The PAS FHIR response bundles SHALL be transmitted intact between the payer and the provider.

### Content and organization
The implementation guide is organized into the following sections:

* [Use Cases and Overview](usecases.html) describes the intent of the implementation guide, gives examples of its use and provides a high-level overview of expected process flow
* [Technical Background](background.html) describes the different specifications this implementation guide relies on and indicates what developers should read and understand prior to implementing this specification
* [HIPAA Regulations](regulations.html) explains the relevant portions of the regulatory context in which this implementation guide operates
* [Formal Specification](specification.html) covers the detailed implementation requirements and conformance expectations
* [Artifacts](fhirArtifacts.html) introduces and provides links to the FHIR [R4](artifacts.html) profiles, operations and other FHIR artifacts used in this implementation guide
* [Downloads](downloads.html) allows download of this and other specifications as well as other useful files
* [Credits](credits.html) identifies the individuals and organizations involved in developing this implementation guide


### Dependencies
This implementation guide relies on the following other specifications:
* **[FHIR R4]({{site.data.fhir.path}})** - The 'current' official version of FHIR as of the time this implementation guide was published.  See the [background page](background.html#fhir) for key pieces of this specification implementers should be familiar with.
* **[US Core]({{site.data.fhir.hl7_fhir_us_core}})** - The published version of US Core based on FHIR R4.

This implementation guide defines additional constraints and usage expectations above and beyond the information found in these base specifications.

{% raw %}
<blockquote class="stu-note">
<p>
For Version 1.1, there were a number of changes made due to issues raised during the current STU period:
</p>
<ul>
	<li>Organization profiles were changed: (FHIR-30880)
			<ul>
				<li>Address changed from 1..1 to 0..1</li>
				<li>Value set changed from https://valueset.x12.org/x217/005010/request/2010B/NM1/1/01/00/98 to https://valueset.x12.org/x217/005010/response/2010B/NM1/1/01/00/98</li>
			</ul>
	</li>
	<li>The AuthorizedProvider profile has a new providerType CodeableConcept added to it. (FHIR-30881)</li>
	<li>Added NDC codes and a "not applicable" code to the X12278RequestedServiceType value set. (FHIR-30882)</li>
	<li>Created a new value set for the service modifier types that only has CPT and HCPCS codes. (FHIR-30883)</li>
	<li>Changed the modifier value in the AuthorizedDetail extension to be 0..* instead of 0..1. (FHIR-30884)</li>
	<li>Added an extension for state to the new PASIdentifier datatype. (FHIR-30885).</li>
	<li>Added a constraint to all dates that are used to ensure that a full date is being sent. (FHIR-30886)</li>
	<li>The Admission date period was change to two separate periods to handle a range of admission dates and a separate range of discharge dates. (FHIR-30887)</li>
	<li>Fix the extensions on CommunicationRequest to be on the CommunicationRequest.payload where they were intended. (FHIR-30888)</li>
	<li>All references on elements that are marked as Must Support now reference either PAS or US-Core profiles. (FHIR-30890)</li>
	<li>The Additional Information supporting info section has had a note added to indicate that the PASDocumentReference profile is the preferred profile for sending extra documentation. (FHIR-31024)</li>
	<li>New Identifier profile created (PASIdentifier) with the required extensions and uses of Identifier in Claim and ClaimResponse profiles changed to PASIdentifier. (FHIR-31025, FHIR-31372)</li>
	<li>Added CommunicatedDiagnosis to ClaimResponse and ClaimInquiryResponse. (FHIR-31086, FHIR-31370)</li>
	<li>Changed Certification Issue Date, Certification Effective Date, and Certifacation Expiration Date to be a date or a period to handle searching by a range. (FHIR-31373)</li>
	<li>Added short descriptions to every use of an extension and every Claim.supportingInfo slice. (FHIR-31414)</li>
	<li>Added a note to any value set that includes CPT and HCPCS codes that X12 will identify those codes as being HCPCS no matter what was originally sent in. (FHIR-31630)</li>
	<li>Created a PASOrganization profile on Organization and used the PASIdentifier datatype on Practitioner and Organization. (FHIR-32427)</li>
	<li>Change the cardinality of the ReviewAction reasonCode to be 0..*. (FHIR-32426)</li>
	<li>Add the ItemTraceNumber extension to ClaimInquiryResponse profile and make it 0..*. (FHIR-32425, FHIR-32891)</li>
	<li>Fix the Claim inquiry operation endpoint to be $inquiry instead of $submit. (FHIR-31948)</li>
	<li>Add language to the Home Page about ability to not convert into and out of an X12 278. (FHIR-32867)</li>
	<li>Add language to the Specification to allow other methods of exchanging the FHIR Bundle besides the X12 275. (FHIR-32866)</li>
	<li>Change extension names to more closely match their IDs. (FHIR-32877)</li>
	<li>Add a line number extension to the CommunicationRequest payload. (FHIR-32878)</li>
	<li>Revise the language about how Prior Authorizations are cancelled. (FHIR-32112)</li>
	<li>Move the ReviewAction extension from the ClaimResponse.item to the ClaimResponse.item.adjudication. (FHIR-32900)</li>
	<li>Fix the bindings for the CareTeam roles. (FHIR-32954)</li>
	<li>Remove mandatory XML support and make only JSON the allowed exchange format. (FHIR-33059)</li>
</ul>
</blockquote>
{% endraw %}
