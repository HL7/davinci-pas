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
