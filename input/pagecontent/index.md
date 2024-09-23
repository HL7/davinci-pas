{% raw %}
<blockquote class="stu-note">
<p>
This specification is currently published as a Standard for Trial Use (STU).  Feedback is welcome and may be submitted through the <a href="http://hl7.org/fhir-issues">FHIR change tracker</a> indicating "US Da Vinci PAS" as the specification.
</p>
<p>
Individuals interested in participating in the Prior Authorization Support or other HL7 Da Vinci projects can find information about Da Vinci <a href="http://www.hl7.org/about/davinci">here</a>.
</p>
<p>
Note that this implementation guide is intended to support mapping between FHIR and X12 transactions.  To respect X12 intellectual property, all mapping and X12-specific terminology information will be solely published by X12 and made available in accordance with X12 rules - which may require membership and/or payment.  Please see this <a href="https://confluence.hl7.org/display/DVP/Da+Vinci+Reference+to+External+Standards+and+Terminologies">Da Vinci External Reference page</a> for details on how to get this mapping.
</p>
<p>
There are many situationally required fields that are specified in the X12 TRN03 guide that do not have guidance in this Implementation Guide.  Implementers need to consult the X12 PAS guides to know the requirements for these fields.
</p>
<p>
Several of the profiles will require use of terminologies that are part of X12 which we anticipate being made publicly available.  At such time as this occurs, the implementation guide will be updated to bind to these as external terminologies.
</p>
<p>
There are a number of examples that still need to be created and included in this guide.  They are not included in the STU preview version of the guide but will be included for publication.  These are:
<ul>
	<li>Reject Authorization example</li>
	<li>PEND/DENY response example</li>
	<li>Subscription, SubscriptionNotification, related ClaimInquiry examples</li>
	<li>Error Response</li>
</ul>
</p>
</blockquote>

<blockquote class="dragon">
<p> This is a review version of the specification for the STU2.1 release.  Due to a late-breaking discovery, it is missing a key ability - the ability to send back items in the response that differ in what was authorized from what was requested.  We are adding narrative around this as well as adding to the ClaimResponse profile.  At this time, reviewers should not review the ClaimResponse profile until the final snapshot has been created.
</p>
</blockquote>
{% endraw %}

### Overview
Prior authorization is a process commonly used by payer organizations to manage healthcare costs.  However, the process of requesting and receiving prior authorizations can be slow and inefficient.  The Administrative Simplification provisions of HIPAA mandate that the X12 278 Health Care Services Review Request for Review and Response be used for communicating prior authorization requests and responses.  While few electronic health record (EHR) systems have implemented this interface, this functionality is often implemented as a portal solution and/or as a part of Practice Management and Revenue Cycle Management solutions.  As a result, prior authorizations are often solicited by fax or by using payer-specific portals where clinicians re-key relevant information.  Fax submission requires manual transcription on the payer side and may result in significant back-and-forth requesting additional information prior to a decision being made.  Re-keying information is inefficient and can result in data entry errors.

This implementation guide strives to enable direct submission of prior authorization requests from EHR systems using a standard already widely supported by most EHRs - FHIR.  To meet regulatory requirements, these FHIR interfaces will communicate with an intermediary who, when necessary, can convert the FHIR requests to the corresponding X12 instances prior to passing the requests to the payer.  Responses are handled by a reverse mechanism (payer to intermediary as X12, then converted to FHIR and passed to the EHR).  Direct submission of prior authorization requests from the EHR will reduce costs for both providers and payers.  It will also result in faster prior authorization decisions which will lead to improved patient care and experience.

