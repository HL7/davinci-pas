[Previous Page - Credits](credits.html)

Complying with this implementation guide means complying with a number of profiles, extensions, value sets and custom search parameters.  This page provides an overview of where this information can be found.

These FHIR artifacts define the clinical data that can be submitted as part of a prior authorization submission and/or included as part of a prior authorization response using the [Claim submit](OperationDefinition-Claim-submit.html) operation.

The artifacts are of four types:

* [Profiles]({{site.data.fhir.path}}profiling.html) constrain FHIR resources to reflect PAS requirements
* [Extensions]({{site.data.fhir.path}}extensibility.html) define additional data elements that can be conveyed as part of a resource
* [Code Systems]({{site.data.fhir.path}}codesystem.html) define PAS-specific terminologies to be used in one or more of those profiles
* [Value Sets]({{site.data.fhir.path}}valueset.html) define the specific subsets of both PAS-defined and other code systems that can be (or are recommended to be) used within one or more profile elements
* [Operations]({{site.data.fhir.path}}operationdefinition.html) which define the PAS-specific constraints on the Claim submit operation as well as a Claim inquiry operation.

Many of the profiles are based on US Core 7.0.0 while also declaring conformance with US Core 6.1.0 and 3.1.1. In some cases, the 7.0.0 and/or 6.1.0 releases introduce new "mustSupport" elements that are not mustSupport in 3.1.1. The intention of this implementation guide is NOT to move forward the timelines by which EHRs and/or payers must support USCDI 3 and 4 content. Rather, it is to allow seamless transition as systems start to support the newer US Core releases as systems start to bring them on stream. As such, clients and servers have no obligations with respect to elements that are newly mustSupport in 6.1.0 or 7.0.0 beyond "don't error if these elements are present" until such time as those systems claim conformance with the US Core release which introduces those elements as mustSupport. Once a system claims conformance to US Core 6.1.0 or 7.0.0, then the conformance expectations of those release of the US Core guide come into play.

### Guide Examples
The following examples are present in this guide to show specific use cases:

* [Referral Authorization](Bundle-ReferralAuthorizationBundleExample.html) with [Accepted Response](Bundle-ReferralAuthorizationResponseBundleExample.html)
* [Homecare Authorization](Bundle-HomecareAuthorizationBundleExample.html) with an Update of the Authorization Request sent as an [Full Update](Bundle-HomecareAuthorizationUpdateBundleExample.html) and as a [Differential Update](Bundle-HomecareAuthorizationDifferentialBundleExample.html)
* [Medical Services Authorization](Bundle-MedicalServicesAuthorizationBundleExample.html)
* [Surgical Request Authorization](Bundle-SurgicalRequestBundleExample.html)
* [Error Response](Bundle-ErrorResponseBundleExample.html)
* [Reject Authorization](Bundle-RejectionResponseBundleExample.html)
* [Pending Response](Bundle-ReferralPendingAuthorizationResponseBundleExample.html)
* [Additional Information Task Example](Task-AdditionalInformationTaskExample.html)
* [Subscription](Subscription-PASSubscriptionExample.html), [Subscription Notification](Bundle-PASSubscriptionNotification.html), and [Claim Inquiry](Bundle-PASClaimInquiryBundleExample.html) and a [Claim Inquiry Response](Bundle-PASClaimInquiryResponseBundleExample.html)

### Artifact Lists
<table>
  <tr>
    <td><a href="artifacts.html">FHIR PAS-specific Artifacts</a></td>
  </tr>
  <tr>
    <td><a href="{{site.data.fhir.ver.hl7_fhir_us_core}}">US Core</a></td>
  </tr>
</table>

Additional information about the use of these artifacts can be found in the [main specification](specification.html#profiles).

### Cross-Version Analysis
{% include cross-version-analysis.xhtml %}

### Intellectual Property Statements
{% include ip-statements.xhtml %}

### Global Profiles

{% include globals-table.xhtml %}

### IG Dependencies

This IG Contains the following dependencies on other IGs.

{% include dependency-table.xhtml %}