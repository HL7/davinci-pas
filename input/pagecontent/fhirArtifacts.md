Complying with this implementation guide means complying with a number of profiles, extensions, value sets and custom search parameters.  This page provides an overview of where this information can be found.

These FHIR artifacts define the clinical data that can be submitted as part of a prior authorization submission and/or included as part of a prior authorization response using the [Claim submit](OperationDefinition-Claim-submit.html) operation.

The artifacts are of four types:

* [Profiles]({{site.data.fhir.path}}profiling.html) constrain FHIR resources to reflect PAS requirements
* [Extensions]({{site.data.fhir.path}}extensibility.html) define additional data elements that can be conveyed as part of a resource
* [Code Systems]({{site.data.fhir.path}}codesystem.html) define PAS-specific terminologies to be used in one or more of those profiles
* [Value Sets]({{site.data.fhir.path}}valueset.html) define the specific subsets of both PAS-defined and other code systems that can be (or are recommended to be) used within one or more profile elements
* [Operations]({{site.data.fhir.path}}operationdefinition.html) which define the PAS-specific constraints on the Claim submit operation as well as a Claim inquiry operation.

Many of the profiles are based on US Core 7.0.0 while also declaring conformance with US Core 6.1.0 and 3.1.1. In some cases, the 7.0.0 and/or 6.1.0 releases introduce new "mustSupport" elements that are not mustSupport in 3.1.1. The intention of this implementation guide is NOT to move forward the timelines by which EHRs and/or payers must support USCDI 3 and 4 content. Rather, it is to allow seamless transition as systems start to support the newer US Core releases as systems start to bring them on stream. As such, clients and servers have no obligations with respect to elements that are newly mustSupport in 6.1.0 or 7.0.0 beyond "don't error if these elements are present" until such time as those systems claim conformance with the US Core release which introduces those elements as mustSupport. Once a system claims conformance to US Core 6.1.0 or 7.0.0, then the conformance expectations of those release of the US Core guide come into play.

[Terminology Artifacts](terminology.html) can be found on its own page.

### Guide Artifacts

#### Capability Statements
* [EHR PAS Capabilities](CapabilityStatement-EHRCapabilities.html) - Required for EHRs participating in a PAS Exchange
* [Intermediary PAS Capabilities](CapabilityStatement-IntermediaryCapabilities.html) - Required for Intermediaries (and/or Payors) participating in a PAS Exchange

#### Operation Definitions
* [Submit a Prior Authorization Request for Adjudication](OperationDefinition-Claim-submit.html) - {{site.data.OperationDefinition-Claim-inquiry.description}}
* [Search for a Prior Authorization Response by example](OperationDefinition-Claim-inquiry.html) - {{site.data.OperationDefinition-Claim-submit.description}}

#### Metrics Logical Model
* [PAS Metric Data Logical Model](StructureDefinition-PASMetricData.html) - {{site.data.StructureDefinition-PASMetricData.description}}

#### PAS Subsription Topic
* [PAS Subscription Topic](SubscriptionTopic-PASSubscriptionTopic.html) - {{site.data.SubscriptionTopic-PASSubscriptionTopic.description}}

#### Profiles
##### Bundle Profiles
* [PAS Request Bundle](StructureDefinition-profile-pas-request-bundle.html) - {{site.data.StructureDefinition-profile-pas-request-bundle.description}}
* [PAS Response Bundle](StructureDefinition-profile-pas-response-bundle.html) - {{site.data.StructureDefinition-profile-pas-response-bundle.description}}
* [PAS Inquiry Bundle](StructureDefinition-profile-pas-inquiry-request-bundle.html) - {{site.data.StructureDefinition-profile-pas-inquiry-request-bundle.description}}
* [PAS Inquiry Response Bundle](StructureDefinition-profile-pas-inquiry-response-bundle.html) - {{site.data.StructureDefinition-profile-pas-inquiry-response-bundle.description}}

##### Abstract Resource Profiles
* [PAS Claim Base](StructureDefinition-profile-claim-base.html) - {{site.data.StructureDefinition-profile-claim-base.description}}
* [PAS Claim Response Base](StructureDefinition-profile-claimresponse-base.html) - {{site.data.StructureDefinition-profile-claimresponse-base.description}}

##### Claim Profiles
* [PAS Claim](StructureDefinition-profile-claim.html) - {{site.data.StructureDefinition-profile-claim.description}}
* [PAS Claim Inquiry](StructureDefinition-profile-claim-inquiry.html) - {{site.data.StructureDefinition-profile-claim-inquiry.description}}
* [PAS Claim Update](StructureDefinition-profile-claim-update.html) - This profile defines constraints and extensions used when updating a previously submitted Claim instance.

##### ClaimResponse Profiles
* [PAS Claim Response](StructureDefinition-profile-claimresponse.html) - {{site.data.StructureDefinition-profile-claimresponse.description}}
* [PAS Claim Inquiry Response](StructureDefinition-profile-claiminquiryresponse.html) - {{site.data.StructureDefinition-profile-claiminquiryresponse.description}}

