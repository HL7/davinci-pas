### Da Vinci
Da Vinci is an industry sponsored project which is contributing to the development of HL7 standards.  It brings together the U.S. payer, providers, and technology suppliers (including EHR vendors)  to help payers and providers to positively impact clinical, quality, cost, and care management outcomes using FHIR-related technologies. The project organizes meetings (face-to-face and conference calls) as well as connectathons to find ways to leverage FHIR technologies to support and integrate value-based care (VBC) data exchange across communities. Da Vinci identifies value-based care use cases of interest to its member and the community as a whole.

The process that Da Vinci has adopted includes: 
1. identify business, clinical, technical and testing requirements, 
2. develop and ballot a FHIR based implementation guide (IG),
3. develop a reference implementation (RI) that is used to demonstrate that the concepts in the IG are possible to implement,
4. pilot the standard
5. support the production use of the IG to enable exchange of data to support interoperability for value-based care.

Additional information about Da Vinci, its members, the use cases and the implementation guides being developed can all be found on the [HL7 website](http://www.hl7.org/about/davinci). Meeting minutes and other materials can be found on the [Da Vinci Confluence page](https://confluence.hl7.org/display/DVP).

{% include burdenReduction.md %}


### Systems
The PAS implementation guide defines the responsibilities of the two types of systems involved in a PAS solution:

**Client systems** are typically Electronic Medical Record (EMR) systems but could theoretically be any system responsible for requesting prior authorizations .  (E.g. practice management systems, pharmacy systems (for drugs that are part of a medical benefit), dental systems, etc.)

**Server systems** (or servers) are typically intermediary systems that act on behalf of payer organizations and are responsible for conversion of prior authorization requests to and from X12 for subsequent relay to payer systems.  In some cases, a server system may directly be a payer system (if X12 translation is not required by regulation).

### Underlying technologies
This guide is based on the [HL7 FHIR]({{site.data.fhir.path}}index.html) standard.  Implementers of this specification therefore need to understand some basic information about these specifications.

#### FHIR
This implementation guide uses terminology, notations and design principles that are
specific to FHIR.  Before reading this implementation guide, it's important to be familiar with some of the basic principles of FHIR as well
as general guidance on how to read FHIR specifications.  Readers who are unfamiliar with FHIR are encouraged to read (or at least skim) the following
prior to reading the rest of this implementation guide.

* [FHIR overview]({{site.data.fhir.path}}overview.html)
* [Developer's introduction]({{site.data.fhir.path}}overview-dev.html) (or [Clinical introduction]({{site.data.fhir.path}}overview-clinical.html))
* [FHIR data types]({{site.data.fhir.path}}datatypes.html)
* [Using codes]({{site.data.fhir.path}}terminologies.html)
* [References between resources]({{site.data.fhir.path}}references.html)
* [How to read resource & profile definitions]({{site.data.fhir.path}}formats.html)
* [Base resource]({{site.data.fhir.path}}resource.html)

This implementation guide supports the [R4]({{site.data.fhir.path}}index.html) version of the FHIR standard. R4 is just recently published and the goal is to ensure the implementation guide is aligned with the current direction of the FHIR standard.

This implementation guide also builds on the [US Core (STU3 - R4 based)]({{site.data.fhir.hl7_fhir_us_core}}) Implementation Guide and implementers need to familiarize themselves with the profiles in that IG.

#### ASC X12N
The intention of this implementation guide is that detailed knowledge of X12N is not required by client/EHR implementers, though knowledge of some value sets and business processes will be needed. Intermediary systems will require an intimate understanding of the X12N specification, particularly the 278 and 275 transactions.  The following X12 Standards are referenced in this guide:

* ASC X12N/005010X217 - Health Care Services Review - Request for Review and Response (278) - provide standardized data requirements and content for all users who request authorizations or certifications or who respond to such requests 
* ASC X12N/005010X215 - Health Care Services Review - Inqury and Response (278) - provide standardized data requirements and content for all users who inquire on authorizations or certifications or who respond to such inquiries
* ASC X12N/006020X316 - Additional Information to Support a Health Care Services Review (275) - provide standardized data requirements and content to send additional information about a healthcare service review.

NOTE: At the time of publication, only the use of ASC X12N/005010X217 is mandated by HIPAA.