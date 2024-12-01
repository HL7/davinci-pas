[Previous Page - Request for Additional Info](additionalinfo.html)

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
* [How to Read Resource & Profile Definitions]({{site.data.fhir.path}}formats.html) and additional [IG reading guidance](https://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html)
* [Base Resource]({{site.data.fhir.path}}resource.html)

This implementation guide supports the [R4]({{site.data.fhir.path}}index.html) version of the FHIR standard.

This implementation guide also builds on the [US Core]({{site.data.fhir.hl7_fhir_us_core}}) Implementation Guide and implementers need to familiarize themselves with the profiles in that IG.

Implementers should also familiarize themselves with the FHIR resources used within the guide:

<table>
  <thead>
    <tr>
      <th>Resource</th>
      <th>Relevance</th>
    </tr>
  </thead>
  <tbody>
    <tr><td><a href="{{site.data.fhir.path}}bundle.html">Bundle</a></td><td>Used when delivering collections of resources in a PAS operation</td></tr>
    <tr><td><a href="{{site.data.fhir.path}}capabilitystatement.html">CapabilityStatement</a></td><td>Used to define conformance expectations for this guide</td></tr>
    <tr><td><a href="{{site.data.fhir.path}}claim.html">Claim</a></td><td>The main resource that contains the information about what is being requested to be authorized</td></tr>
    <tr><td><a href="{{site.data.fhir.path}}claimresponse.html">ClaimResponse</a></td><td>The main resource that contains the information about what was authorized, if any</td></tr>
    <tr><td><a href="{{site.data.fhir.path}}codesystem.html">CodeSystem</a></td><td>Used to define custom codes specific to this guide</td></tr>
    <tr><td><a href="{{site.data.fhir.path}}communicationrequest.html">CommunicationRequest</a></td><td>Used to convey information that the payer needs to make an authorization decision</td></tr>
    <tr><td><a href="{{site.data.fhir.path}}coverage.html">Coverage</a></td><td>Used to identify the member and the relevant insurance coverage to a payer</td></tr>
    <tr><td><a href="{{site.data.fhir.path}}devicerequest.html">DeviceRequest</a></td><td>One of the resources that indicates what authorization is needed</td></tr>
    <tr><td><a href="{{site.data.fhir.path}}encounter.html">Encounter</a></td><td>One of the resources that indicates what authorization is needed and also provides context for other resources</td></tr>
    <tr><td><a href="{{site.data.fhir.path}}location.html">Location</a></td><td>Supporting information for encounters and request resources</td></tr>
    <tr><td><a href="{{site.data.fhir.path}}medicationrequest.html">MedicationRequest</a></td><td>One of the resources that indicates what authorization is needed</td></tr>
    <tr><td><a href="{{site.data.fhir.path}}nutritionorder.html">NutritionOrder</a></td><td>One of the resources that indicates what authorization is needed</td></tr>
    <tr><td><a href="{{site.data.fhir.path}}operationdefinition.html">OperationDefinition</a></td><td>Used to define the two main operations used in this IG</td></tr>
    <tr><td><a href="{{site.data.fhir.path}}organization.html">Organization</a></td><td>Used when identifying providers in Encounters, Tasks, and all requests</td></tr>
    <tr><td><a href="{{site.data.fhir.path}}parameters.html">Parameters</a></td><td>Used to provide the information for the operations</td></tr>
    <tr><td><a href="{{site.data.fhir.path}}patient.html">Patient</a></td><td>Demographic information relevant to all requests</td></tr>
    <tr><td><a href="{{site.data.fhir.path}}practitioner.html">Practitioner</a></td><td>Used when identifying providers in Encounters, Tasks, and all requests</td></tr>
    <tr><td><a href="{{site.data.fhir.path}}practitionerrole.html">PractitionerRole</a></td><td>Used when identifying providers in Encounters, Tasks, and all requests</td></tr>
    <tr><td><a href="{{site.data.fhir.path}}servicerequest.html">ServiceRequest</a></td><td>One of the resources that indicates what authorization is needed</td></tr>
    <tr><td><a href="{{site.data.fhir.path}}structuredefinition.html">StructureDefinition</a></td><td>Used when profiling resources and defining extensions</td></tr>
    <tr><td><a href="{{site.data.fhir.path}}subscription.html">Subscription</a></td><td>Used when subscribing for authorization decisions for an organization</td></tr>
    <tr><td><a href="{{site.data.fhir.path}}task.html">Task</a></td><td>Used to define something that is needed to be done by the provider to submit information</td></tr>
    <tr><td><a href="{{site.data.fhir.path}}valueset.html">ValueSet</a></td><td>Used to define collections of codes used by PAS profiles</td></tr>
  </tbody>
</table>



#### ASC X12N
The intention of this implementation guide is that detailed knowledge of X12N is not required by client/EHR implementers, though knowledge of some value sets and business processes will be needed. Intermediary systems will require an intimate understanding of the X12N specification, particularly the 278 and 275 transactions.  The following X12 Standards are referenced in this guide:

* ASC X12N/005010X217 - Health Care Services Review - Request for Review and Response (278) - provide standardized data requirements and content for all users who request authorizations or certifications or who respond to such requests 
* ASC X12N/005010X215 - Health Care Services Review - Inquiry and Response (278) - provide standardized data requirements and content for all users who search on authorizations or certifications or who respond to such inquiries
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

[Next Page - HIPAA Regulations](regulations.html)