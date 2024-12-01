[Previous Page - HIPAA Regulations](regulations.html)

This section of the implementation guide defines the specific conformance requirements for systems wishing to conform to this Prior Authorization Support implementation guide.  The bulk of it focuses on the Claim $submit operation, though it also provides guidance on privacy, security and other implementation requirements.


### Context

#### Pre-reading
Before reading this formal specification, implementers should first familiarize themselves with two other key portions of the specification:

* The [Use Cases & Overview](usecases.html) page provides context for what this formal specification is trying to accomplish and will give a sense of both the business context and general process flow enabled by the formal specification below.

* The [Technical Background](background.html) page provides information about the underlying specifications and indicates what portions of them should be read and understood to have the necessary foundation to understand the constraints and usage guidance described here.


#### Systems

This implementation guide sets expectations for two types of systems:

* **Client** systems are electronic medical records, pharmacy systems (for drugs that are part of a medical benefit) and other clinical and administrative systems responsible for requesting prior authorizations
* **Payer** systems are systems run by insurers, clearing houses and other organizations that are responsible for relaying or responding to requests for prior authorization


#### Profiles
This specification makes significant use of [FHIR profiles]({{site.data.fhir.path}}profiling.html) and terminology artifacts to describe the content to be shared as part of prior authorization requests and responses.

The full set of profiles defined in this implementation guide can be found by following the links on the [Artifacts](fhirArtifacts.html) page.

