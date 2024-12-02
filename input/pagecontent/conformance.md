[Previous Page - Request for Additional Info](additionalinfo.html)

### Systems
The PAS implementation guide defines the responsibilities of the two types of systems involved in a PAS solution:

[**Client systems**](CapabilityStatement-EHRCapabilities.html) are typically Electronic Medical Record (EHR) systems but could theoretically be any system responsible for requesting prior authorizations .  (E.g. practice management systems, pharmacy systems (for drugs that are part of a medical benefit), dental systems, etc.). 

[**Server systems**](CapabilityStatement-IntermediaryCapabilities.html) (or servers) are typically intermediary systems that act on behalf of payer organizations and are responsible for the conversion of prior authorization requests to and from X12 for subsequent relay to payer systems.  In some cases, a server system may directly be a payer system (if X12 translation is not required by regulation).

### MustSupport
This implementation guide uses specific terminology to flag statements that have relevance for the evaluation of conformance with the guide:

* **SHALL** indicates requirements that must be met to be conformant with the specification.

* **SHOULD** indicates behaviors that ought to be adhered to to avoid suboptimal interoperability but which do not, for this version of the specification, affect the determination of specification conformance.

* **MAY** describes optional behaviors that are free to consider but where there is no recommendation for or against adoption.

As well, profiles in this implementation guide make use of the [mustSupport]({{site.data.fhir.path}}profiling.html#mustsupport) element.  Base expectations for the intepretations of these terms are set in the [FHIR core specification]({{site.data.fhir.path}}conformance-rules.html#conflang) and general Da Vinci-wide expectations are [defined in HRex]({{site.data.fhir.ver.hrex}}/conformance.html).  Also see the mustSupport rules for the [HRex]({{site.data.fhir.ver.hrex}}/conformance.html#mustsupport) and [US Core]({{site.data.fhir.ver.uscore7}}/must-support.html) implementation guides, which apply to content adhering to data elements profiled in those guides.

Along with those expectations, the following rules on MustSupport are also required:

* PA Intermediary Systems **SHALL** be capable of processing all data elements that are marked as Must Support on the Claim Request and Claim Inquiry.  They **SHALL** not generate an error or cause the application to fail due the presence of any data element marked as Must Support.
* PA Intermediary Systems **SHALL** be capable of returning resource instances containing any of the data elements that are marked as Must Support on the Claim Response and the Claim Inquiry Response.
* PA Client Systems **SHALL** be capable of receiving all data elements that are marked as Must Support on the Claim Response and the Claim Inquiry Response.  They **SHALL** not generate an error or cause the application to fail when receiving any data element that is marked as Must Support.
* PA Client Systems **SHOULD NOT** send any data elements that are not marked as Must Support.  If these data elements are included in a Claim Request or Claim Inquiry, the receiving PA Intermediary System **MAY** ignore those elements.

[Next Page - HIPAA Regulations](regulations.html)