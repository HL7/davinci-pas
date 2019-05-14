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
</blockquote>


### Overview
TODO - why this IG exists


### Content and organization
The implementation guide is organized into the following sections:

* [Use Cases and Overview](usecases.html) describes the intent of the implementation guide, gives examples of its use and provides a high-level overview of expected process flow
* [Technical Background](background.html) describes the different specifications this implementation guide relies on and indicates what developers should read and understand prior to implementing this specification
* [Formal Specification](spec.html) covers the detailed implementation requirements and conformance expectations
* [Artifacts](allartifacts.html) introduces and provides links to the FHIR [STU3](STU3/artifacts.html) and [R4](artifacts.html) profiles, operations and other FHIR artifacts used in this implementation guide
* [Downloads](downloads.html) allows download of this and other specifications as well as other useful files
* [Credits](credits.html) identifies the individuals and organizations involved in developing this implementation guide


### Dependencies
This implementation guide relies on the following other specifications:
* **[FHIR R4]({{site.data.fhir.path}})** - The 'current' official version of FHIR as of the time this implementation guide was published.  See the [background page](background.html#fhir) for key pieces of this specification implementers should be familiar with.
* **[FHIR STU3](http://hl7.org/fhir/STU3)** - The prior official version of FHIR, also supported as part of this implementation guide and has differences in the resource structures, data elements and terminologies from the R4 release
* **[US Core STU2](http://hl7.org/fhir/us/core)** - Defines profiles on FHIR STU3 that constrain it for use in the U.S. context
* **[US Core STU3 - draft](http://hl7.org/fhir/us/core/2019Jan)** - The balloted version of US Core based on FHIR R4.  This implementation guide will be updated to be based on the final R4 release once it is published.

This implementation guide defines additional constraints and usage expectations above and beyond the information found in these base specifications.