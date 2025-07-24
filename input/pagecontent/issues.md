As implementers get closer to the regulatory deadline, new voices have been joining the project calls and submitting feedback via Jira that call into question some of the foundational assumptions made in the implementation guides.  The project has been holding special calls to discuss a number of these issues, looping in a larger portion of the community to engage in the discussion.  However, at the time the content of this specification was being prepared for ballot, resolution had not yet been reached on most of the topics.  Postponing the ballot until these topics were landed would mean the updated specification that corrects a number of errors in the original specification and makes other useful clarificaitons and enhancements to the specification would be released too late to be useful to most implementers working to meet the CMS January 2027 regulatory deadline.  For this reason, the ballot will be occurring while these issues are still unresolved.

However, there remains a possibility that some of these issues could be addressed before final publication of the balloted specification.  To ensure balloters have an opportunity to evaluate the potential options and to express their opinion on the issues, they are laid out here.  If you are uncomfortable with any of the candidate resolutions to any of the issues laid out here, feel free to vote negative on the issue(s) in question.  You can consider withdrawing your negative votes when final resolutions are landed, provided you are comfortable with the resolution.

NOTE 1: It is unlikely that all of these issues will be addressed in the DTR 2.2.0 release, and it's possible that there will be no changes to the specification from any of these issues and that they will either be deferred to some future (possibly post 2026) release, or they might be closed by the submitter or otherwise resolved with no change.
NOTE 2: If there is a resolution to one or more of these issues that involves making a change to the specification that is substantively different than any of the proposed dispositions, there will be an announced public review period of the specification with the proposed change applied to give the community an opportunity to evaluate and provide feedback on the new option prior to publication.

### Expectations for interoperability
There has been discussion about the use of 'supplemental' guides and general interoperability expectations for PAS implementations.  This has manifested in the following ticket - [FHIR-50469](https://jira.hl7.org/browse/FHIR-50469) - Need guidance on supplemental guides.

####Assessment and Discussion
* If requirements can vary between communication partners in a manner that requires software to be written differently based on which system is being connected to, it will be impossible to scale interoperability to ensure that all clinical systems can talk to all payers.
* Some implementers have expressed an intention to only support interoperability with a limited set of 'large volume' partners based on this scaling issue.  This will result in an inbalance in the marketplace where large volume partners will have interoperability capabilities not available to smaller organizations and may impede the ability of smaller payers to meet metrics, as well as disadvantaging patients with such coverage.
* There is concern that strict interoperability requirements may mean that requirements discovered late in the process will not be able to be met without breaking conformance, which could create a no-win situation where either metrics can't be met because compliance prohibits successful interoperability, or successful interoperability results in non-compliance.

#### Options
Potential resolutions of these issues:

* Leave the specifications loose like they are, meaning that implementations can impose additional requirements necessitating code changes for interoperability with that partner.
* Tighten the specifications to prohibit requiring data elements beyond the specification or other otherwise not properly handling conformant instances, while still allowing exceptions where interoperability requirements have been approved through a change request and continuous-integration build update process.


<!-- ***************************************************************************************************************************************** -->

<!-- <a name="misc"> </a>
<h3>Miscellaneous issues</h3>
<p>
  These issues don't stem from any particular theme and the fact they're not yet resolved is generally based on issues other than disagreements around the basic premises of the implementation guide architecture.  They're listed here only to call attention to the fact that they're outstanding and they might be resolved as part of the balloting and publicaiton process.  Each of the remaining issues is discussed individually
</p>

<a name="FHIR-45672"> </a>
<h4><a href="https://jira.hl7.org/browse/FHIR-45672">FHIR-45672</a> - Creation of Bundle Profile(s)</h4>
<p>
  While this is a good idea in principle, there have historically been tooling challenges with adding this level osf sophisticated profiling as part of logical models.  However, there's a possibility these tooling issues will soon be addressed making this possible.  Doing this doesn't change what the IG rules are, it merely makes validation more effective.
</p>

<a name="FHIR-49757"> </a>
<h4><a href="https://jira.hl7.org/browse/FHIR-49757">FHIR-49757</a> - No guidance for CRD intermediaries wrt. access tokens</h4>
<p>
Da Vinci requires that there be a single endpoint per payer (or if HRex Endpoint Discovery is supported, a single endpoint per Coverage).  However, in practice, there may be multiple systems that manage coverage rules for different types of services and or different types of decision support behind that endpoint.  Some of these delegated systems may have a need to access the EHR's FHIR endpoint.
</p>
<p>
At present, CDS Hooks does not define a standard mechanism for managing authorization in this delegation situation, and sharing tokens is not considered good practice (and may be technically prohibited if tokens are certificate-bound or IP-range constrained).
</p>
<p>
Industry has not yet settled on best practices here.  If balloters can recommend an approach the implementer community can agree with, we could include at least 'draft' guidance in the published IG.
</p>

<a name="FHIR-xxxxx"> </a>
<h4><a href="https://jira.hl7.org/browse/FHIR-xxxxx">FHIR-51465</a> - Ticket label</h4>
<p>
  It is not uncommon for providers to solicit 
</p>
<p>
  If EHRs can give guidance on how such situations 
</p> -->

</div>