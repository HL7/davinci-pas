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

* **MAY** describes optional behaviors that are free to consider but where the is no recommendation for or against adoption.


#### Systems

This implementation guide sets expectations for two types of systems:

* **Client** systems are electronic medical records, pharmacy systems and other clinical and administrative systems responsible for requesting prior authorizations
* **Payer** systems are systems run by insurers, clearing houses and other organizations that are responsible for relaying or responding to requests for prior authorization


#### Profiles
This specification makes significant use of [FHIR profiles]({{site.data.fhir.path}}profiling.html) and terminology artifacts to describe the content to be shared as part of prior authorization requests and responses.

The full set of profiles defined in this implementation guide can be found by following the links on the [Artifacts](allartifacts.html) page.

#### Integration with other Implementation Guides
* Implementations of the PAS implementation guide SHALL support the US Core R4 profiles for Condition, Observation, ServiceRequest and Procedure.  They SHOULD support any other profiles relevant to claims of the types relevant to the types of prior authorizations they process
* While not strictly required, Clients and Servers supporting this implementation guide SHOULD also comply with the Da Vinci [Coverage requirements Discovery (CRD)](http://www.hl7.org/fhir/us/davinci-crd) and [Documentation Templates and Rules (DTR)](http://www.hl7.org/fhir/us/davinci-dtr) implementation guides


### Detailed Requirements

#### Summary
The primary interaction supported by this implementation guide is submitting a prior authorization request and receiving back a response.  To perform this, a FHIR [Bundle](profile-bundle.html) resource is constructed by the client (EHR) system.  That Bundle will contain a [Claim](profile-claim.html) resource (which FHIR uses to submit prior authorization requests), together with various referenced resources needed to support the population of the 5010 version of the ASC X12N 278 prior authorization request and the 6020 version of the ASC X12N 275 additional documentation transactions.

This Bundle will then be sent as the sole payload of a [Claim/$submit](Claim-submit.html) operation.  The server on which the operation is invoked will convert the Bundle into an ASC X12N 278 and 0..* additional unsolicited 275 transactions and execute them all against the target payer system.  It will then take the resulting 278 response and convert it into a response FHIR Bundle containing a [ClaimResponse](profile-claimresponse.html) and associated resources.  All of this will happen synchronously with a maximum of 15 seconds between the user initiating the prior authorization request and seeing the resulting response.  (Less time is better.)

In the event that the prior authorization cannot be evaluated and a final response returned within the required timeframe, a response in which one or more of the requested authorizations are 'pended' will be returned.  The client (or other interested systems - e.g. patient, caregiver or performing provider systems) can then query the server endpoint for the final results using either a polling or subscription-based mechanism.  During this period of time, the same $submit operation can be used to request cancellation or modification of the prior authorization.

#### Prior authorization submission
The Claim/$submit operation is executed by POSTing a FHIR Bundle to the [base url]/Claim/$submit endpoint.  The Bundle can be encoded in either JSON or XML.  (Servers SHALL support both syntaxes.)  The first entry in the Bundle SHALL be a Claim resource complying with the [profile](profile-claim.html) defined in this IG to ensure the content is sufficient to appropriately populate an X12N 278 message.  Additional Bundle entries SHALL be populated with any resources referenced by the Claim resource (and any resources referenced by *those* resources, fully traversing all references and complying with all identified profiles).  Note that even if a given resource instance is referenced multiple times, it SHALL only appear in the Bundle once.  Bundle.entry.fullUrl values SHALL be the URL at which the resource is available from the EHR if exposed via the client's REST interface and SHALL be of the form "urn:uuid:[some guid]" otherwise.  All GUIDs used SHALL be unique, including across independent prior authorization submissions - with the exception that the same resource instance being referenced in distinct prior authorization request Bundles can have the same GUID.

The complete list of relevant profiles is as follows:

<table>
  <thead>
    <tr>
      <td>Profile</td>
      <td>Usage</td>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>
        <a href=""></a>
      </td>
      <td>Jean to do</td>
    </tr>
  </tbody>
</table>


In addition to these core elements needed to populate the 278 message, any "supporting information" resources needed to process the prior authorization request (whether determined by DTR processes or by other means) must also be included in the Bundle.  Relevant resources referenced by those "supporting information" resources SHALL also be included (e.g. prescriber Practitioner and Medication for a MedicationRequest).  All such resources SHALL comply with relevant US Core profiles.  All "supporting information" resources included in the Bundle SHALL be pointed to by the Claim resource using the Claim.supportingInfo.valueReference element.  The Claim.supportingInfo.category should be populated appropriately if possible, using 'other' if no appropriate category is known.  The Claim.supportingInfo.sequence for each entry SHALL be unique within the Claim.

A list of the candidate profiles from US Core for use in conveying "supporting information" can be found [here](todo).

All resources SHALL comply with their respective profiles.  FHIR elements not marked as 'must support' MAY be included in resources within the Bundle, but client systems should have no expectation of such elements being processed by the payer unless prior arrangements have been made.  Servers that do not process such elements SHALL ignore unsupported elements unless they are 'modifier' elements, in which case the server MAY treat the presence of the element as an error.

Details on how to map the FHIR Bundle to the relevant X12N 278 and 275 messages are expected to be published by ASC X12N.  The server is responsible for performing full conversion of all mapped elements, including execution of terminology translations when necessary.  In addition, the server SHALL produce an additional 275 message whose binary segment contains a base64-encoded copy of the entire FHIR Bundle resource.  This serves two purposes - it provides full audit traceability for the payer and it also allows the payer to directly process the FHIR content, potentially extracting elements not present in the X12 messages if needed.  (Note: there is no requirement that payers take any such action.)
  
This IG treats everything that happens beyond the defined operations endpoint receiving the FHIR bundle as a black box.  This black box includes any business associate(s), clearinghouse(s), payers, contracted review entities,  and other intermediaries that may be involved in the PA request and response. It is up to that black box to ensure that any regulatory requirements are met and to perform all processing within the allowed timeframe.

#### Prior authorization response
The response to the prior authorization is processed in the reverse order as the request.  The server is responsible for converting the ASC X12N 278 response into a FHIR [Bundle](profile-bundle.html).  The Bundle SHALL start with a [ClaimResponse](profile-claimresponse.html) entry that contains information mapped from the 278 response.  As well, just like for the prior authorization request, additional Bundle entries must be present for all resources referenced by the ClaimResponse or descendent references.  When converting additional Bundle entries, the conversion process SHOULD ensure that only one resource is created for a given combination of content.  E.g. if the same Practitioner information is referenced in multiple places, only one Practitioner instance should be created - referenced from multiple places as appropriate.  When echoing back resources that are the same as were present in the prior authorization request, the server SHALL ensure that the same fullUrl and resource identifiers are used in the response as appeared in the request.

The resulting Bundle is returned as the HTTP body of the POST response.

#### Pended authorization responses
When the ClaimResponse.outcome is 'queued' or 'partial', it means that the payer requires additional time to make a final determination on all items within the prior authorization request.  In this situation, the client system will need to retrieve the prior authorization response at a later point once a final decision has been made.  There are two possible options - polling and subscription.  Implementers SHOULD support subscription.  Servers SHALL support polling in situations where either party is unable to use the subscription approach.

Note: There are use-cases for multiple systems potentially needing to check on the status of status of a pended prior authorization.  In addition to the provider who submitted the prior authorization request, the status might also be of interest to:
* the provider(s) who will be involved in delivering the service for which authorization was sought,
* the patient
* the patient's caregivers
* other members of the patient's care team

As a result, queries seeking the status of the prior authorization response may come from multiple systems.  Servers SHALL permit access to the prior authorization response to systems other than the original submitter.  They SHALL require a match on both patient coverage id (identifier on the Claim.patient) and prior authorization id (Claim.identifier) to ensure access is only granted to individuals who know both - and thus have demonstrated a need to know.

##### Polling
In this approach, the Client regularly queries the Server to see if the status of the prior authorization has changed.  This is done by performing a query on the server's "Claim" endpoint, searching based on prior authorization identifier and patient coverage information.  The query should look like this:

<code>[base]/Claim?identifier=[claimid]&patient.identifier=[patientid]</code>

The search *can* also specify the identifier systems, but it is likely that downstream systems won't have access to these.  Systems wishing to reduce bandwidth impact can also filter using <code>_lastudated</code> to only retrieve the record if it has changed since the previous query.  Servers SHALL support this parameter.

Clients SHALL perform this query no more frequently than once every hour and SHOULD perform this query at least once every 12 hours.

The intermediary SHOULD execute a 278i to return the status.  However, if the payer does not support that function, the intermediary SHALL return the most recent copy of the prior authorization response as received from the payer.

##### Subscription
Subscriptions require more sophistication than polling, but reduce communication overhead by ensuring that queries only occur when data has changed.  When using the subscription retrieval mechanism, the client will POST a new Subscription instance to the server's [base]/Subscription endpoint.  The Subscription.criteria SHALL be of the form: "identifier=[claimid]&patient.identifier=[patientid]".  (Order of parameters with the search does not matter.)

* Servers supporting subscriptions SHALL expose this as part of the server's CapabilityStatement
* Servers SHALL support both rest-hook and websocket channels
* For security reasons, the channel.payload SHALL be left empty
* Additional information about creating subscriptions can be found [here]({{site.data.fhir.path}}subscription.html)

Once the subscription has been created, the server SHALL send a notification over the requested channel indicating that the prior authorization response has changed.  This may happen when the response is complete, but may also occur when information on one or more of the items has been adjusted but the overall response remains as 'pended'.

Upon receiving a notification, the client SHALL - when convenient - execute the same query as shown above in the [polling](#polling) section.

If the retrieved ClaimResponse has an outcome of 'complete' or 'error', the client SHALL perform a DELETE on the Subscription.

#### Checking status
Systems other than the requesting system may choose not to poll or subscribe to the prior authorization response but instead to check the status at the request of a user.  This query is performed in the same manner as the polling query.

#### Revising an open prior authorization
In some cases, the needs associated with a prior authorization may change after the prior authorization request was submitted.  This might be a change to one of the services needed, the timeframe over which the service is provided, the quantity of the service or product, or even the elimination of the need for a given service.

If a final prior authorization response has already been received, the only means to change an authorization is to submit a new prior authorization request - pointing to the original request using Coverage.related with a relationship code of 'prior'.

However, if a final response has not yet been received, it may be necessary to 'update' the previously submitted prior authorization request.  This is handled by posting a new Bundle containing the original content as well as any revisions using the same $submit operation as when submitting an original prior authorization request.  The Claim.identifier SHALL be the same as in the original prior authorization request.

The intermediary system will then compare the revised submission with the original submission and will submit a new 278 with cancelation items and new items as necessary to achieve the desired revisions.  It may also create additional unsolicited 275s.

#### Cancelling an prior authorization
For efficiency reasons, if a provider determines that a prior authorization is no longer necessary, they SHOULD submit a cancellation (so that the payer is no longer investing administrative effort in reviewing a request that is unnecessary).  To cancel a claim, the client invokes the $submit operation, again using the same Claim.identifier, but in this situation asserting a Claim.status of cancelled.  The server SHALL return a ClaimResponse Bundle where the ClaimResponse.status is 'cancelled'

Todo: what does this map to in X12?

#### Additional notes
1. PAS servers SHALL ensure that prior authorizations that were initially pended remain available for query for at least 6 months after the anticipated completion of the services whose authorization was requested.

2. If the prior authorization response is a refusal, it is not permitted to send an 'update' to the request in the hopes of receiving a different answer.  Instead, a new request must be initiated.

3. Note that data submitted by client systems will comply with US Core profiles, meaning that codes for medications, conditions, etc. will be those used for clinical purposes, not billing.  The intermediary will be responsible for performing any necessary mappings (e.g. SNOMED diagnosis codes to ICD10)

### Testing Requirements
It is the intent of this implementation guide to provide specifications for the exchange of prior authorization in a way that is conducive to developing test scripts and a reference implementation (RI) that can be used to validate/exercise the IG at connectathons and during piloting and production deployment. It is also the intent of this guide that any test scripts will include testing of: 

1. resources and profiles defined in this guide
2. artifacts use from referenced IGs such as DTR and CRD, and
3. testing of conformance to the underlying FHIR standards for the associated release (e.g. FHIR R4). 

### todo
We need workflow diagrams to show:

1.	 the traditional approach of submitting a 278 getting back into 78 response requesting information submitting matters at 275 and ultimately getting back at 278 reply 
2.	CRD, DTR and ultimately prior authorization support exchanges (including all of the variations – subscription, inquiry, update, cancel)
3.	the different methods of communication between a provider and payer as described above
4.	the contents of the requesting FHIR bundle including the questionnaireResponse, clinical resources using the US Core profiles, the claim resource (PA profile) and coverage resource (HRex profile)
5.	the contents of the received FHIR bundle including the PA profile on the claim response
6).	processing of the result and possible error codes (e.g. from the AAA segments)