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

* PA Intermediary Systems **SHALL** be capable of processing all data elements that are marked as Must Support on the Claim Request and Claim Inquiry.  They **SHALL NOT** generate an error or cause the application to fail due the presence of any data element marked as Must Support.
* PA Intermediary Systems **SHALL** be capable of returning resource instances containing any of the data elements that are marked as Must Support on the Claim Response and the Claim Inquiry Response.
* PA Client Systems **SHALL** be capable of receiving all data elements that are marked as Must Support on the Claim Response and the Claim Inquiry Response.  They **SHALL NOT** generate an error or cause the application to fail when receiving any data element that is marked as Must Support.
* PA Client Systems **SHOULD NOT** send any data elements that are not marked as Must Support.  If these data elements are included in a Claim Request or Claim Inquiry, the receiving PA Intermediary System **MAY** ignore those elements.


### Interoperability Expectations
<div class="new-content"  markdown="1">
<a name="FHIR-50469"> </a>
For the PAS specification to work successfully at scale, it is essential that PAS clients and servers be able to interoperate with each other without custom expectations or deviations driven by EHR-specific or payer-specific requirements. The following rules are intended to help drive such consistency:

When processing prior auth requests and additional data submissions, PAS services **SHALL NOT** depend on or set expectations for the inclusion of resource instances not compliant with profiles defined in this guide, CRD, DTR, HRex, or US Core. Similarly, they **SHALL NOT** depend on or set expectations for the inclusion of any data elements not marked as mandatory (min cardinality >= 1) or mustSupport in those profiles.

1. In the event a need to communicate data structures or elements not covered as required or mustSupport in the specification and there are not rules in X12 for the mapped element that would require the element to be present, the organization identifying the requirement has two choices:
    * gather the additional data using questionnaires via DTR
    * submit change requests proposing adding the relevant profiles and/or mustSupport elements to a future version of the PAS specification. If the proposed change is adopted and published in the PAS continuous integration build or the CI build of one of its dependencies (e.g. US Core), implementations **MAY**, by mutual agreement, pre-adopt the use of those additional profiles and/or mustSupport data elements and not be considered in violation of #1 above.
2. Where cardinality and other constraints present in profiles allow data elements to be omitted, PAS compliant systems **SHALL NOT** treat the omission of those elements as a conformance error. PAS responses are free to reject claims due to missing elements, but not treat the omission of non-required elements as an error resulting in a 4xx.
3. PAS clients and services **SHALL** use standard PAS data elements (i.e. elements found within PAS-defined or inherited profiles and marked as mandatory or mustSupport) to communicate needed data if such elements are intended to convey such information. (If an organization believes they have a requirement for a data element not marked as mustSupport in the PAS or inherited profiles, they should raise the requirement for discussion on the [PAS stream] on chat.fhir.org.)
4. PAS implementing organizations **SHALL NOT** publish guidance setting expectations for where certain data elements are conveyed within PAS and inherited data structures, but **MAY** submit change requests to PAS, HRex, or US Core requesting that additional guidance be provided to implementers on data structure usage to increase consistency across implementations.
</div>