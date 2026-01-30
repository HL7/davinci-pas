> Welcome to the ballot for the STU 2.2 release of PAS.
>
>This release contains a number of changes requested by the implementer community.  Most of them are non-signficant or backwards compatible changes, but there are a few that could at least be theoretically breaking for some implementations and there are a few that will be breaking for all implementations.  A complete list of the changes for this ballot, as well as links to the tracker items that provide justification for them can be found [here](changelog.html#version--220-ballot).
>
>There is also an open issue around the use of supplemental guides that has not been addressed in this ballot.  Please see this [Issues page](issues.html) for more discussion about this issue.
>
>**IMPORTANT:** The scope of this ballot is limited to the above changes and to feedback about the issues linked to above.  While feedback can always be submitted against any content in the specification at any time, votes submitted against content that is outside the official scope of the ballot may be deemed 'not related' and therefore not able to support negative votes.
{: .note-to-balloters}

This specification is currently published as a Standard for Trial Use (STU).

Note that this implementation guide is intended to support mapping between FHIR and X12 transactions.  To respect X12 intellectual property, all mapping and X12-specific terminology information will be solely published by X12 and made available in accordance with X12 rules - which may require membership and/or payment.  Please see this [Da Vinci External Reference page](https://confluence.hl7.org/display/DVP/Da+Vinci+Reference+to+External+Standards+and+Terminologies) for details on how to get this mapping.

<p class="modified-content"><a name="FHIR-52712"> </a>
The specific X12 transactions that this IG supports are 005010X217 - Health Care Services Review - Request for Review and Response (278) and 005010X215 - Health Care Services Review - Inquiry and Response (278).  There are many situationally required fields that are specified in those guides that do not have guidance in this Implementation Guide. All of these fields are marked as Must Support in this guide. However, due to licensing restrictions, implementers need to consult the above X12 guides to know the requirements for these fields.
</p>

>Several of the profiles will require use of terminologies that are part of X12 which we anticipate being made publicly available.  At such time as this occurs, the implementation guide will be updated to bind to these as external terminologies.
{: .stu-note}

### Overview
Prior authorization is a process commonly used by payer organizations to manage healthcare costs.  However, the process of requesting and receiving prior authorizations can be slow and inefficient.  The Administrative Simplification provisions of HIPAA mandate that the X12 278 Health Care Services Review Request for Review and Response be used for communicating prior authorization requests and responses.  While few electronic health record (EHR) systems have implemented this interface, this functionality is often implemented as a portal solution and/or as a part of Practice Management and Revenue Cycle Management solutions.  As a result, prior authorizations are often solicited by fax or by using payer-specific portals where clinicians re-key relevant information.  Fax submission requires manual transcription on the payer side and may result in significant back-and-forth requesting additional information prior to a decision being made.  Re-keying information is inefficient and can result in data entry errors.

This implementation guide strives to enable direct submission of prior authorization requests from EHR systems using a standard already widely supported by most EHRs - FHIR.  To meet regulatory requirements, these FHIR interfaces will communicate with an intermediary who, when necessary, can convert the FHIR requests to the corresponding X12 instances prior to passing the requests to the payer.  Responses are handled by a reverse mechanism (payer to intermediary as X12, then converted to FHIR and passed to the EHR).  Direct submission of prior authorization requests from the EHR will reduce costs for both providers and payers.  It will also result in faster prior authorization decisions which will lead to improved patient care and experience.

When combined with the Da Vinci [Coverage Requirements Discovery (CRD)](http://www.hl7.org/fhir/us/davinci-crd) and [Documentation Templates and Rules (DTR)](http://www.hl7.org/fhir/us/davinci-dtr) implementation guides, direct submission of prior authorization requests will further increase efficiency by ensuring that authorizations are always sent when (and only when) necessary, and that such requests will almost always contain all relevant information needed to make the authorization decision on initial submission.

The implementation guide also defines capabilities around the management of prior authorization requests, including checking the status of a previously submitted request, updating a previously submitted request, and canceling a request.

A high-level summary of how all of these IGs will work together can be seen below:

{::options parse_block_html="false" /}
<figure>
  <img style="padding-top:0;padding-bottom:0px" width="1000px" src="pa-stack.png" alt="Diagram showing interaction of CRD, DTR and PAS"/>
  <figcaption>Figure 1.1 - Interaction of CRD, DTR, and PAS</figcaption>
</figure>
{::options parse_block_html="true" /}

### CMS Exception
§index-1:When using PAS under the [CMS granted exception](https://confluence.hl7.org/display/DVP/Da+Vinci+HIPAA+Exception) (Request Number: HL7 FHIR Exception #2021031001), the implementer(s) **SHALL** disregard any requirements in this Implementation Guide to translate the PAS FHIR Bundle into or out of the X12 278.§ §index-2:The defined PAS FHIR request bundles **SHALL** be transmitted intact between the provider and payer.§ §index-3:The PAS FHIR response bundles **SHALL** be transmitted intact between the payer and the provider.§ NOTE: This CMS exception has ended as of June 2024.

### CMS Enforcement Discretion
The Office of Burden Reduction and Health Informatics (OBRHI) National Standards Group (NSG) announced an enforcement discretion that they would not enforce the requirement to use the X12 278 for prior authorization if the covered entities were using the Fast Healthcare Interoperability Resources (FHIR) based Prior Authorization API as described in the CMS Interoperability and Prior Authorization final rule (CMS-0057-F). This allows the payer to return a prior authorization number for use in the X12 837 in coverage extension of the CRD and DTR IGs or as part of the all FHIR exchange of the Prior Authorization Response Bundle in the PAS IG.

§index-4:When covered entities are operating under the enforcement discretion, the trading partners **SHALL** disregard any requirements in this Implementation Guide to translate the PAS FHIR Bundle into or out of the X12 278.§ §index-5:The defined PAS FHIR request bundles **SHALL** be transmitted intact between the provider and payer.§ §index-6:The PAS FHIR response bundles **SHALL** be transmitted intact between the payer and the provider.§

### Content and Organization
This implementation guide (and the menu for it) is organized into the following sections:

* *Background* - Supporting informative pages that do not set conformance expectations
  * [Reading this IG](background.html) points to key pages in the FHIR spec and other source specifications that must be understood in order to understand this guide
  * [Use Cases](usecases.html) describes the intent of the implementation guide, gives examples of its use, and provides a high-level overview of expected process flow
  * [Project and Participants](credits.html) gives a high-level overview of Da Vinci and identifies the individuals and organizations involved in developing this implementation guide
  * [ePA Coordinators](epaWorkflow.html) acknowledges that neither the payer nor provider systems involved in PAS are monolithic and shows how the various components of provider and payer systems might interact with "ePA Coordinator" systems to satisfy the requirements of this IG
* *Specification* - Pages that set conformance expectations
  * [Conformance Expectations](conformance.html) defines base language and expectations for declaring conformance with the guide
  * [Request for Additional Info](additionalinfo.html) covers considerations around data access, protection, and similar concepts that apply to all implementations
  * [HIPAA Regulations](regulations.html) covers considerations around data access, protection, and similar concepts that apply to all implementations
  * [Privacy, Safety, and Security](privacy.html) covers considerations around data access, protection, and similar concepts that apply to all implementations
  * [Metrics](metrics.html) provides a logical model describing how to capture data that may be relevant to measuring or reporting on PAS use
* *FHIR Artifacts*
  * [Overview](fhirArtifacts.html) introduces and provides links to the profiles, search parameters and other FHIR artifacts used in this implementation guide
  * [Artifacts](artifacts.html) points to the complete list of artifacts defined in this guide
* *Base Specifications* - Quick links to the various specifications this guide derives from
* *Support* - Links to help with use of this guide
  * *Discussion Forum* is a place to ask questions about the guide, discuss potential issues, and search through prior discussions
  * *Project Home* includes information about project calls, agendas, past minutes, and instructions for how to participate
  * *Implementer Support* provides information about reference implementations, resources for testing, known errata, regulatory considerations, and practical implementation pathways
  * *Project Dashboard* shows new and historical issues that have been logged against the specification, proposed dispositions, unapplied changes, etc.
  * *Propose a Change* allows formal submission of requests for change to the specification.  (Consider raising on the discussion forum first.)
  * [Downloads](downloads.html) allows download of this and other specifications, as well as other useful files

### Dependencies

<p class="modified-content">
At present, PAS is based on [FHIR R4]({{site.data.fhir.path}}).  In addition, PAS is dependent on the [US Core 3.1 (FHIR R4)]({{site.data.fhir.ver.uscore3}}), [US Core 6.1 (FHIR R4)]({{site.data.fhir.ver.uscore6}}) and [US Core 7.0 (FHIR R4)]({{site.data.fhir.ver.uscore7}})  implementation guides.  The first is supported for those systems limited to USCDI 1 capabilities, the second is for upcoming regulatory requirements mandating support for USCDI 3, and the last is to enable support for proposed regulations mandating support for USCDI 4.  Wherever possible, Da Vinci profiles strive to comply with all three releases, simplifying implementation for those who will need to support varying regulatory expectations over time.

In some situations, the payer community requires additional constraints or needs to profile resources that are not yet supported by US Core.  In these cases, this IG does not derive from the US Core profiles, though it does align with them as much as possible.  It is possible that certain PAS profiles and/or descriptive content may migrate to a future release of US Core, and in some cases, to the base FHIR standard.
</p>

In addition, this guide uses content from the following FHIR-related specifications and implementation guides:
* [Subscriptions R5 Backport]({{site.data.fhir.ver.subscriptions}})
* [Da Vinci CRD]({{site.data.fhir.ver.crd}})

In addition, this guide also relies on a number of parent implementation guides:

{% lang-fragment dependency-table-nontech.xhtml %}

### SNOMED Expansion Parameters

{% lang-fragment expansion-params.xhtml %}


This implementation guide defines additional constraints and usage expectations above and beyond the information found in these base specifications.

### Intellectual Property Considerations
This implementation guide and the underlying FHIR specification are licensed as public domain under the [FHIR license](http://hl7.org/fhir/R4/license.html#license). The license page also describes rules for the use of the FHIR name and logo.

There are a number of X12 codes that are used in the examples in this Implementation Guide.  These codes are listed within an X12 implementation guide (TR3) and maintained by X12. All X12 work products are copyrighted. See their website for licensing terms and conditions.

{% lang-fragment ip-statements.xhtml %}
