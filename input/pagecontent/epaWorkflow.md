The current [CRD](http://hl7.org/fhir/us/davinci-crd/), [DTR](http://hl7.org/fhir/us/davinci-dtr/), PAS, and [CDex](http://hl7.org/fhir/us/davinci-cdex/) supporting the electronic Prior Authorization (ePA) workflow only focuses on the interactions between the provider HIT in total and the payer HIT in total, not the necessary interactions among the respective HIT solutions that make up the provider and payer HIT environment that need to participate in the ePA workflow.
Given the combinations of Health Information Technology (HIT) components that may be required to support prior authorization, ONC consider a certification process where certified software can use generic (or generically referenced) relied-upon software to meet certain requirements and can clearly specify the capabilities they rely on without the need to assert each permutation of relied-upon software with which they support the ePA workflow. Further guidance is needed for the interactions necessary within each of the provider and payer HIT configurations based on the functions/roles of those HIT solutions, and requires the relied upon software approach using predictable, standards-based capabilities to participate in an ePA workflow and for HIT that provides full support for ePA workflow through its certified HIT.
The following drawing demonstrates the PAS Workflow exchanges between an integrated provider HIT environment and an integrated payer HIT environment via an intermediary in the upper portion.  The lower portion of the PAS workflow drawing represents the potential for electronic Prior Authorization (ePA) coordinator functionality to play a role between the provider HIT and the intermediary or between the intermediary and the payer HIT.  It should be noted that the exchanges between the provider HIT (including any ePA) and the payer HIT (including any ePA) **SHALL** replicate all of the defined exchanges between provider and intermediary or the intermediary and payer (represented by the green and orange arrows).  The red and purple arrows are representative of information exchange between the Provider ePA and the Provider systems (red arrows) or the information exchange between the Payer ePA and the Payer systems (purple arrows).

{::options parse_block_html="false" /}
<figure>
  <img style="padding-top:0;padding-bottom:30px" width="800px" src="pas-cdex-workflow.svg" alt="PAS /CDex Workflow"/>
  <figcaption>Figure 6.1 - PAS/CDex Workflow</figcaption>
</figure>
{::options parse_block_html="true" /}

 
The following drawing provides additional detail regarding the exchanges between a Provider ePA Coordinator, multiple Provider HIT systems and the payer.  The boxes below the workflow drawing indicate the activities of the various components. From left to right: 1) the Provider HIT systems, 2) the Provider ePA coordinator, and 3) the Payer HIT. The numbered workflow in the Provider ePA Coordinator indicates the inputs from the example Provider HIT systems that are involved in creating the exchanges between the Provider HIT and the Intermediary. This includes:
1)	Initiating PAS
2)	Retrieving HIT information for the PA bundle
3)	Receiving the decision
4)	Subscribing to updates
5)	Sending status updates (including updates and cancels)
6)	Receiving decisions (for PACS systems, if necessary)
7)	Retrieving documentation based on feedback in the X12 278 PWK01 or HI LOINC codes
 
{::options parse_block_html="false" /}
<figure>
  <img style="padding-top:0;padding-bottom:30px" width="800px" src="epadetail.svg" alt="Provider ePA Coordinator Detail"/>
  <figcaption>Figure 6.2 - Provider ePA Coordinator Detail</figcaption>
</figure>
{::options parse_block_html="true" /}


 
The following graphic and associated table provides an example of the type of interactions that will need to be supported between an ePA coordinator and the various Provider HIT components.  These interactions include:
1)	Initiating PAS
2)	Retrieving HIT information for the PA bundle
3)	Receiving the decision
4)	Subscribing to updates
5)	Sending status updates (including updates and cancels)
6)	Receiving decisions 
7)	Retrieving documentation based on feedback in the X12 278 PWK01 or LOINC codes
The table briefly describes each action along with:
•	Provider systems impacted, 
•	Provider API requirements
•	ePA Coordinator API requirements
•	Comments regarding each transaction 
 
{::options parse_block_html="false" /}
<figure>
  <img style="padding-top:0;padding-bottom:30px" width="800px" src="epainteractions.svg" alt="PAS/CDex Provider HIT / ePA Coordinator Intractions"/>
  <figcaption>Figure 6.3 - PAS/CDex Provider HIT / ePA Coordinator Intractions</figcaption>
</figure>
{::options parse_block_html="true" /}


The above graphics and descriptions outline the relevant interactions that will be further documented in subsequent releases of the IG as implementations of various combinations of HIT further inform the specifications.
