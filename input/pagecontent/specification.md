This section of the implementation guide defines the specific conformance requirements for systems wishing to conform to this Prior Authorization Support implementation guide.  The bulk of it focuses on the Claim $submit operation, though it also provides guidance on privacy, security and other implementation requirements.


### Context

#### Pre-reading
Before reading this formal specification, implementers should first familiarize themselves with two other key portions of the specification:

* The [Use Cases & Overview](usecases.html) page provides context for what this formal specification is trying to accomplish and will give a sense of both the business context and general process flow enabled by the formal specification below.

* The [Technical Background](background.html) page provides information about the underlying specifications and indicates what portions of them should be read and understood to have necessary foundation to understand the constraints and usage guidance described here.


#### Conventions
This implementation guide uses specific terminology to flag statements that have relevance for the evaluation of conformance with the guide:

* **SHALL** indicates requirements that must be met to be conformant with the specification.

* **SHOULD** indicates behaviors that are strongly recommended (and which may result in interoperability issues or sub-optimal behavior if not adhered to), but which do not, for this version of the specification, affect the determination of specification conformance.

* **MAY** describes optional behaviors that are free to consider but where there is no recommendation for or against adoption.


#### Systems

This implementation guide sets expectations for two types of systems:

* **Client** systems are electronic medical records, pharmacy systems (for drugs that are part of a medical benefit) and other clinical and administrative systems responsible for requesting prior authorizations
* **Payer** systems are systems run by insurers, clearing houses and other organizations that are responsible for relaying or responding to requests for prior authorization


#### Profiles
This specification makes significant use of [FHIR profiles]({{site.data.fhir.path}}profiling.html) and terminology artifacts to describe the content to be shared as part of prior authorization requests and responses.

The full set of profiles defined in this implementation guide can be found by following the links on the [Artifacts](fhirArtifacts.html) page.

