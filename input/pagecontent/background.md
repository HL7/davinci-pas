[Previous Page - Use Cases](usecases.html)

### Da Vinci
Da Vinci is an industry sponsored project which is contributing to the development of HL7 standards.  It brings together the U.S. payer, providers, and technology suppliers (including EHR vendors)  to help payers and providers to positively impact clinical, quality, cost, and care management outcomes using FHIR-related technologies. The project organizes meetings (face-to-face and conference calls) as well as connectathons to find ways to leverage FHIR technologies to support and integrate value-based care (VBC) data exchange across communities. Da Vinci identifies value-based care use cases of interest to its members and the community as a whole.

The process that Da Vinci has adopted includes: 
1. identify business, clinical, technical, and testing requirements, 
2. develop and ballot a FHIR based implementation guide (IG),
3. develop a reference implementation (RI) that is used to demonstrate that the concepts in the IG are possible to implement,
4. pilot the standard,
5. support the production use of the IG to enable exchange of data to support interoperability for value-based care.

Additional information about Da Vinci, its members, the use cases and the implementation guides being developed can all be found on the [HL7 website](http://www.hl7.org/about/davinci). Meeting minutes and other materials can be found on the [Da Vinci Confluence page](https://confluence.hl7.org/display/DVP).

{% include burdenReduction.md %}


### Systems
The PAS implementation guide defines the responsibilities of the two types of systems involved in a PAS solution:

**Client systems** are typically Electronic Medical Record (EMR) systems but could theoretically be any system responsible for requesting prior authorizations .  (E.g. practice management systems, pharmacy systems (for drugs that are part of a medical benefit), dental systems, etc.)

**Server systems** (or servers) are typically intermediary systems that act on behalf of payer organizations and are responsible for the conversion of prior authorization requests to and from X12 for subsequent relay to payer systems.  In some cases, a server system may directly be a payer system (if X12 translation is not required by regulation).

### Underlying Technologies
This guide is based on the [HL7 FHIR]({{site.data.fhir.path}}index.html) standard.  Implementers of this specification therefore need to understand some basic information about these specifications.

#### FHIR
This implementation guide uses terminology, notations and design principles that are
specific to FHIR.  Before reading this implementation guide, it's important to be familiar with some of the basic principles of FHIR, as well as general guidance on how to read FHIR specifications.  Readers who are unfamiliar with FHIR are encouraged to read (or at least skim) the following prior to reading the rest of this implementation guide.

* [FHIR Overview]({{site.data.fhir.path}}overview.html)
* [Developer's Introduction]({{site.data.fhir.path}}overview-dev.html) (or [Clinical Introduction]({{site.data.fhir.path}}overview-clinical.html))
* [FHIR Data Types]({{site.data.fhir.path}}datatypes.html)
* [Using Codes]({{site.data.fhir.path}}terminologies.html)
* [References between Resources]({{site.data.fhir.path}}references.html)
* [How to Read Resource & Profile Definitions]({{site.data.fhir.path}}formats.html)
* [Base Resource]({{site.data.fhir.path}}resource.html)

This implementation guide supports the [R4]({{site.data.fhir.path}}index.html) version of the FHIR standard.

This implementation guide also builds on the [US Core (STU3 - R4 based)]({{site.data.fhir.hl7_fhir_us_core}}) Implementation Guide and implementers need to familiarize themselves with the profiles in that IG.

##### Must Support
The Profile elements consist of both Mandatory and Must Support elements. Mandatory elements are elements with a minimum cardinality of 1 (min=1). The base [FHIR Must Support]({{site.data.fhir.path}}profiling.html#mustsupport) guidance requires specifications to define the support expected for profile elements labeled Must Support.  The HRex IG defines some [conformance expectations](http://hl7.org/fhir/us/davinci-hrex/conformance.html) that all Da Vinci IGs are expected to follow.  Along with those expectations, the following rules on MustSupport are also required:

* PA Intermediary Systems **SHALL** be capable of processing all data elements that are marked as Must Support on the Claim Request and Claim Inquiry.  They **SHALL** not generate an error or cause the application to fail due the presence of any data element marked as Must Support.
* PA Intermediary Systems **SHALL** be capable of returning resource instances containing any of the data elements that are marked as Must Support on the Claim Response and the Claim Inquiry Response.
* PA Client Systems **SHALL** be capable of receiving all data elements that are marked as Must Support on the Claim Response and the Claim Inquiry Response.  They **SHALL** not generate an error or cause the application to fail when receiving any data element that is marked as Must Support.
* PA Client Systems **SHOULD NOT** send any data elements that are not marked as Must Support.  If these data elements are included in a Claim Request or Claim Inquiry, the receiving PA Intermediary System **MAY** ignore those elements.


#### ASC X12N
The intention of this implementation guide is that detailed knowledge of X12N is not required by client/EHR implementers, though knowledge of some value sets and business processes will be needed. Intermediary systems will require an intimate understanding of the X12N specification, particularly the 278 and 275 transactions.  The following X12 Standards are referenced in this guide:

* ASC X12N/005010X217 - Health Care Services Review - Request for Review and Response (278) - provide standardized data requirements and content for all users who request authorizations or certifications or who respond to such requests 
* ASC X12N/005010X215 - Health Care Services Review - Inquiry and Response (278) - provide standardized data requirements and content for all users who inquire on authorizations or certifications or who respond to such inquiries
* ASC X12N/006020X316 - Additional Information to Support a Health Care Services Review (275) - provide standardized data requirements and content to send additional information about a healthcare service review

NOTE: At the time of publication, only the use of ASC X12N/005010X217 is mandated by HIPAA.

##### X12 Terminology

All of the X12 Terminology is copyright of the X12 organization.  All of the code systems and value sets that are referenced use URLs that are provided by X12.  The intent of the X12 organization is to have those URLs resolve for members.  It is also possible to find the relevant codes by referencing the [X217](https://x217-005010.x12.org/) and [X215](https://x215-005010.x12.org/) Technical Reports in X12's Glass viewer.  (NOTE: The links to the X12 Technical Reports will only be visible to X12 members.)  Further information on the use of X12 terminology in HL7 can be found at the [HL7 Terminology Authority X12 page](https://confluence.hl7.org/display/TA/X12).

The different components of the X12 ValueSet URLs can be interpreted as follows:

1. valueset.x12.org
2. TR3 ID, eg. x217, x215
3. TR3 Version, eg. 005010
4. 'request' or 'response'
5. loop ID, eg. 2010EA
6. segment ID, eg. NM1
7. segment repetition, eg. 1
8. data element position, eg. 06
9. data subelement position, eg. 00
9. data element number, eg. 1338

Thus any URL can be parsed to determine where to find the set of codes in the appropriate X12 Technical Report.

[Next Page - HIPPA Regulations](regulations.html)