When combined with the Da Vinci [Coverage Requirements Discovery (CRD)](http://www.hl7.org/fhir/us/davinci-crd) and [Documentation Templates and Rules (DTR)](http://www.hl7.org/fhir/us/davinci-dtr) implementation guides, direct submission of prior authorization requests will further increase efficiency by ensuring that authorizations are always sent when (and only when) necessary, and that such requests will almost always contain all relevant information needed to make the authorization decision on initial submission.

The implementation guide also defines capabilities around the management of prior authorization requests, including checking the status of a previously submitted request, updating a previously submitted request, and canceling a request.

A high-level summary of how all of these IGs will work together can be seen below:

{::options parse_block_html="false" /}
<figure>
  <img style="padding-top:0;padding-bottom:0px" width="1000px" src="pa-stack.png" alt="Diagram showing interaction of CRD, DTR and PAS"/>
  <figcaption>Figure 1.1 - Interaction of CRD, DTR, and PAS</figcaption>
</figure>
{::options parse_block_html="true" /}

### CMS Exception
When using PAS under the [CMS granted exception](https://confluence.hl7.org/display/DVP/Da+Vinci+HIPAA+Exception) (Request Number: HL7 FHIR Exception #2021031001), the implementer(s) **SHALL** disregard any requirements in this Implementation Guide to translate the PAS FHIR Bundle into or out of the X12 278.  The defined PAS FHIR request bundles **SHALL** be transmitted intact between the provider and payer.  The PAS FHIR response bundles **SHALL** be transmitted intact between the payer and the provider.  NOTE: This CMS exception has ended as of June 2024.

### CMS Enforcement Discretion
The Office of Burden Reduction and Health Informatics (OBRHI) National Standards Group (NSG) announced an enforcement discretion that they would not enforce the requirement to use the X12 278 for prior authorization if the covered entities were using the Fast Healthcare Interoperability Resources (FHIR) based Prior Authorization API as described in the CMS Interoperability and Prior Authorization final rule (CMS-0057-F). This allows the payer to return a prior authorization number for use in the X12 837 in coverage extension of the CRD and DTR IGs or as part of the all FHIR exchange of the Prior Authorization Response Bundle in the PAS IG.

When covered entities are operating under the enforcement discretion, the trading partners **SHALL** disregard any requirements in this Implementation Guide to translate the PAS FHIR Bundle into or out of the X12 278. The defined PAS FHIR request bundles **SHALL** be transmitted intact between the provider and payer. The PAS FHIR response bundles **SHALL** be transmitted intact between the payer and the provider.

### Content and organization
The implementation guide is organized into the following sections:

* [Use Cases and Overview](usecases.html) describes the intent of the implementation guide, gives examples of its use and provides a high-level overview of expected process flow
* [Technical Background](background.html) describes the different specifications this implementation guide relies on and indicates what developers should read and understand prior to implementing this specification
* [HIPAA Regulations](regulations.html) explains the relevant portions of the regulatory context in which this implementation guide operates
* [Formal Specification](specification.html) covers the detailed implementation requirements and conformance expectations
* [ePA Coordinator](epaWorkflow.html) covers the workflow regarding the exchanges between a Provider ePA Coordinator, multiple Provider HIT systems and the payer
* [Metrics](metrics.html) describes a set of metrics that can be collected to evaluate the adoption of PAS
* [Artifacts](fhirArtifacts.html) introduces and provides links to the FHIR [R4](artifacts.html) profiles, operations and other FHIR artifacts used in this implementation guide
* [Downloads](downloads.html) allows download of this and other specifications as well as other useful files
* [Credits](credits.html) identifies the individuals and organizations involved in developing this implementation guide


### Dependencies

<div class="modified-content" markdown="1">

At present, PAS is based on [FHIR R4]({{site.data.fhir.path}}).  In addition, PAS is dependent on the [US Core 3.1 (FHIR R4)]({{site.data.fhir.ver.uscore3}}), [US Core 6.1 (FHIR R4)]({{site.data.fhir.ver.uscore6}}) and [US Core 7.0 (FHIR R4)]({{site.data.fhir.ver.uscore7}})  implementation guides.  The first is supported for those systems limited to USCDI 1 capabilities, the second is for upcoming regulatory requirements mandating support for USCDI 3, and the last is to enable support for proposed regulations mandating support for USCDI 4.  Wherever possible, Da Vinci profiles strive to comply with all three releases, simplifying implementation for those who will need to support varying regulatory expectations over time.

In some situations, the payer community requires additional constraints or needs to profile resources that are not yet supported by US Core.  In these cases, this IG does not derive from the US Core profiles, though it does align with them as much as possible.  It is possible that certain PAS profiles and/or descriptive content may migrate to a future release of US Core, and in some cases, to the base FHIR standard.
</div>

In addition, this guide uses content from the following FHIR-related specifications and implementation guides:
* [Subscriptions R5 Backport]({{site.data.fhir.ver.subscriptions}})
* [Da Vinci CRD]({{site.data.fhir.ver.crd}})
* [Da Vinci CDex]({{site.data.fhir.ver.cdex}})

This implementation guide defines additional constraints and usage expectations above and beyond the information found in these base specifications.

[Next Page - Use Cases](usecases.html)