#### Integration with other Implementation Guides
* Implementations of the PAS implementation guide SHALL support the US Core R4 profiles for Condition, Observation, ServiceRequest and Procedure.  They SHOULD support any other profiles relevant to the types of prior authorizations they process
* Clients and Servers supporting this implementation guide SHOULD also comply with the Da Vinci [Coverage Requirements Discovery (CRD)](http://www.hl7.org/fhir/us/davinci-crd) and [Documentation Templates and Rules (DTR)](http://www.hl7.org/fhir/us/davinci-dtr) implementation guides
* Every system claiming conformance to this IG SHALL comply with the [Security and Privacy page in the Da Vinci HRex guide](http://hl7.org/fhir/us/davinci-hrex/2020Sep/security.html). The FHIR implementer's Safety Checklist helps implementers be sure that they have considered all the parts of FHIR that impact their system design regarding privacy, security, provenance, and safety.


### Detailed Requirements

#### Summary
***NOTE*** FHIR uses a pair of resources called Claim and ClaimResponse for multiple purposes - they are used for actual claim submission, but they are *also* used for managing prior authorizations and pre-determinations.  These are distinguished by the Claim.use code.  **All references to Claim and ClaimResponse in this implementation guide are using it for the prior authorization purpose.  In any element description, where tense is part of the description, it should be interpreted in the context of a prior authorization.**  

The primary interaction supported by this implementation guide is submitting a prior authorization request and receiving back a response.  To perform this, a [PASBundle](StructureDefinition-profile-pas-request-bundle.html) resource is constructed by the client (EHR) system.  That Bundle will contain a [Claim](StructureDefinition-profile-claim.html) resource (which FHIR uses to submit prior authorization requests), together with various referenced resources needed to support the population of the 5010 version of the ASC X12N 278 prior authorization request and the 6020 version of the ASC X12N 275 additional documentation transactions.

{::options parse_block_html="false" /}
<figure>
  <img style="padding-top:0;padding-bottom:30px" width="800px" src="pas-content.png" alt="PAS Bundle Content"/>
  <figcaption>Figure 5.1 - PAS Bundle Content</figcaption>
</figure>
{::options parse_block_html="true" /}


This Bundle will then be sent as the sole payload of a [Claim/$submit](OperationDefinition-Claim-submit.html) operation.  The system on which the operation is invoked will convert the Bundle into an ASC X12N 278 and 0..* additional unsolicited 275 transactions and execute them all against the target payer system.  It will then take the resulting 278 response and convert it into a response FHIR [Bundle](StructureDefinition-profile-pas-response-bundle.html) containing a [ClaimResponse](StructureDefinition-profile-claimresponse.html) and associated resources.  All of this SHOULD happen synchronously with a maximum of 15 seconds between the user initiating the prior authorization request and seeing the resulting response - i.e. including network transmission time for request and response. (Less time is better.)

In the event that the prior authorization cannot be evaluated and a final response returned within the required timeframe, a response in which one or more of the requested authorization items are 'pended' will be returned.  A subscription-based mechanism can then be used by the client to be informed of updates to the authorization.  As well, the client (or other interested systems - e.g. patient, caregiver or performing provider systems) can use the [Claim-inquiry/$submit operation](OperationDefinition-Claim-inquiry.html) to query for the final results.  During this period of time, the same $submit operation can be used to request cancellation or modification of the prior authorization.

{::options parse_block_html="false" /}
<figure>
  <img style="padding-top:0;padding-bottom:30px" width="800px" src="pas_sequence_diagram.png" alt="PAS Submission Sequence Diagram"/>
  <figcaption>Figure 5.2 - PAS Submission Sequence</figcaption>
</figure>
{::options parse_block_html="true" /}

#### Prior authorization submission
The Claim/$submit operation is executed by POSTing a FHIR Bundle to the [base url]/Claim/$submit endpoint.

The Bundle SHALL be encoded in JSON.  The first entry in the Bundle SHALL be a Claim resource complying with the [profile](StructureDefinition-profile-claim.html) defined in this IG to ensure the content is sufficient to appropriately populate an X12N 278 message.  Additional Bundle entries SHALL be populated with any resources referenced by the Claim resource (and any resources referenced by *those* resources, fully traversing all references and complying with all identified profiles).  Note that even if a given resource instance is referenced multiple times, it SHALL only appear in the Bundle once.  E.g., if the same Practitioner information is referenced in multiple places, only one Practitioner instance should be created - referenced from multiple places as appropriate.  Bundle.entry.fullUrl values SHALL be:

* the URL at which the resource is available from the EHR if exposed via the client's REST interface; or
* the form "urn:uuid:[some guid]"  
 
All GUIDs used SHALL be unique, including across independent prior authorization submissions - with the exception that the same resource instance being referenced in distinct prior authorization request Bundles can have the same GUID.

In addition to these core elements needed to populate the 278 message, any "supporting information" resources needed to process the prior authorization request (whether determined by DTR processes or by other means) must also be included in the Bundle.  Relevant resources referenced by those "supporting information" resources SHALL also be included (e.g. prescriber Practitioner and Medication for a MedicationRequest).  Any such resource that has a US Core profile SHALL comply with the relevant US Core profiles.  All "supporting information" resources included in the Bundle SHALL be pointed to by the Claim resource using the Claim.supportingInfo.valueReference element.  To attach PDFs, CDAs, JPGs, a DocumentReference instance should be used.  The Claim.supportingInfo.sequence for each entry SHALL be unique within the Claim.

All resources SHALL comply with their respective profiles.  FHIR elements not marked as 'must support' MAY be included in resources within the Bundle, but client systems should have no expectation of such elements being processed by the payer unless prior arrangements have been made.  Systems that do not process such elements SHALL ignore unsupported elements unless they are 'modifier' elements, in which case the system MAY treat the presence of the element as an error.

Details on how to map the FHIR Bundle to the relevant X12N 278 and 275 messages are expected to be published by ASC X12N.  The mapping for the 278 Request and Response will be whatever is currently mandated by HIPAA and the mapping for the 278 Inquiry and Response will be the compatible version.  The system is responsible for performing full conversion of all mapped elements, including execution of terminology translations when necessary.  In addition, the system SHALL make the entire PAS FHIR Bundle available to the intended payer.  The method may be based on the X12 275 or an other method that trading partners have agreed to use.  This serves two purposes - it provides full audit traceability for the payer and it also allows the payer to directly process the FHIR content, potentially extracting elements not present in the X12 messages if needed.  (Note: there is no requirement that payers take any such action.).  If the X12 275 is used for this purpose, the 275 BDS01 Filter ID Code element SHALL be set to "B64".  Since the 275 binary segment doesn't contain a field for the binary data MIME type, any system reading that field will have to parse out the first few characters to determine whether the FHIR resources are encoded using XML or JSON syntax.  Translation/mapping systems should be aware that if the size of the attachments as part of a claims submission would exceed the size limitations of a particular recipient, the intermediary should split the attachments into separate 275s to remain within the overall limit.  All the data required for an X12N 278 is included in the FHIR Bundle request and response, to stay in compliance with HIPAA transaction requirements.

{% raw %}
<blockquote class="stu-note">
<p>
The mapping of Claim.item is driven by the X12 workflow with the use of identifiers on claim items.  Although X12 allows this, the Financial Management workgroup has not seen this in other standards and other jurisdictions.  This Implementation Guide uses extensions for the various item identifiers, but should this pattern be found to predominate then this may be promoted to an element in the base resource.
</p>
</blockquote>
{% endraw %}

This IG treats everything that happens beyond the defined operations endpoint receiving the FHIR bundle as a black box.  This black box includes any business associate(s), clearinghouse(s), payers, contracted review entities,  and other intermediaries that may be involved in the PA request and response. It is up to that black box to ensure that any regulatory requirements are met and to perform all processing within the allowed timeframe.

#### Processing Prior Authorization submissions under the CMS Exception
{% raw %}
<blockquote class="stu-note">
<p>
The following confluence page is still being worked on and may not be complete at this time.
</p>
</blockquote>
{% endraw %}

There is an [HL7 Confluence Page](https://confluence.hl7.org/display/DVP/PAS+Exception+Guidance) that is intended to provide guidance for how to process Prior Authorization submissions under the CMS Exception.


#### Prior authorization response
The response to the prior authorization is processed in the reverse order as the request.  The system is responsible for converting the ASC X12N 278 response into a FHIR [Bundle](StructureDefinition-profile-pas-response-bundle.html).  The Bundle SHALL start with a [ClaimResponse](StructureDefinition-profile-claimresponse.html) entry that contains information mapped from the 278 response.  Just like for the prior authorization request, additional Bundle entries must be present for all resources referenced by the ClaimResponse or descendent references.  When converting additional Bundle entries, the conversion process SHALL ensure that only one resource is created for a given combination of content.  E.g. if the same Practitioner information is referenced in multiple places, only one Practitioner instance should be created - referenced from multiple places as appropriate.  When echoing back resources that are the same as were present in the prior authorization request, the system SHALL ensure that the same fullUrl and resource identifiers are used in the response as appeared in the request.

It is possible that the incoming prior authorization Bundle can not be processed due to validation errors or other non-business-errors.  In these instances, the receiving system SHALL return OperationOutcome intances that detail why the Bundle could not be processed and no ClaimResponse will be returned.  These errors are NOT the errors that are detected by the system processing the request and that can be conveyed in a ClaimResponse via the error capability.

The resulting Bundle is returned as the HTTP body of the POST response.

##### Prior authorization request and response example
This is an example of a standard Referral Request / Response sequence between a Primary Care Provider and a Utilization Management Organization. The [request example](Bundle-ReferralAuthorizationBundleExample.html) will show how a PCP can request a referral to a specialist for a patient from a UMO. The [response example](Bundle-ReferralAuthorizationResponseBundleExample.html) will also show the response.

Joe Smith is a subscriber to Maryland Capital Insurance Company. During a regular physical, Dr. James Gardener, Joe’s primary care physician, diagnoses a potential heart problem. Dr. Gardener determines that it would be best to refer Joe to Dr. Susan Watson, a cardiologist, for a consultation.

Dr. Gardener is required by Maryland Capital Insurance to submit a request for review seeking approval to refer Joe to Dr. Watson.

After review, Maryland Capital approves the referral and responds.

#### Prior Authorization Transaction Error Handling
{% raw %}
<blockquote class="stu-note">
<p>
This section was added in the May 2022 ballot of PAS and we are seeking balloter feedback on it.
</p>
</blockquote>
{% endraw %}
The need for predictable exchanges of transaction error conditions with PAS to exchange of information between providers, intermediaries and payers cannot be overstated.  This section describes the various error conditions the PAS exchange may encounter and the appropriate method of reporting them to the initiating provider. Recipients of the transactions should respond as indicated below and senders of the transaction should look for the following responses and take appropriate actions.

Business errors that are a part of the processing of the 278 payload, eg. in the AAA segments, are represented in the mapping to the response bundle.

All transactions in PAS are synchronous and SHALL require one of the following HTTP responses:

##### HTTP responses

* 2XX – transaction submission succeeded
*	4XX – transaction failed – bad request - Failures are not recoverable by resubmission of the transaction.  There will be an OperationOutcome returned that can be reviewed to determine the actual failure 
*	5XX – transaction failed – service unavailable or timeout - Failures that may be temporary and resubmission may result in successful processing.  NOTE that no OperationOutcome will be returned in this instance

If an OperationOutcome is received, it may have information regarding errors that should be addressed in the future, but did not cause the transaction to fail.  NOTE: These errors should not be returned to the provider but should be reviewed and addressed by technical staff.

###### OperationOutcome Data Elements

| Element | Cardinality | Datatype | Information |
| ------- | ----------- | -------- | ----------- |
| Severity | 1..1 | code | fatal, error, warning, information |
| Code | 1..1 | code | IssueType |
| Details | 0..1 | CodeableConcept | additional code that clarifies the issue type |
| Diagnostics | 0..1 | string | addl information (response from validation, TA1, 999) |
| Expression | 0..* | string | FHIRPath of element(s) |

See the [OperationOutcome resource]({{site.data.fhir.path}}operationoutcome.html) for more information.

##### Prior Authorization Workflow Diagrams
Here are two workflow diagrams that show the sending of a request, the receiving of a response, and optional error handing.  The diagrams show an optional second intermediary.

{::options parse_block_html="false" /}
<figure>
  <img style="padding-top:0;padding-bottom:30px" width="800px" src="pas-error-twointermediaries.jpg" alt="PAS Two Intermediaries Workflow"/>
  <figcaption>Figure 5.3 - PAS Workflow with Two Intermediaries</figcaption>
</figure>
{::options parse_block_html="true" /}

{::options parse_block_html="false" /}
<figure>
  <img style="padding-top:0;padding-bottom:30px" width="800px" src="pas-error-after-pend.jpg" alt="PAS Pended Transactions Workflow"/>
  <figcaption>Figure 5.4 - PAS Workflow for pended transactions</figcaption>
</figure>
{::options parse_block_html="true" /}


#### Prior Authorization Inquiries
The [prior authorization inquiry operation](OperationDefinition-Claim-inquiry.html) allows for inquiries about prior authorization submissions.  This inquiry can be used for polling for pended authorization responses (see below), for other systems checking the status of a request (see below), and for generic inquiries.  Providers are expected to perform the same query-by-example inquiry even under the CMS exception.  This Implementation Guide does not specify a different way of searching for prior authorizations in the exception case.

The parameter to the inquiry operation is a [PAS Inquiry Request Bundle](StructureDefinition-profile-pas-inquiry-request-bundle.html) which has a [Claim Inquiry profile instance](StructureDefinition-profile-claim-inquiry.html) as well as any referenced resources if needed.  The operation is basically a query-by-example where the incoming Claim resource provides elements that will match existing prior authorizations.  Any authorizations that match the incoming resource elements will be returned by the operation.  The rules for how the included data elements are matched are specified in the X12 278 inquiry TR3 specification.

NOTE: The inquiry operation must contain a requesting provider organization, a payer organization, and a patient for the inquiry.  The operation does not allow inquiries that do not identify a specific patient such as an inquiry for all prior authorization requests submitted on a specific date.

The information in the Bundle is mapped to a 278 Health Care Services Review Information - Inquiry transaction (278i request).  The 278 Health Care Services Review Information - Response (278i response) is then mapped to a [PAS Inquiry Response Bundle](StructureDefinition-profile-pas-inquiry-response-bundle.html) with the results of the inquiry contained in the Bundle.

Notes:
* the returned ClaimResponse SHALL include the current results for all submitted items, including any items changed or cancelled since the original authoriation request.  (See [Changing authorization requests](#changing-authorization-requests) below.)
* the returned ClaimResponse will be a subset if the request was for a subset of information
* if the authorizationresponseid submitted is not the 'current' authorization response identifier (because subsequent additions/changes/cancellations have been made to the prior authorization request), the returned record SHALL be the 'current' authorization response - even though it no longer has the same identifier.  I.e. If a search is for a 'replaced' prior authorization, the search result SHALL include the 'current' prior authorization response for the most recent replacing prior authorization request.
* systems MAY withhold information about prior authorizations that are 'open' but are deemed to be not relevant to the provider (eg. prior authorization requests for sensitive care where the requesting provider is neither the ordering nor rendering provider) who is checking for the prior authorization status if not searching by a specific Claim.identifier.  In such situations the response SHOULD include an OperationOutcome warning that some prior authorizations have been suppressed and provide an alternative mechanism (e.g. telephone) to provide further information if needed.

#### Pended authorization responses
When the ClaimResponse.reviewaction.code is the X12 code for pended, it means that the payer requires additional time to make a final determination on all items within the prior authorization request.  In this situation, the client system will need to retrieve the prior authorization response at a later point once a final decision has been made.  To retrieve the response at a later point, implementers **SHALL** support subscriptions.

Note: There are use-cases for multiple systems potentially needing to check on the status of a pended prior authorization.  In addition to the provider who submitted the prior authorization request, the status might also be of interest to:

* the provider(s) who will be involved in delivering the service for which authorization was sought
* the patient
* the patient's caregivers
* other members of the patient's care team

As a result, queries seeking the status of the prior authorization response may come from multiple systems.  Servers SHALL permit access to the prior authorization response to systems other than the original submitter.  They SHALL require a match on the patient member or subscriber id (identifier on the Claim.patient) plus the ordering and/or rendering provider identifier, i.e. the provider's NPI.

{% raw %}
<blockquote class="stu-note">
<p>
We recognize that knowledge of the Patient member or subscriber identifier may not be sufficient access-control for subsequent queries.  We are looking for implementer feedback on this, in particular, on how to pass information through the X12 inquiry mechanism to the payer that help attest to the 'right to know'.
</p>
</blockquote>
{% endraw %}


##### Subscription

{% raw %}
<blockquote class="stu-note">
<p>
There is ongoing work on the Subscription resource and it is currently undergoing change such that implementers who are considering using Subscriptions should consult the latest FHIR build material and ask on Zulip for guidance on how to correctly implement Subscriptions.
</p>
</blockquote>
{% endraw %}

Implementers shall support the R4 Subscriptions referenced in the [Subscriptions for R5 Backport Implementation Guide](http://hl7.org/fhir/uv/subscriptions-backport/).

When using the subscription retrieval mechanism, the Client will POST a new Subscription instance to the Server's [base]/Subscription endpoint.  The Subscription.criteria SHALL be of the form: "identifier=[authorizationresponseid]&patient.identifier=[patientid]&status=active".  (Order of parameters with the search does not matter.)

* Servers supporting subscriptions SHALL expose this as part of the Server's CapabilityStatement
* Servers SHOULD support rest-hook and MAY support websocket channels
* For security reasons, the channel.payload SHALL be left empty
* Additional information about creating subscriptions can be found [here]({{site.data.fhir.path}}subscription.html)

Once the subscription has been created, the Server SHALL send a notification over the requested channel indicating that the prior authorization response has changed.  This may happen when the response is complete, but may also occur when information on one or more of the items has been adjusted but the overall response remains as 'pended'.

Upon receiving a notification, the Client SHALL - when convenient - execute the same query as shown above in the [polling](#polling) section.

If the retrieved ClaimResponse has an outcome of 'complete' or 'error', the Client SHALL perform a DELETE on the Subscription.

#### Checking status
Systems other than the requesting system may choose not to subscribe to the prior authorization response but instead to check the status at the request of a user.  This query is performed in the same manner as the polling query.  There are no retry limits for user-initiated status checks.

#### Updating authorization requests
In some cases, the needs associated with a prior authorization may change after the prior authorization request was submitted.  This might be a change to one of the services needed, the timeframe over which the service is provided, the quantity of the service or product, or even the elimination of the need for a given service.

Since submitting an update for a new authorization is frequently player/plan-specific, this IG recommends that an update is attempted first.  If that is rejected or the provider knows in advance that an update will not succeed, the a new authorization request should be made.

There are four types of changes possible:
* Cancelling the entire prior authorization (including all contained items)
* Items within the request can be cancelled.  Cancelling an item means that the service is no longer required and no authorization is required.  Systems SHALL communicate a cancellation of an item if the corresponding order is cancelled and a final authorization determination has not yet been received for that item.  The objective is to avoid expending resources reviewing requests that are no longer needed.  Items may also need to be cancelled if a new item is being added that replaces them. (E.g. to avoid issues with a payer having concerns about duplicated therapy.)
* Certain elements can be revised within a previously submitted item.  Specifically, the Claim.billablePeriod, Claim.item.serviced[x], Claim.item.quantity and Claim.item.net.  This may occur for claims that are pended or claims for which a final authorization decision has been made.  Typically this will be done if there's a need to extend the time-period and/or increase the quantity.  Other types of changes are accomplished by cancelling an existing item and adding a new item.
* Additional items and/or supporting documentation can be added to the prior authorization request.  This is appropriate if the added items share the same context and should be evaluated in conjuction with the other items in the previously submitted authorization request.  It is also appropriate if the new supporting documentation helps provide justification for the request.

For all of these cases, the update is requested by creating a *new* Bundle containing a *new* Claim resource with its own unique Claim.identifier and posting it using the $submit operation.  That resource will point to the previous Claim using the Claim.related element.  The relationship type will be 'replaces'.  The new claim resource instance will comply with the [Revised Prior Authorization](StructureDefinition-profile-claim-update.html) profile.

From an X12 perspective, only those items/attachments that are being added/cancelled/revised need to be present.  From an HL7 perspective, resources are generally represented as a cohesive whole, not a set of deltas from a previous resource.

To support the updating of a request, the following points need to be considered: 

* **All** items and supporting information is included in the Bundle - including items that have not changed at all.  Changed information is flagged as follows:
* Any items within the Claim that have been cancelled (where the cancellation is at the item level, not at the whole prior authorization level) will be flagged with the [cancelled](StructureDefinition-modifierextension-infoCancelled.html) modifierExtension.  This indicates that the item is no longer actually part of the prior authorization request and is included only to distinguish it as 'cancelled'.  Note that if an item was cancelled previously, it will still have a 'cancelled' modifier extension, even though the cancellation is not new.  The [Certification Type extension](StructureDefinition-extension-certificationType.html) with the appropriate code is used to indicate that each item previously requested is being cancelled (using the code '3' - Cancel).
* All items and supportingInfo elements that have been added or changed (including flagging them as cancelled) must be marked with a [changed](StructureDefinition-extension-infoChanged.html) extension that indicates that the element was changed and what type of change has happened.  (Newly marking an item as cancelled is considered a 'change'.)  Only the items that have changed in this submission will be marked with the 'changed' extension.  Elements that were previously added, modified or cancelled will not be marked as changes unless they have been further changed in this version of the prior authorization.

The intermediary will create 278 and/or 275 submissions that instantiate the changes (by looking for those items and supportingInfo elements) and will ignore the unchanged items.

The benefit of this approach is that it is consistent with the way the prior authorization would need to be passed around if ever shared in a RESTful manner.  However, it can be bandwidth intensive if the prior authorization contains a large number of items, but only a small number of those have changed.

###### Updated Request Example
An example of a updated request can be found at [Updated Homecare Request](Bundle-HomecareAuthorizationUpdateBundleExample.html) along with the [original Homecare Request](Bundle-HomecareAuthorizationBundleExample.html).

##### Responses to changed prior authorization requests
Just as the submission of a changed prior authorization request can be submitted in two different modes, a payer can choose to respond in two different modes.  Some payers may include responses for all items in the authorization.  Others might only include responses for those items that were specifically changed.  (In theory, some payers could also return the items that were changed as well as those that are still pended and thus considered 'open'.)  As for the request, if a ClaimResponse does not contain items corresponding to *all* that are part of the revised prior authorization (including those cancelled or unmodified), it SHALL declare a [security tag]({{site.data.fhir.path}}resource-definitions.html#Meta.security) with a value of [SUBSETTED]({{site.data.fhir.path}}v3/ObservationValue/cs.html#v3-ObservationValue-SUBSETTED) to make clear that the resource is incomplete.

The intermediary would populate the ClaimResponse Bundle based on the approach the payer had chosen in their 278 response.

NOTE: When querying for the current status of a prior authorization, the prior authorization response SHALL include all items, even if the identifier queried against corresponds to a prior authorization response whose synchronous response was a differential.  For example, if a prior authorization revision was submitted changing one item out of four, the synchronous prior authorization response might only contain one item (and a subsetted flag).  However, a subsequent query for the status of that prior authorization would always return a prior authorization resource that contained all four items.

#### Additional notes
1. PAS systems SHALL ensure that prior authorizations that were initially pended remain available for query for at least 6 months after the anticipated completion of the services whose authorization was requested.

2. If the prior authorization response is a denial, it is not permitted to send an 'update' to the request. Instead, a new request must be initiated.

3. Note that data submitted by client systems will comply with US Core profiles, meaning that codes for medications, conditions, etc. will be those used for clinical purposes, not billing.  The intermediary will be responsible for performing any necessary mappings (e.g. SNOMED diagnosis codes to ICD10)

### Privacy & Security Considerations
The profiles in this IG are defined to ensure sufficient information to properly populate the X12 specifications, though they also allow for additional data to be present. As well, the data elements in the X12 specifications are allowed to be omitted - what data is required by the payer to process a prior authorization is context and business-rule-specific. Implementers submitting prior authorization requests using PAS must be aware of (and adhere to) their responsibilities with respect to data sharing imposed by regulations such as HIPAA's "minimum necessary" rule, patient consent rules, etc. This may involve allowing providers to review information prior to data transmission to the payer. Implementations SHALL permit provider review of data prior to transmission, but SHALL NOT require such review.

The sharing of information from provider to payer for determining prior authorization is subject to HIPAA's "minimum necessary" regulations (specifically 45 CFR 164.514(d)(3) and (d)(4)). Payers are responsible for ensuring that only information necessary to make the prior authorization decision is solicited and providers are responsible for ensuring that only data that is reasonably relevant to the prior authorization decision is transmitted.

Some of the data shared as part of the prior authorization process may have associated constraints on the use of that information for other purposes, including subsequent disclosure to other payers, practitioners, policy-holders, etc. While HL7 FHIR supports conveying this information via security labels on transmitted resources, this information is not currently mappable (and thus findable) in the X12 275 and 278 transactions. Payers who do not view the FHIR version of the transmitted information should be aware of the possibility of these limitations and ensure they have policies that enforce appropriate sharing constraints on data.

In order to access information about a prior authorization, the provider system will need to access the payor system. This will require that the provider system authenticates to the payer system or an intermediary. The specifics of how this authentication are covered is handled within the Da Vinci HRex Implementation guide.  PAS Servers SHOULD support server-server OAuth and MAY support mutually authenticated TLS.  In a future release of this guide, direction will limit the option to server-server OAuth.  Every system implementing the Prior Authorization guide will need to be aware of and follow the guidance in the FHIR Core Specification on [Clinical Safety](http://hl7.org/fhir/safety.html) and the [Security and Privacy page in the Da Vinci HRex guide](http://hl7.org/fhir/us/davinci-hrex/2020Sep/security.html).

Once the system authentication has occurred, the payer will perform any authorization required for the provider to see the current state of the prior authorization.

### Testing Requirements
It is the intent of this implementation guide to provide specifications for the exchange of prior authorization in a way that is conducive to developing test scripts and a reference implementation (RI) that can be used to validate/exercise the IG at connectathons and during piloting and production deployment. It is also the intent of this guide that any test scripts will include testing of: 

1. resources and profiles defined in this guide
2. artifacts use from referenced IGs such as DTR and CRD, and
3. testing of conformance to the underlying FHIR standards for the associated release (e.g. FHIR R4). 

<!--### todo
We need workflow diagrams to show:

1.	 the traditional approach of submitting a 278 getting back into 78 response requesting information submitting matters at 275 and ultimately getting back at 278 reply 
2.	CRD, DTR and ultimately prior authorization support exchanges (including all of the variations – subscription, inquiry, update, cancel)
3.	the different methods of communication between a provider and payer as described above
4.	the contents of the requesting FHIR bundle including the questionnaireResponse, clinical resources using the US Core profiles, the claim resource (PA profile) and coverage resource (HRex profile)
5.	the contents of the received FHIR bundle including the PA profile on the claim response
6).	processing of the result and possible error codes (e.g. from the AAA segments)
-->
