{% raw %}
{% endraw %}
<!--ReleaseHeader-->
<p style="background-color: yellow; border: 1px solid maroon; padding: 5px;">
  This is the {{site.data.info.ballotstatus}} version of the {{site.data.fhir.igTitle}} Implementation Guide,  based on <a href="{{site.data.fhir.path}}">FHIR Version {{site.data.fhir.version}}</a>.  
  See the <a href="{{site.data.fhir.canonical}}/history.html">Directory of published versions</a> for other versions and for a change history.<br/>
  This specification was developed by <a href="{{site.data.fhir.ig.contact[0].telecom[0]}}">{{site.data.fhir.ig.publisher}}</a>
</p>
<!--EndReleaseHeader-->
<blockquote class="stu-note">
<p>
This specification is currently undergoing ballot and connectathon testing.  It is expected to evolve, possibly significantly, as part of that process.
</p>
<p>
Feedback is welcome and may be submitted through the <a href="http://hl7.org/fhir-issues">FHIR change tracker</a> indicating "US Da Vinci PAS" as the specification.
</p>
<p>
This implementation guide is dependent on other specifications.  Please submit any comments you have on these base specifications as follows:
</p>
<ul>
  <li>Feedback on the FHIR core specification should be submitted to the <a href="http://hl7.org/fhir-issues">FHIR change tracker</a> with "FHIR Core" as the specification.</li>
  <li>Feedback on the US core profiles should be submitted to the <a href="http://hl7.org/fhir-issues">FHIR change tracker</a> with "US Core" as the specification.</li>
</ul>
<p>
Individuals interested in participating in the Prior Authorization Support or other HL7 Da Vinci projects can find information about Da Vinci [here](http://www.hl7.org/about/davinci).
</p>

<p>
Note that this implementation guide is intended to support mapping between FHIR and X12 transactions.  To respect X12 intellectual property, all mapping and X12-specific terminology information will be solely published by X12 and made available in accordance with X12 rules - which may require membership and/or payment.
</p>
</blockquote>


### Overview
Prior authorization is an essential process in the management of healthcare costs by payer organizations.  However, the process of requesting and receiving prior authorizations can be slow and inefficient.  U.S. regulations mandate that X12 be used for communicating prior authorization requests and responses.  However, few electronic health record (EHR) systems have implemented this interface.  As a result, prior authorizations are often solicited by fax or by using payer-specific portals where clinicians re-key relevant information.  Fax submission requires manual transcription on the payer side - and may result in significant back-and-forth requesting additional information prior to a decision being made.  Re-keying information is inefficient and can result in data entry errors.

This implementation guide strives to enable direct submission of prior authorization requests from EHR systems using a standard already widely supported by most EHRs - FHIR.  To meet regulatory requirements, these FHIR interfaces will communicate with an intermediary who, when necessary, can convert the FHIR requests to the corresponding X12 instances prior to passing the requests to the payer.  Responses are handled by a reverse mechanism (payer to intermediary as X12, then converted to FHIR and passed to the EHR).  Direct submission of prior authorization requests from the EHR will reduce costs for both providers and payers and result in faster prior authorization decisions - resulting in improved patient care and experience.

When combined with the Da Vinci [Coverage requirements Discovery (CRD)](http://www.hl7.org/fhir/us/davinci-crd) and [Documentation Templates and Rules (DTR)](http://www.hl7.org/fhir/us/davinci-dtr) implementation guides, direct submission of prior authorization requests will further increase efficiency by ensuring that authorizations are always sent when (and only when) necessary and that such requests will almost always contain all relevant information needed to make the authorization decision on initial submission.

The implementation guide also defines capabilities around the management of prior authorization requests, including checking the status of a previously submitted request, revising a previously submitted request and cancelling a request.

Note that all mappings between FHIR and X12 transactions developed as part of this project will be published by X12, not HL7, in order to respect X12 intellectual property.  X12 membership and/or payment may be required in order to access those mappings.


### Content and organization
The implementation guide is organized into the following sections:

* [Use Cases and Overview](usecases.html) describes the intent of the implementation guide, gives examples of its use and provides a high-level overview of expected process flow
* [Technical Background](background.html) describes the different specifications this implementation guide relies on and indicates what developers should read and understand prior to implementing this specification
* [Formal Specification](spec.html) covers the detailed implementation requirements and conformance expectations
* [Artifacts](allartifacts.html) introduces and provides links to the FHIR [R4](artifacts.html) profiles, operations and other FHIR artifacts used in this implementation guide
* [Downloads](downloads.html) allows download of this and other specifications as well as other useful files
* [Credits](credits.html) identifies the individuals and organizations involved in developing this implementation guide


### Dependencies
This implementation guide relies on the following other specifications:
* **[FHIR R4]({{site.data.fhir.path}})** - The 'current' official version of FHIR as of the time this implementation guide was published.  See the [background page](background.html#fhir) for key pieces of this specification implementers should be familiar with.
* **[US Core STU3 - draft](http://hl7.org/fhir/us/core/2019Jan)** - The balloted version of US Core based on FHIR R4.  This implementation guide will be updated to be based on the final R4 release once it is published.

This implementation guide defines additional constraints and usage expectations above and beyond the information found in these base specifications.