#### Integration with other Implementation Guides
* Along with the profiles defined in the PAS implementation guide, implementations **SHALL** also support the US Core R4 profiles for Condition, Observation, and Procedure.  They **SHOULD** support any other profiles relevant to the types of prior authorizations they process.
* Clients and Servers supporting this implementation guide **SHOULD** also comply with the Da Vinci [Coverage Requirements Discovery (CRD)](http://www.hl7.org/fhir/us/davinci-crd) and [Documentation Templates and Rules (DTR)](http://www.hl7.org/fhir/us/davinci-dtr) implementation guides.
* Every system claiming conformance to this IG **SHALL** comply with the [Security and Privacy page in the Da Vinci HRex guide](http://hl7.org/fhir/us/davinci-hrex/security.html). The FHIR implementer's Safety Checklist helps implementers be sure that they have considered all the parts of FHIR that impact their system design regarding privacy, security, provenance, and safety.
* Payers may have multiple back-end functions that handle different types of decision support and/or different types of services. If a payer supports endpoint discovery, they **SHALL** have at most a single endpoint for each coverage (e.g., Medicare, Medicaid, or commercial) they provide coverage under. In FHIR, a coverage instance essentially corresponds with the identification information on an insurance card, irrespective of the types of coverages available under that card. If a payer does not support endpoint discovery, they **SHALL** expose only one PAS endpoint capable of handling all coverages.
* Initial setup of connectivity between client and payer will have a manual component to establish security credentials and a trust relationship (unless both parties are part of a shared trust network).  Dynamic endpoint discovery allows for the potential for the use of different endpoints for different coverages and/or evolution of what endpoints are used for different coverage over time withoutchanging security credential or legal agreement expectations.

### Detailed Requirements

#### Summary
***NOTE*** FHIR uses a pair of resources called Claim and ClaimResponse for multiple purposes - they are used for actual claim submission, but they are *also* used for managing prior authorizations and pre-determinations.  These are distinguished by the Claim.use code.  **All references to Claim and ClaimResponse in this implementation guide are using it for the prior authorization purpose.  In any element description, where tense is part of the description, it should be interpreted in the context of a prior authorization.  An example would be "Product or service provided" which should be interpreted as the product or service being requested to be authorized.**  

The primary interaction supported by this implementation guide is submitting a prior authorization request and receiving back a response.  To perform this, a [PASBundle](StructureDefinition-profile-pas-request-bundle.html) resource is constructed by the client (EHR) system.  That Bundle will contain a [Claim](StructureDefinition-profile-claim.html) resource (which FHIR uses to submit prior authorization requests), together with various referenced resources needed to support the population of the 5010 version of the ASC X12N 278 prior authorization request and the 6020 version of the ASC X12N 275 additional documentation transactions.

{::options parse_block_html="false" /}
<figure>
  <img style="padding-top:0;padding-bottom:30px" width="800px" src="pas-content.png" alt="PAS Bundle Content"/>
  <figcaption>Figure 5.1 - PAS Bundle Content</figcaption>
</figure>
{::options parse_block_html="true" /}


This Bundle will then be sent as the sole payload of a [Claim submit](OperationDefinition-Claim-submit.html) operation.  The system on which the operation is invoked will convert the Bundle into an ASC X12N 278 and 0..* additional unsolicited 275 transactions and execute them all against the target payer system.  It will then take the resulting 278 response and convert it into a response FHIR [Bundle](StructureDefinition-profile-pas-response-bundle.html) containing a [ClaimResponse](StructureDefinition-profile-claimresponse.html) and associated resources.  All of this **SHOULD** happen synchronously with a maximum of 15 seconds between the user initiating the prior authorization request and seeing the resulting response - i.e. including network transmission time for request and response. (Less time is better.)

In the event that the prior authorization cannot be evaluated and a final response returned within the required timeframe, a response in which one or more of the requested authorization items are 'pended' will be returned.  A subscription-based mechanism can then be used by the client to be informed of updates to the authorization.  As well, the client (or other interested systems - e.g. patient, caregiver or performing provider systems) can use the [Claim inquire operation](OperationDefinition-Claim-inquiry.html) to query for the final results.  During this period of time, the same Claim submit operation can be used to request cancellation or modification of the prior authorization.

{::options parse_block_html="false" /}
<figure>
  <img style="padding-top:0;padding-bottom:30px" width="800px" src="pas_sequence_diagram.png" alt="PAS Submission Sequence Diagram"/>
  <figcaption>Figure 5.2 - PAS Submission Sequence</figcaption>
</figure>
{::options parse_block_html="true" /}

#### Prior Authorization Submission
The Claim submit operation is executed by POSTing a FHIR Bundle to the [base url]/Claim/$submit endpoint.  When an EHR configures itself to support a payer's PAS service, it will need to identify which Payer(s) the service supports such that it can ensure that the EHR only sends service calls to PAS services that the patient has current coverage for.  The payer endpoint is responsible for any internal routing based on which processing organization handles the decisions.  For this purpose, payer means 'The organization listed on the member's insurance card'.
Provider and EHR Vendor organizations MAY leverage the [payer registry](https://www.hl7.org/fhir/us/davinci-pdex/payertopayerexchange.html#mtls-endpoint-discovery) developed by PDex (which will eventually fold into the national directory under FAST) as a means of determining which endpoints exist for which payers as candidates for configuration.

The Bundle **SHALL** be encoded in JSON.  The first entry in the Bundle **SHALL** be a Claim resource complying with the [profile](StructureDefinition-profile-claim.html) defined in this IG to ensure the content is sufficient to appropriately populate an X12N 278 message.  Additional Bundle entries **SHALL** be populated with any resources referenced by the Claim resource (and any resources referenced by *those* resources, fully traversing all references and complying with all identified profiles).  Note that even if a given resource instance is referenced multiple times, it **SHALL** only appear in the Bundle once.  E.g., if the same Practitioner information is referenced in multiple places, only one Practitioner instance should be created - referenced from multiple places as appropriate.  Bundle.entry.fullUrl values **SHALL** be:

* the URL at which the resource is available from the EHR if exposed via the client's REST interface; or
* the form "urn:uuid:[some guid]"  
 
All GUIDs used **SHALL** be unique, including across independent prior authorization submissions - with the exception that the same resource instance being referenced in distinct prior authorization request Bundles can have the same GUID.

In addition to these core elements needed to populate the 278 message, any "supporting information" resources needed to process the prior authorization request (whether determined by DTR processes or by other means) must also be included in the Bundle.  Relevant resources referenced by those "supporting information" resources **SHALL** also be included (e.g. prescriber Practitioner and Medication for a MedicationRequest).  Any such resource that has a US Core profile **SHALL** comply with the relevant US Core profiles.  All "supporting information" resources included in the Bundle **SHALL** be pointed to by the Claim resource using the Claim.supportingInfo.valueReference element.  To attach non-FHIR instance data such as PDFs, CDAs, JPGs, a DocumentReference instance should be used.  QuestionnaireResponse is also a common way to return supporting information that was answered to a Questionnaire and so can be included as a reference to the QuestionnaireResponse which will also be included in the Bundle..  The Claim.supportingInfo.sequence for each entry **SHALL** be unique within the Claim.

All resources **SHALL** comply with their respective profiles.  FHIR elements not marked as 'must support' **MAY** be included in resources within the Bundle, but client systems should have no expectation of such elements being processed by the payer unless prior arrangements have been made.  Systems that do not process such elements **SHALL** ignore unsupported elements unless they are 'modifier' elements, in which case the system **MAY** treat the presence of the element as an error.

Details on how to map the FHIR Bundle to the relevant X12N 278 and 275 messages are expected to be published by ASC X12N.  The mapping for the 278 Request and Response will be whatever is currently mandated by HIPAA and the mapping for the 278 Inquiry and Response will be the compatible version.  The system is responsible for performing full conversion of all mapped elements, including execution of terminology translations when necessary.  In addition, the system **SHALL** make the entire PAS FHIR Bundle available to the intended payer.  The method may be based on the X12 275 or another method that trading partners have agreed to use.  This serves two purposes - it provides full audit traceability for the payer and it also allows the payer to directly process the FHIR content, potentially extracting elements not present in the X12 messages if needed.  (Note: there is no requirement that payers take any such action.).  If the X12 275 is used for this purpose, the 275 BDS01 Filter ID Code element **SHALL** be set to "B64".  Since the 275 binary segment doesn't contain a field for the binary data MIME type, any system reading that field will have to parse out the first few characters to determine whether the FHIR resources are encoded using XML or JSON syntax.  Translation/mapping systems should be aware that if the size of the attachments as part of a claims submission would exceed the size limitations of a particular recipient, the intermediary should split the attachments into separate 275s to remain within the overall limit.  All the data required for an X12N 278 is included in the FHIR Bundle request and response, to stay in compliance with HIPAA transaction requirements.

{% raw %}
<blockquote class="stu-note">
<p>
The mapping of Claim.item is driven by the X12 workflow with the use of identifiers on claim items.  Although X12 allows this, the Financial Management workgroup has not seen this in other standards and other jurisdictions.  This Implementation Guide uses extensions for the various item identifiers, but should this pattern be found to predominate then this may be promoted to an element in the base resource.
</p>
</blockquote>
{% endraw %}

This IG treats everything that happens beyond the defined operations endpoint receiving the FHIR bundle as a black box.  This black box includes any business associate(s), clearinghouse(s), payers, contracted review entities,  and other intermediaries that may be involved in the PA request and response. It is up to that black box to ensure that any regulatory requirements are met and to perform all processing within the allowed timeframe.

#### Processing Prior Authorization Submissions under the CMS Exception
{% raw %}
<blockquote class="stu-note">
<p>
The following confluence page is still being worked on and may not be complete at this time.
</p>
</blockquote>
{% endraw %}

There is an [HL7 Confluence Page](https://confluence.hl7.org/display/DVP/PAS+Exception+Guidance) that is intended to provide guidance for how to process Prior Authorization submissions under the CMS Exception.


#### Prior Authorization Response
The response to the prior authorization is processed in the reverse order as the request.  The system is responsible for converting the ASC X12N 278 response into a FHIR [Bundle](StructureDefinition-profile-pas-response-bundle.html).  The Bundle **SHALL** start with a [ClaimResponse](StructureDefinition-profile-claimresponse.html) entry that contains information mapped from the 278 response.  The ClaimResponse requires that a Claim be referenced in the ClaimResponse.request element.  This Claim resource does not need to be included in the Bundle but the Claim URL or identifier does need to be sent so that the ClaimResponse can be matched to the original Claim.  All other resources that were sent in the Claim request can also be returned as just references in the ClaimResponse.  The only resources that need to be returned in the response Bundle are the ClaimResponse and any resources that are new or changed as a result of the prior authorization processing. It is valid to send all resources in the Bundle if a system does not want or is not able to determine what is changed/new from the request.  When converting additional Bundle entries, the conversion process **SHALL** ensure that only one resource is created for a given combination of content.  E.g. if the same Practitioner information is referenced in multiple places, only one Practitioner instance should be created - referenced from multiple places as appropriate.  When echoing back resources that are the same as were present in the prior authorization request, the system **SHALL** ensure that the same fullUrl and resource identifiers are used in the response as appeared in the request.

Whether a response is considered 'pended', 'denied', or 'successful' depends on the review action code returned in the response.  It can be found in ClaimResponse.item.adjudication.extension(reviewaction)l.code.

Each item returned on the PAS ClaimResponse SHALL echo the same item.sequence as that same item had on the Claim. The item.sequence element SHALL serve as the main tracing identifier of items throughout requests and responses.

It is possible that the incoming prior authorization Bundle can not be processed due to validation errors or other non-business-errors.  In these instances, the receiving system **SHALL** return OperationOutcome instances that detail why the Bundle could not be processed and no ClaimResponse will be returned.  These errors are NOT the errors that are detected by the system processing the request and that can be conveyed in a ClaimResponse via the error capability.

The resulting Bundle is returned as the HTTP body of the POST response.

##### Returning Authorized Items that are different from what was Requested
<div class="modified-content" markdown="1">
It is often the case that what is authorized is different from what was requested.  Sometimes this is a modification of the requested item such as different quantities, eg. requested five counselling sessions but was authorized for three, or different locations, eg. requested services to be provided by Provider A but authorized to be provided by Provider B.  Other times these are authorized items that are in addition to the requested items.

In surveys with payers, it appears that this is returned in X12 responses in two different ways.  Some payers will return the requested items as 'denied' and return the authorized items as extra items.  Others will return the requested items as modified with the differences in the item itself.  To achieve consistency in the FHIR response, we have decided to require one method for returning the authorized items if they are different from what was requested.

For instances where the authorized item is a modification of the requested item, the requested item SHALL be returned in the ClaimResponse.item with an adjudication status of A6 - 'Modified'.  The actual authorized item SHALL be returned in the ClaimResponse.addItem.  The itemSequence element is used to link the addItem to the original item.  NOTE: The itemAuthorizedDetail extension is still allowed on the ClaimResponse.item.  The new intent of this extension is to indicate what was authorized which should match what was requested since the ClaimResponse.item does not have this information.  If what has been authorized is different, then the ClaimResponse.addItem SHALL be used.

For instances where there are new authorized items, they are returned in the ClaimResponse.addItem and the itemSequence will not match any of the requested items and thus will indicate that it is a new item.
</div>

##### Prior Authorization Request and Response Example
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
The need for predictable exchanges of transaction error conditions with PAS to exchange information between providers, intermediaries and payers cannot be overstated.  This section describes the various error conditions the PAS exchange may encounter and the appropriate method of reporting them to the initiating provider. Recipients of the transactions should respond as indicated below and senders of the transaction should look for the following responses and then take appropriate actions.

Business errors that are a part of the processing of the 278 payload, eg. in the AAA segments, are represented in the mapping to the response bundle.

All transactions in PAS are synchronous and **SHALL** require one of the following HTTP responses:

##### HTTP Responses

* 2XX – transaction submission succeeded
*	4XX – transaction failed – bad request - failures are not recoverable by resubmission of the transaction.  There will be an OperationOutcome returned that can be reviewed to determine the actual failure 
*	5XX – transaction failed – service unavailable or timeout - failures that may be temporary and resubmission may result in successful processing.  NOTE that no OperationOutcome will be returned in this instance

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

##### Missing Prior Authorization Response
Implementers who are used to using messaging may not be familiar with the process for what happens if a $submit response gets lost or the notification of a prior authorization update gets lost.

For subscriptions, see the Subscription Backport Guide on [Handling Errors](https://hl7.org/fhir/uv/subscriptions-backport/errors.html).

For missing responses to $submit, the FHIR guide has a section on what to do when reliable messaging is not involved: [Absence of Reliable Messaging](http://hl7.org/fhir/messaging.html#reliable).


#### Prior Authorization Inquiries
The [prior authorization inquiry operation](OperationDefinition-Claim-inquiry.html) allows for inquiries about prior authorization submissions.  This inquiry is used for other systems checking the status of a request and for generic inquiries.  Providers are expected to perform the same query-by-example inquiry even under the CMS exception.  This Implementation Guide does not specify a different way of searching for prior authorizations in the exception case.

Inquiries will happen as a result of manual invocation.  Although there are no constraints on the frequency of the query, clients **SHOULD** ensure that no repetitive inquiries do not happen so as not to stress payer systems.

The parameter to the inquiry operation is a [PAS Inquiry Request Bundle](StructureDefinition-profile-pas-inquiry-request-bundle.html) which has a [Claim Inquiry profile instance](StructureDefinition-profile-claim-inquiry.html) as well as any referenced resources.  The operation is a 'query-by-example' where the resource sent in provides an example of the data that is being searched for. The system uses the example to generate the query and find matching records. The exact rules for which elements are required and how those elements are used in the search are contained in the X12 278 Inquiry and Response guide.

In the base FHIR specification, the item.productOrService is mandatory. To conduct an inquiry that is not for a specific service, the 'not-applicable' code that is in the bound value set is sent. Intermediaries SHALL interpret the 'not-applicable' code as no product or service code.

NOTE: The inquiry operation must contain a requesting provider organization, a payer organization, and a patient for the inquiry.  The operation does not allow inquiries that do not identify a specific patient, such as an inquiry for all prior authorization requests submitted on a specific date.  The patient will be identified by their member identifier.  This identifier is a specific slice on the Patient resource that is identified with a type of 'MB'.  The identifier system will indicate the payer that the member identifier is associated with.  Providers will need correspond with payers to know what system to send.

The information in the Bundle is mapped to a 278 Health Care Services Review Information - Inquiry transaction (278i request).  The 278 Health Care Services Review Information - Response (278i response) is then mapped to a [PAS Inquiry Response Bundle](StructureDefinition-profile-pas-inquiry-response-bundle.html) with the results of the inquiry contained in the Bundle.

Notes:
* the returned ClaimResponse **SHALL** include the current results for all submitted items, including any items changed or canceled since the original authoriation request.  (See [Updating authorization requests](#updating-authorization-requests) below.)
* if a specific reference number (either the REF-NT or REF-BB) is submitted and is not the 'current' number (because subsequent additions/changes/cancellations have been made to the prior authorization request), the returned record **SHALL** be the current authorization response - even though it no longer has the same identifier.  I.e. If a search is for a 'replaced' prior authorization, the search result **SHALL** include the 'current' prior authorization response for the most recent replacing prior authorization request.
* systems **MAY** withhold information about prior authorizations that are 'open' but are deemed to be not relevant to the provider (eg. prior authorization requests for sensitive care where the requesting provider is neither the ordering nor rendering provider) who is checking for the prior authorization status if not searching by a specific Claim.identifier.  In such situations the response **SHOULD** include an OperationOutcome warning that some prior authorizations have been suppressed and provide an alternative mechanism (e.g. telephone number) to provide further information if needed.

#### Pended Authorization Responses
When the response indicates that an item is pended, it means that the payer requires additional time to make a final determination on all items within the prior authorization request.  In this situation, the client system will need to retrieve the prior authorization response at a later point once a final decision has been made.  To retrieve the response at a later point, implementers **SHALL** support subscriptions.  [Here](Bundle-ReferralPendingAuthorizationResponseBundleExample.html) is an example of a pended response.

Note: There are use-cases for multiple systems potentially needing to check on the status of a 'pended' prior authorization.  In addition to the provider who submitted the prior authorization request, the status might also be of interest to:

* the provider(s) who will be involved in delivering the service for which authorization was sought
* the patient
* the patient's caregivers
* other members of the patient's care team

As a result, queries seeking the status of the prior authorization response may come from multiple systems.  Servers **SHALL** permit access to the prior authorization response to systems other than the original submitter.  They **SHALL** require a match on the patient member or subscriber id (identifier on the Claim.patient) plus the ordering and/or rendering provider identifier, i.e. the provider's NPI.

{% raw %}
<blockquote class="stu-note">
<p>
We recognize that knowledge of the Patient member or subscriber identifier may not be sufficient access-control for subsequent queries.  We are looking for implementer feedback on this, in particular, on how to pass information through the X12 inquiry mechanism to the payer that helps attest to the 'right to know'.
</p>
</blockquote>
{% endraw %}


##### Subscription

Implementers **SHALL** support the R4 Subscriptions referenced in the [Subscriptions for R5 Backport Implementation Guide](http://hl7.org/fhir/uv/subscriptions-backport/).

There is no need for 'topic discovery' as there is only one topic of interest - [PAS Subscription Topic](SubscriptionTopic-PASSubscriptionTopic.html) - for this implementation guide.

When using the subscription retrieval mechanism, the Client will POST a new Subscription instance to the Server's [base]/Subscription endpoint.  This Subscription **SHALL** conform to the [PAS Subscription profile](StructureDefinition-profile-subscription.html).  The subscription is created at the level of the requesting provider organization and not at the level of each individual prior authorization request.  The Subscription filter criteria **SHALL** be org-identifier = [requesting provider organization id].  NOTE: The requesting provider organization id is included in the 2010B - NM109 X12 field or the FHIR Claim.provider.identifier.value field.  PAS Clients and Intermediaries **SHALL** support subscriptions with content='full-resource'.  Multiple criteria can be sent by listing them with the ',' as a separator, example: org-identifier=N123456,4543315.  Intermediaries **SHALL** ensure that subscriptions to monitor a particular organization's prior authorizations are only created or modified by that organization.

* Servers supporting subscriptions **SHALL** expose this as part of the Server's CapabilityStatement
* Servers **SHOULD** support rest-hook and **MAY** support websocket channels
* Additional information about creating subscriptions can be found [here]({{site.data.fhir.path}}subscription.html)

Once the [subscription](Subscription-PASSubscriptionExample.html) has been created, the Server **SHALL** send a notification over the requested channel indicating that a prior authorization response submitted by the requesting provider organization has changed.  This may happen when the response is complete, but may also occur when information on one or more of the items has been adjusted but the overall response remains as 'pended'.

Non-submitting systems are not able to subscribe for responses and will have to periodically query.

#### Checking Status
Systems other than the requesting system may choose not to subscribe to the prior authorization response but instead to check the status at the request of a user.  There are no retry limits for user-initiated status checks.

#### Updating Authorization Requests
In some cases, the needs associated with a prior authorization may change after the prior authorization request was submitted.  This might be a change to one of the services needed, the timeframe over which the service is provided, the quantity of the service or product, or even the elimination of the need for a given service.

Since submitting an update for a new authorization is frequently player/plan-specific, this IG recommends that an update is attempted first.  When details of a submitted request change and a provider needs to request prior authorization of a different set of items, clients SHOULD submit an update to the previously submitted Claim. Servers MAY reject updates and require that a new request is made by providing the appropriate X12 error code.  [Here](Bundle-RejectionResponseBundleExample.html) is an example of a rejected response to an update.

There are four types of changes possible:
* Canceling the entire prior authorization (including all contained items).  To cancel the entire authorization, a Claim-update instance can be sent with a certificationType code of 'Cancelled'.  No items are needed to be sent to cancel the entire authorization.
* Items within the request can be canceled.  Canceling an item means that the service is no longer required and no authorization is required.  Systems **SHALL** communicate a cancellation of an item if the corresponding order is canceled and a final authorization determination has not yet been received for that item.  The objective is to avoid expending resources reviewing requests that are no longer needed.  Items may also need to be canceled if a new item is being added that replaces them. (E.g. to avoid issues with a payer having concerns about duplicated therapy.)
* Certain elements can be revised within a previously submitted item.  Some examples of these elements are Claim.billablePeriod, Claim.item.serviced[x], Claim.item.quantity and Claim.item.net.  This may occur for claims that are pended or claims for which a final authorization decision has been made.  Typically this will be done if there's a need to extend the time-period and/or increase the quantity.  Other types of changes are accomplished by canceling an existing item and adding a new item.
* Additional items and/or supporting documentation can be added to the prior authorization request.  This is appropriate if the added items share the same context and should be evaluated in conjunction with the other items in the previously submitted authorization request.  It is also appropriate if the new supporting documentation helps provide justification for the request.

See the [Claim Update profile](StructureDefinition-profile-claim-update.html) for more information on how to create an update.

From an X12 perspective, only those items/attachments that are being added/cancelled/revised need to be present.  From an HL7 perspective, resources are generally represented as a cohesive whole, not a set of deltas from a previous resource.

To support the updating of a request, the following points need to be considered: 

* **All** items and supporting information is included in the Bundle - including items that have not changed at all.  Changed information is flagged as follows:
* Any items within the Claim that have been canceled (where the cancellation is at the item level, not at the whole prior authorization level) will be flagged with the [cancelled](StructureDefinition-modifierextension-infoCancelled.html) modifierExtension.  This indicates that the item is no longer actually part of the prior authorization request and is included only to distinguish it as 'canceled'.  Note that if an item was canceled previously, it will still have a 'canceled' modifier extension, even though the cancellation is not new.  The [Certification Type extension](StructureDefinition-extension-certificationType.html) with the appropriate code is used to indicate that each item previously requested is being canceled (using the code '3' - Cancel).
* All items and supportingInfo elements that have been added or changed (including flagging them as cancelled) must be marked with a [changed](StructureDefinition-extension-infoChanged.html) extension that indicates that the element was changed and what type of change has happened.  (Newly marking an item as canceled is considered a 'change'.)  Only the items that have changed in this submission will be marked with the 'changed' extension.  Elements that were previously added, modified or canceled will not be marked as changes unless they have been further changed in this version of the prior authorization.

The intermediary will create 278 and/or 275 submissions that instantiate the changes (by looking for those items and supportingInfo elements) and will ignore the unchanged items.

The benefit of this approach is that it is consistent with the way the prior authorization would need to be passed around if it is ever shared in a RESTful manner.  However, it can be bandwidth intensive if the prior authorization contains a large number of items, but only a small number of those have changed.

###### Updated Request Example
An example of a updated request can be found at [Updated Homecare Request](Bundle-HomecareAuthorizationUpdateBundleExample.html) along with the [original Homecare Request](Bundle-HomecareAuthorizationBundleExample.html).

#### Additional Notes
1. PAS systems **SHALL** ensure that prior authorizations that were initially pended remain available for query for at least 6 months after the anticipated completion of the services whose authorization was requested.

2. If the prior authorization response is a denial, it is not permitted to send an 'update' to the request. Instead, a new request must be initiated.

3. Note that data submitted by client systems will comply with US Core profiles, meaning that codes for medications, conditions, etc. will be those used for clinical purposes, not billing.  The intermediary will be responsible for performing any necessary mappings (e.g. SNOMED diagnosis codes to ICD10).

### Testing Requirements
It is the intent of this implementation guide to provide specifications for the exchange of prior authorization in a way that is conducive to developing test scripts and a reference implementation (RI) that can be used to validate/exercise the IG at connectathons and during piloting and production deployment. It is also the intent of this guide that any test scripts will include testing of: 

1. resources and profiles defined in this guide
2. artifacts used from referenced IGs such as DTR and CRD
3. testing of conformance to the underlying FHIR standards for the associated release (e.g. FHIR R4)

[Next Page - Privacy](privacy.html)