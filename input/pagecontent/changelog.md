### Version = 2.2.0-ballot
This version includes changes due to comments raised by the community since 2.1.0 and fixes a number of issues with the profiles.

#### JIRA Issues Applied

##### Narrative Changes
* [Use Cases](usecases.html)
  * Added note about repeating fields [link](usecases.html#repeating-fields)
* [Technical Specification](specification.html)
  * Updated guidance on Subscriptions vs Inquiries [link](specification.html#prior-authorization-inquiries)
  * Updated guidance on the resources that need to be included in each type of Bundle [link](specification.html#prior-authorization-submission) [link](specification.html#prior-authorization-response) [link](specification.html#prior-authorization-inquiries)
  * Clarified on how to search for a specific Claim using the REF-BB or REF-NT identifiers [link](specification.html#prior-authorization-inquiries)
  * Clarified on what the parameters of the Claim Inquiry represent [link](specification.html#prior-authorization-inquiries)
  * Restricted Subscription channel to 'rest-hook' [link](specification.html#subscription)
* [Additional Information](additionalInfo.html)
  * Updated diagrams around attachment workflows
  * Provided specific guidance on which fields are used in CDex

##### Profile Changes
* Bundle
  * Added invariant that Claim or ClaimResponse must be the first entry
* Claim
  * Added guidance that sequence numbers will be the same across all instances of the claim and claim response
  * Restricted SupportingInfo DischareDates slice to only be a date
  * Added new DocumentInformation extension to SupportingInfo AdditionalInformation slice
* ClaimResponse
  * Added DataAbsentReason extension to ClaimReponse.request
  * Added guidance that sequence numbers will be the same across all instances of the claim and claim response
  * Made item.noteNumber and processNote Must-Support in ClaimResponse and ClaimInquiryResponse
* PractitionerRole
  * Inherits from US Core PractitionerRole profile
* DocumentReference
  * New profile created to represent the restriction that the attachment data must be included
  
##### Operation Changes
* Fixed where the parameter profiles were set

##### Example Changes
* Added new Invalid Request example showing a returned OperationOutcome
* Changed the DENY response example to not be an error but an adjudication of 'CANCELLED'


##### Technical Corrections
* [FHIR-48904](https://jira.hl7.org/browse/FHIR-48904)
* [FHIR-49091](https://jira.hl7.org/browse/FHIR-49091)
* [FHIR-49092](https://jira.hl7.org/browse/FHIR-49092)
* [FHIR-49149](https://jira.hl7.org/browse/FHIR-49149)
* [FHIR-49870](https://jira.hl7.org/browse/FHIR-49870)
* [FHIR-50092](https://jira.hl7.org/browse/FHIR-50092)
* [FHIR-50119](https://jira.hl7.org/browse/FHIR-50119)
* [FHIR-51189](https://jira.hl7.org/browse/FHIR-51189)
* [FHIR-51464](https://jira.hl7.org/browse/FHIR-51464)
* [FHIR-51397](https://jira.hl7.org/browse/FHIR-51397)
* [FHIR-51534](https://jira.hl7.org/browse/FHIR-51534)


### Version = 2.1.0
This version updates the guide to be compliant with US Core v3.1.0, v6.0.1, and v7.0.0.  It also includes changes due to comments raised by the community since the introduction of 2.0.0.

#### JIRA Issues Applied
* [FHIR-48674](https://jira.hl7.org/browse/FHIR-48674) - Provide guidance on workflow if responses/notifications get lost
* [FHIR-48621](https://jira.hl7.org/browse/FHIR-48621) - Create a Quantity profile to limit the units
* [FHIR-48616](https://jira.hl7.org/browse/FHIR-48616) - Allow for Event Level Errors
* [FHIR-48586](https://jira.hl7.org/browse/FHIR-48586) - Clarify how to cancel an entire Prior Auth Claim instead of individual items
* [FHIR-48585](https://jira.hl7.org/browse/FHIR-48585) - Clarify inquiries for non-current claims
* [FHIR-48574](https://jira.hl7.org/browse/FHIR-48574) - Link to Claim Update profile for cardinality requirements
* [FHIR-48566](https://jira.hl7.org/browse/FHIR-48566) - Make the Updating Authorization Requests section more precise
* [FHIR-48576](https://jira.hl7.org/browse/FHIR-48576) - Provide profile tense interpretation example
* [FHIR-48747](https://jira.hl7.org/browse/FHIR-48747) - Issues with member ID and member level inquiry
* [FHIR-48673](https://jira.hl7.org/browse/FHIR-48673) - Subscription id-only fails to account for the lack of requesting documentation information in PAS Inquiry
* [FHIR-48536](https://jira.hl7.org/browse/FHIR-48536) - Many related/supporting IG hyperlinks point to outdated IG versions
* [FHIR-48378](https://jira.hl7.org/browse/FHIR-48378) - Clarify Subscription Filter requirements
* [FHIR-48373](https://jira.hl7.org/browse/FHIR-48373) - Subscription Notification "returned identifier" not returned in id-only notifications
* [FHIR-47770](https://jira.hl7.org/browse/FHIR-47770) - ErrorPath structure
* [FHIR-48587](https://jira.hl7.org/browse/FHIR-48587) - Are there concrete requirements for servers indicating pended and denied claims?
* [FHIR-48582](https://jira.hl7.org/browse/FHIR-48582) - change definition of SHOULD 
* [FHIR-48581](https://jira.hl7.org/browse/FHIR-48581) - When are referenced resources needed on an inquiry?
* [FHIR-48580](https://jira.hl7.org/browse/FHIR-48580) - Clarify Inquiry matching semantics
* [FHIR-48579](https://jira.hl7.org/browse/FHIR-48579) - Differentiating between automated and manual inquiries
* [FHIR-48573](https://jira.hl7.org/browse/FHIR-48573) - article fix
* [FHIR-48364](https://jira.hl7.org/browse/FHIR-48364) - Reference Resource ID or The entire resource referenced resources in PAS Response Bundle
* [FHIR-47769](https://jira.hl7.org/browse/FHIR-47769) - ClaimResponse.request is optional
* [FHIR-48575](https://jira.hl7.org/browse/FHIR-48575) - Can't find referenced HRex endpoint discovery content
* [FHIR-48371](https://jira.hl7.org/browse/FHIR-48371) - Clarify value for "requesting provider organization id" Subscription parameter
* [FHIR-48377](https://jira.hl7.org/browse/FHIR-48377) - Additional Subscription Filters needed for non-submitters?
* [FHIR-48535](https://jira.hl7.org/browse/FHIR-48535) - PAS Profiled resources aren't making allowances for differences between US Core versions supported
* [FHIR-48568](https://jira.hl7.org/browse/FHIR-48568) - evoked -> invoked
* [FHIR-48569](https://jira.hl7.org/browse/FHIR-48569) - Unclear figure reference
* [FHIR-48570](https://jira.hl7.org/browse/FHIR-48570) - Duplicate Content in the Monitor for Resolution section
* [FHIR-48571](https://jira.hl7.org/browse/FHIR-48571) - Linked CDex page doesn't discuss monitoring
* [FHIR-48572](https://jira.hl7.org/browse/FHIR-48572) - missing [payer registry] link
* [FHIR-48583](https://jira.hl7.org/browse/FHIR-48583) - Clarify inquiries without a specific service
* [FHIR-48584](https://jira.hl7.org/browse/FHIR-48584) - Clarify subsetted inquiries
* [FHIR-48588](https://jira.hl7.org/browse/FHIR-48588) - Concerns about X12 situationally required fields 
* [FHIR-48589](https://jira.hl7.org/browse/FHIR-48589) - payers need to implement PAs for ALL services

### Version = 2.1.0-preview
This version updates the guide to be compliant with US Core v3.1.0, v6.0.1, and v7.0.0.  It also includes changes due to comments raised by the community since the introduction of 2.0.0.

#### JIRA Issues Applied
* [FHIR-48478](https://jira.hl7.org/browse/FHIR-48478) - Update Task Profile
* [FHIR-46570](https://jira.hl7.org/browse/FHIR-46570) - Change EMR to EHR throughout
* [FHIR-47130](https://jira.hl7.org/browse/FHIR-47130) - 2000E Loop - UM01/UM02 Request/Certification Type Mandatory
* [FHIR-46542](https://jira.hl7.org/browse/FHIR-46542) - Claims Inquiry Response FHIR resource doesn't have attribute to capture  place of service (service place) information
* [FHIR-48323](https://jira.hl7.org/browse/FHIR-48323) - PAS Practitioner - defined slices should require .value to be populated if they are present
* [FHIR-46543](https://jira.hl7.org/browse/FHIR-46543) - FHIR validator throws an error for communicatedDiagnosis extension which is valid extension slice under ClaimResponse.item
* [FHIR-46621](https://jira.hl7.org/browse/FHIR-46621) - PAS Request Bundle can't link to PASClaim
* [FHIR-48322](https://jira.hl7.org/browse/FHIR-48322) - PAS Organization Base - defined slices should require .value to be populated if they are presnt
* [FHIR-48312](https://jira.hl7.org/browse/FHIR-48312) - Add date invariants to .accident.date and .serviced[x]
* [FHIR-47128](https://jira.hl7.org/browse/FHIR-47128) - PAS Update: preserve original and updated claim relationship in X12 278
* [FHIR-46622](https://jira.hl7.org/browse/FHIR-46622) - Clarify attachment types
* [FHIR-48372](https://jira.hl7.org/browse/FHIR-48372) - Subscription filter definition and description out of sync
* [FHIR-48370](https://jira.hl7.org/browse/FHIR-48370) - no topic discovery needed
* [FHIR-45305](https://jira.hl7.org/browse/FHIR-45305) - Provide additional details on the use of Organization-level Subscriptions
* [FHIR-43046](https://jira.hl7.org/browse/FHIR-43046) - clarify what a "your update was rejected because you need to submit a new auth request instead" response looks like
* [FHIR-44695](https://jira.hl7.org/browse/FHIR-44695) - add a slice for 278 Payor Identification to PAS Insurer Organization
* [FHIR-43603](https://jira.hl7.org/browse/FHIR-43603) - ReviewAction Lacks Pend/Deny Examples
* [FHIR-47696](https://jira.hl7.org/browse/FHIR-47696) - Change 'prescription benefit' to 'pharmacy benefit' and 'prior auth' to 'prior authorization'
* [FHIR-46516](https://jira.hl7.org/browse/FHIR-46516) - Error Response Bundle Example does not have Error Response
* [FHIR-44888](https://jira.hl7.org/browse/FHIR-44888) - typo in diagram
* [FHIR-46505](https://jira.hl7.org/browse/FHIR-46505) - PAS subscriptions not documented well enough for inferno tests
* [FHIR-44867](https://jira.hl7.org/browse/FHIR-44867) - Clarify CDex interactions in Figure 3.1 - Request For Additional Information Workflow
* [FHIR-44832](https://jira.hl7.org/browse/FHIR-44832) - Remove "polling" in Figure 2.3
* [FHIR-46310](https://jira.hl7.org/browse/FHIR-46310) - Clarification and correction on PAS Update IG
* [FHIR-46650](https://jira.hl7.org/browse/FHIR-46650) - Incorrect Section 5.2.9
* [FHIR-46612](https://jira.hl7.org/browse/FHIR-46612) - Consistent formatting of Conformance Language needed
* [FHIR-46442](https://jira.hl7.org/browse/FHIR-46442) - Add endpoint discovery expectations
* [FHIR-46237](https://jira.hl7.org/browse/FHIR-46237) - PAS ClaimResponse.identifier[n].system has type "uri" but X12 may return arbitrary string or number
* [FHIR-46236](https://jira.hl7.org/browse/FHIR-46236) - Edit the description of the extension : reasonCode
* [FHIR-46223](https://jira.hl7.org/browse/FHIR-46223) - Conformance statements should not be on Home page
* [FHIR-46175](https://jira.hl7.org/browse/FHIR-46175) - PAS Claim Update Missing MS Flags
* [FHIR-46119](https://jira.hl7.org/browse/FHIR-46119) - Place of Service should be required
* [FHIR-46116](https://jira.hl7.org/browse/FHIR-46116) - Why is item.productOrService (procedureCode) always required on the inquiry request
* [FHIR-46070](https://jira.hl7.org/browse/FHIR-46070) - Discrepancy on x12 spec vs Fhir spec, at 2000E ‚Äî PATIENT EVENT LEVEL in x12
* [FHIR-45742](https://jira.hl7.org/browse/FHIR-45742) - Update Valueset definition for LOINC Attachment Codes
* [FHIR-45393](https://jira.hl7.org/browse/FHIR-45393) - Inquire vs Inquiry
* [FHIR-45391](https://jira.hl7.org/browse/FHIR-45391) - Overuse of 'submit' in PAS operation definitions
* [FHIR-45258](https://jira.hl7.org/browse/FHIR-45258) - Conformance language requirement is dependent on subjective qualifications
* [FHIR-44882](https://jira.hl7.org/browse/FHIR-44882) - create invariants for Task.owner.identifier and Task.requester.identifier 
* [FHIR-44881](https://jira.hl7.org/browse/FHIR-44881) - Task.owner Short Description should be the Provider
* [FHIR-44880](https://jira.hl7.org/browse/FHIR-44880) - Task.requester Short Description should be Provider
* [FHIR-44877](https://jira.hl7.org/browse/FHIR-44877) - Change the Task.code Value Set concept definition
* [FHIR-44677](https://jira.hl7.org/browse/FHIR-44677) - .processNote.number and .text need to be MS to better align with regulation
* [FHIR-44565](https://jira.hl7.org/browse/FHIR-44565) - Conformance language casing needs correcting
* [FHIR-44159](https://jira.hl7.org/browse/FHIR-44159) - PAS changes following CMS-0057-F
* [FHIR-44153](https://jira.hl7.org/browse/FHIR-44153) - clarify subscriptions are required in use cases - monitor for resolution
* [FHIR-44152](https://jira.hl7.org/browse/FHIR-44152) - Extensions used in Claim/ClaimResponse need to enable use in EOB
* [FHIR-43031](https://jira.hl7.org/browse/FHIR-43031) - Clarifications and guidance on polling rules for Claim Inquiry
* [FHIR-42705](https://jira.hl7.org/browse/FHIR-42705) - Fix hyphenation for "pre-authorization"
* [FHIR-42704](https://jira.hl7.org/browse/FHIR-42704) - Remove references to predetermination from claim-related profiles
* [FHIR-43913](https://jira.hl7.org/browse/FHIR-43913) - profile-claim-inquiry uses invalid discriminator

### Version = 2.0.1
This included a technical correction for a link to the proper CRD.

### Version = 2.0.0
- Based on FHIR version: 4.0.1

The changes in this update to the Da Vinci Prior Authorization guide have been reviewed and commented on by the public through the HL7 balloting process.  The resolution of the community comments has been agreed to and voted on by the members of the HL7 International Financial Management work group.

#### What's new in Version 2.0.0 of Da Vinci Prior Authorization:

This section provides an overview of the significant changes in Version 2.0.0 of Da Vinci Prior Authorization.

- ALL PAGES
  - Made Conformance verbs bold everywhere (FHIR-36583)
  - Fix typos (FHIR-36608, FHIR-36623, FHIR-36175)
  - Added next-page/previous-page navigation links (FHIR-24358)
  - Added FMM status to the IG and all artifacts (FHIR-24113)
  - Added a change log page (FHIR-36581)
  - Added a new page on Metrics (FHIR-41548)
  - Made Privacy & Security its own page (FHIR-41616)
- Home Page
  - Added link to Da Vinci HIPAA Exception Confluence Page (FHIR-36592)
  - Added a note clarifying how situationally required fields are handled in the guide (FHIR-41635)
- Use Cases
  - Pull notes out of the PA Process diagram (FHIR-34540, FHIR-36153)
  - Add sentence to section 2.3.5 (FHIR-36145)
  - Add link to post-acute orders IG in section 2.3 (FHIR-36252)
  - Fix section 2.3.7 (FHIR-36320)
  - Replace figure 2.4 with new diagram (FHIR-36115, FHIR-36322)
  - Modify bullet #4 in section 2.3.1 (FHIR-36357)
  - Update most recent survey info (FHIR-36560)
  - Update bullet #1 in section 2.3.2 (FHIR-36566)
  - Fix section 2.3.3 (FHIR-36570)
  - Added section on using the inquiry function to find Prior Authorizations (FHIR-36571)
  - Update parentheticals in section 2.3.6 (FHIR-36577)
  - Update section 2.3.7 (FHIR-36578, FHIR-36584, FHIR-36587)
  - Add a Supported Use Case section around what is currently supported in the IG (FHIR-37769)
  - Remove references to polling (FHIR-39750)
  - Added a section on how PAS initiated CDex DTR launch would work (FHIR-40723)
  - Add more information on how Subscription is used and create a PAS SubscriptionTopic resource (FHIR-41446, FHIR-41698, FHIR-41912)
- Background
  - Update section 3.1.1 (FHIR-36593, FHIR-40465)
  - Add a section on how to resolve the X12 codesystem and value sets (FHIR-34393, FHIR-36422, FHIR-36604)
  - Add a section on how Must Support is used in the IG (FHIR-36157)
- Formal Specification
  - Add a note around the use of tense and the Claim resource (FHIR-36044)
  - Use the verb 'update' and reference 5.2.9 and section 2.3 (FHIR-36147)
  - Add a note around the Confluence page and the fact that it is currently empty at time of publication (FHIR-36159, FHIR-36323, FHIR-36590, FHIR-36595)
  - Define 278i and 278r (FHIR-36238)
  - Updates to various sections (FHIR-36152, FHIR-36236, FHIR-36321, FHIR-36324, FHIR-36325, FHIR-36594, FHIR-36611, FHIR-36612, FHIR-36613, FHIR-36616, FHIR-36618, FHIR-36619, FHIR-36620, FHIR-40411, FHIR-40412, FHIR-40414)
  - Remove Polling (FHIR-36350, FHIR-36353, FHIR-36358, FHIR-36565, FHIR-36567, FHIR-36614, FHIR-38199, FHIR-36617)
  - Indicate which version of subscriptions will be used (FHIR-39418)
  - Add a section on endpoint resolution (FHIR-39505)
  - Fix typo in Figure 5.3 (FHIR-36317)
  - Add content and diagrams around ePA workflow (FHIR-36558)
  - Add a sentence that says orders SHOULD be annotated with PAS response decisions (FHIR-41444)
  - Add information on how to include DTR QuestionnaireResponse in the Claim.supportingInfo (FHIR-41445)
- Credits
  - Updated credits for new version of guide (FHIR-36621)
- Profiles
  - Added new examples (FHIR-36610)
  - Added capability statements (FHIR-38628)
  - Support CR* condition codes, Home Health Care Prognosis Code and Start Date (FHIR-38137)
  - Add a PASNutritionOrder to the requestedService options (FHIR-39550)
  - Use the FHIR R5 Claim.encounter field (FHIR-24169)
  - Add a link to the base submit operation in the operation details (FHIR-24560)
  - Add descriptions to care team slices (FHIR-36043)
  - Fix serviceExtensionRequestType description (FHIR-36089)
  - Change CommunicationRequest.identifier description (FHIR-36097)
  - Change itemAuthorizedDate extension description and name (FHIR-36100)
  - Add fhirPath element to errorElement extension (FHIR-36103)
  - Fix certExpirationDate and certEffectiveDate descriptions (FHIR-36112)
  - Create PASDocumentReference profile and reference it in the Claim profile (FHIR-36155)
  - Create abstract profiles for Bundle/Claim/ClaimResponse (FHIR-36428)
  - Inquiry operation response should be 0..* (FHIR-40388)
  - Declare specific profiles in the operation parameters (FHIR-40389, FHIR-40390)
  - Add info that the inquiry operation is a query-by-example (FHIR-40410)
  - Make Claim.item.category 1..1 and indicate that it is needed for X12 (FHIR-40758)
  - AdditionalInformation slice should be 0..* (FHIR-39540)
  - Message Text slice should be 0..* (FHIR-39541)
  - Accident Date needs format usage information (FHIR-39544)
  - Coverage.identifier needs to be Must-Support (FHIR-37936)
  - Document that the PASClaim.diagnosis is unbounded but X12 only supports 12 repetitions. (FHIR-39499)
  - Fix the typo on X12 decision reason codes (FHIR-39660)
  - Add a usage note on item.quantity units (FHIR-39611)
  - Update subdepartment and jurisdiction extension descriptions (FHIR-40259)
  - Update inquiry provider description (FHIR-40391)
  - Add TIN Organization identifier slice (FHIR-36099)
  - Add new PractitionerRole profile to Claim.careTeam.provider (FHIR-36485)
  - Create PractitionerRole profile and change provider to reference PractitionerRole (FHIR-36669, FHIR-36737, FHIR-40512)
  - Change Content modifier value set to use proper LOINC codes (FHIR-39728)
  - Change value set for CommunicationRequest.medium (FHIR-36586)
  - Fix display of bundle examples (FHIR-40672)
  - Add note about sending multiple diagnosis codes in ClaimInquiry (FHIR-39500)
  - Claim.item.category is mandatory as ServiceTypeCode is required (FHIR-40758)
  - Add a slice to Coverage.relationship to allow sending the X12 code (FHIR-41312)
  - Add CRD Coverage information extension to the PAS request profiles (FHIR-41443)
  - Made Claim.insurer 1..1 (FHIR-42692)

#### What's new in Version 1.1.0 of Da Vinci Prior Authorization
- Organization profiles were changed: (FHIR-30880)
  - Address changed from 1..1 to 0..1
  - Value set changed from https://valueset.x12.org/x217/005010/request/2010B/NM1/1/01/00/98 to https://valueset.x12.org/x217/005010/response/2010B/NM1/1/01/00/98
- The AuthorizedProvider profile has a new providerType CodeableConcept added to it. (FHIR-30881)
- Added NDC codes and a "not applicable" code to the X12278RequestedServiceType value set. (FHIR-30882)
- Created a new value set for the service modifier types that only has CPT and HCPCS codes. (FHIR-30883)
- Changed the modifier value in the AuthorizedDetail extension to be 0..* instead of 0..1. (FHIR-30884)
- Added an extension for state to the new PASIdentifier datatype. (FHIR-30885).
- Added a constraint to all dates that are used to ensure that a full date is being sent. (FHIR-30886)
- The Admission date period was change to two separate periods to handle a range of admission dates and a separate range of discharge dates. (FHIR-30887)
- Fix the extensions on CommunicationRequest to be on the CommunicationRequest.payload where they were intended. (FHIR-30888)
- All references on elements that are marked as Must Support now reference either PAS or US-Core profiles. (FHIR-30890)
- The Additional Information supporting info section has had a note added to indicate that the PASDocumentReference profile is the preferred profile for sending extra documentation. (FHIR-31024)
- New Identifier profile created (PASIdentifier) with the required extensions and uses of Identifier in Claim and ClaimResponse profiles changed to PASIdentifier. (FHIR-31025, FHIR-31372)
- Added CommunicatedDiagnosis to ClaimResponse and ClaimInquiryResponse. (FHIR-31086, FHIR-31370)
- Changed Certification Issue Date, Certification Effective Date, and Certifacation Expiration Date to be a date or a period to handle searching by a range. (FHIR-31373)
- Added short descriptions to every use of an extension and every Claim.supportingInfo slice. (FHIR-31414)
- Added a note to any value set that includes CPT and HCPCS codes that X12 will identify those codes as being HCPCS no matter what was originally sent in. (FHIR-31630)
- Created a PASOrganization profile on Organization and used the PASIdentifier datatype on Practitioner and Organization. (FHIR-32427)
- Change the cardinality of the ReviewAction reasonCode to be 0..*. (FHIR-32426)
- Add the ItemTraceNumber extension to ClaimInquiryResponse profile and make it 0..*. (FHIR-32425, FHIR-32891)
- Fix the Claim inquiry operation endpoint to be $inquiry instead of $submit. (FHIR-31948)
- Add language to the Home Page about ability to not convert into and out of an X12 278. (FHIR-32867)
- Add language to the Specification to allow other methods of exchanging the FHIR Bundle besides the X12 275. (FHIR-32866)
- Change extension names to more closely match their IDs. (FHIR-32877)
- Add a line number extension to the CommunicationRequest payload. (FHIR-32878)
- Revise the language about how Prior Authorizations are cancelled. (FHIR-32112)
- Move the ReviewAction extension from the ClaimResponse.item to the ClaimResponse.item.adjudication. (FHIR-32900)
- Fix the bindings for the CareTeam roles. (FHIR-32954)
- Remove mandatory XML support and make only JSON the allowed exchange format. (FHIR-33059)