##### Patient Profiles
* [PAS Subscriber Patient](StructureDefinition-profile-subscriber.html) - {{site.data.StructureDefinition-profile-subscriber.description}}
* [PAS Beneficiary Patient](StructureDefinition-profile-beneficiary.html) - {{site.data.StructureDefinition-profile-beneficiary.description}}

##### Organization / Location Profiles
* [PAS Organization Base](StructureDefinition-profile-organization.html) - {{site.data.StructureDefinition-profile-organization.description}}
* [PAS Insurer Organization](StructureDefinition-profile-insurer.html) - {{site.data.StructureDefinition-profile-insurer.description}}
* [PAS Requestor Organization](StructureDefinition-profile-requestor.html) - {{site.data.StructureDefinition-profile-requestor.description}}
* [PAS Location](StructureDefinition-profile-location.html) - {{site.data.StructureDefinition-profile-location.description}}

##### Practitioner Profiles
* [PAS Practitioner](StructureDefinition-profile-practitioner.html) - {{site.data.StructureDefinition-profile-practitioner.description}}
* [PAS Practitioner Role](StructureDefinition-profile-practitionerrole.html) - {{site.data.StructureDefinition-profile-practitionerrole.description}}

##### Other Profiles
* [PAS Service Request](StructureDefinition-profile-servicerequest.html) - {{site.data.StructureDefinition-profile-servicerequest.description}}
* [PAS Medication Request](StructureDefinition-profile-medicationrequest.html) - {{site.data.StructureDefinition-profile-medicationrequest.description}}
* [PAS Nutrition Order](StructureDefinition-profile-nutritionorder.html) - {{site.data.StructureDefinition-profile-nutritionorder.description}}
* [PAS Device Request](StructureDefinition-profile-devicerequest.html) - {{site.data.StructureDefinition-profile-devicerequest.description}}
* [PAS Coverage](StructureDefinition-profile-coverage.html) - {{site.data.StructureDefinition-profile-coverage.description}}
* [PAS Encounter](StructureDefinition-profile-encounter.html) - {{site.data.StructureDefinition-profile-encounter.description}}
* [PAS Communication Request](StructureDefinition-profile-communicationrequest.html) - {{site.data.StructureDefinition-profile-communicationrequest.description}}
* [PAS Subscription](StructureDefinition-profile-subscription.html) - {{site.data.StructureDefinition-profile-subscription.description}}
* [PAS Task](StructureDefinition-profile-task.html) - {{site.data.StructureDefinition-profile-task.description}}

##### Data Type Profiles
* [PAS Identifier](StructureDefinition-profile-identifier.html) - {{site.data.StructureDefinition-profile-identifier.description}}
* [PAS Quantity](StructureDefinition-profile-quantity.html) - {{site.data.StructureDefinition-profile-quantity.description}}
* [PAS Timing](StructureDefinition-profile-datatype-timing.html) - {{site.data.StructureDefinition-profile-datatype-timing.description}}

##### Extensions
{% include ext-list-generator.md use="profile" %}

#### Examples
><a name="FHIR-55621"></a>We have tried our best to make all examples valid both from a FHIR IG perspective and from an X12 perspective, but that there is no current way for us to validate the X12 situational rules so there may be a situational rule that we violate. If that is the case, we encourage readers to raise a [Jira issue](https://jira.hl7.org/secure/CreateIssueDetails!init.jspa?pid=10405&amp;issuetype=10600&amp;customfield_11302=FHIR-us-davinci-pas) so that we can fix the examples.
{: .dragon}

The following examples are present in this guide to show specific use cases:

* [Referral Authorization](Bundle-ReferralAuthorizationBundleExample.html) with [Accepted Response](Bundle-ReferralAuthorizationResponseBundleExample.html)
* [Homecare Authorization](Bundle-HomecareAuthorizationBundleExample.html) with an [Update of the Authorization Request](Bundle-HomecareAuthorizationUpdateBundleExample.html)
* [Medical Services Authorization](Bundle-MedicalServicesAuthorizationBundleExample.html)
* [Surgical Request Authorization](Bundle-SurgicalRequestBundleExample.html)
* [Invalid Request Response](OperationOutcome-InvalidRequestResponse.html)
* [Error Response](Bundle-ErrorResponseBundleExample.html)
* [Reject (DENY) Authorization](Bundle-RejectionResponseBundleExample.html)
* [Pending (PEND) Response](Bundle-ReferralPendingAuthorizationResponseBundleExample.html)
* [Additional Information Task Example](Task-AdditionalInformationTaskExample.html)
* [Subscription](Subscription-PASSubscriptionExample.html), [Subscription Notification](Bundle-PASSubscriptionNotification.html), and [Claim Inquiry](Bundle-PASClaimInquiryBundleExample.html) and a [Claim Inquiry Response](Bundle-PASClaimInquiryResponseBundleExample.html)


### Cross-Version Analysis
{% lang-fragment cross-version-analysis.xhtml %}

### Global Profiles

{% lang-fragment globals-table.xhtml %}
