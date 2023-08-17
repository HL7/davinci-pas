[Previous Page - ePA Coordinator Workflow](epaWorkflow.html)

### Overview

This Implementation Guide (IG) is one of 4 HL7 Da Vinci IGs that are designed to address the challenges of automating the exchange of information between a provider and the responsible payer to determine coverage of services, items, and referrals. In particular, these IGs standardize the exchange of information required to automate the Prior Authorization (PA) process. The specific IG are:

1. [Coverage Requirements Discovery (CRD)](http://hl7.org/fhir/us/davinci-crd)
2. [Documentation Templates and Rules (DTR)](http://hl7.org/fhir/us/davinci-dtr)
3. Prior Authorization Support (PAS) (this guide)
4. [Clinical Documentation Exchange (CDex)](http://hl7.org/fhir/us/davinci-cdex)

Each guide supports a specific set of functions and exchanges required to determine payer coverage for specific services, items, and referrals.

To maximize the value of these IGs, it is imperative that each IG is integrated into clinical workflow at the appropriate point and all of the exchanges required by each IG are fully supported by all of the participants (providers, intermediaries, and payers).

Each of these IGs recommends a set of metrics that **SHOULD** or **MAY** be collected by their respective implementations to facilitate the evaluation of adoption, functionality, processes, and improved outcomes. While there is currently no requirement to report on these metrics, it is reasonable to believe that in the future interested entities (providers, payers, regulators, quality organizations, certification agencies, states, etc.) will ask for these metrics to evaluate the ongoing automation of the supported processes / exchanges. While this guide will not require these metrics to be captured in this release, the authors strongly suggest each implementation should do so with the expectation that collection and dissemination of these metrics may become a requirement (SHALL) in future version of these IGs.

The table below defines a set of measures with a short name, purpose, conformance, stakeholder, and collection/calculation instructions that represent what the project group designing this IG felt would be both reasonably collectable and useful in evaluating implementations of this IG.  These measures are based on the [metric data model logical model](StructureDefinition-PASMetricData.html) also published in this IG.

### Suggested Metrics
The following table defines a set of metrics with a purpose, type, and stakeholder (based on the Metric Data model below). 

<table style="text-align: center; vertical-align: middle;">
  <tr>
    <th></th>
    <th style="width: 140px; text-align: center; vertical-align: middle;">Metric</th>
    <th style="width: 125px; text-align: center; vertical-align: middle;">Metric Type</th>
    <th style="width: 140px; text-align: center; vertical-align: middle;">Stakeholder</th>  
  </tr>
  <tr>
    <td style="text-align: center; vertical-align: middle;">1</td>
    <td style="text-align: center; vertical-align: middle;">Volume of PAS submissions (as 278 and line items)</td>
    <td style="text-align: center; vertical-align: middle;">Adoption</td>
    <td style="text-align: center; vertical-align: middle;">Provider / Payer / Intermediary</td>   
  </tr>
  <tr>
    <td style="text-align: center; vertical-align: middle;">2</td>
    <td style="text-align: center; vertical-align: middle;">Volume of PAS Updates, Cancels, Queries</td>
    <td style="text-align: center; vertical-align: middle;">Adoption Process</td>
    <td style="text-align: center; vertical-align: middle;">Provider / Payer / Intermediary</td>   
  </tr>
  <tr>
    <td style="text-align: center; vertical-align: middle;">3</td>
    <td style="text-align: center; vertical-align: middle;">Volume of queries by other than ordering provider</td>
    <td style="text-align: center; vertical-align: middle;">Process</td>
    <td style="text-align: center; vertical-align: middle;">Provider / Payer / Intermediary</td>   
  </tr>
  <tr>
    <td style="text-align: center; vertical-align: middle;">4</td>
    <td style="text-align: center; vertical-align: middle;">% of PAS submissions returning an error (by type and payer)</td>
    <td style="text-align: center; vertical-align: middle;">Process</td>
    <td style="text-align: center; vertical-align: middle;">Provider (all errors) / Payer (subset) / Intermediary (subset)</td>   
  </tr>
  <tr>
    <td style="text-align: center; vertical-align: middle;">5</td>
    <td style="text-align: center; vertical-align: middle;">% of PAS submissions returning a final result on initial submission (any item and all items)</td>
    <td style="text-align: center; vertical-align: middle;">Process Outcome</td>
    <td style="text-align: center; vertical-align: middle;">Provider / Payer</td>   
  </tr>
  <tr>
    <td style="text-align: center; vertical-align: middle;">6</td>
    <td style="text-align: center; vertical-align: middle;">Volume of line items that have an initial PEND and number of PENDS that were resolved and (more complex) average time to resolve each PEND</td>
    <td style="text-align: center; vertical-align: middle;">Process Outcome</td>
    <td style="text-align: center; vertical-align: middle;">Provider / Payer</td>   
  </tr>
  <tr>
    <td style="text-align: center; vertical-align: middle;">7</td>
    <td style="text-align: center; vertical-align: middle;">Total time from initial submission until final PA result for all line items</td>
    <td style="text-align: center; vertical-align: middle;">Process</td>
    <td style="text-align: center; vertical-align: middle;">Provider / Payer</td>   
  </tr>
  <tr>
    <td style="text-align: center; vertical-align: middle;">8</td>
    <td style="text-align: center; vertical-align: middle;">All of the above by payer / provider (depending on metric) and over time</td>
    <td style="text-align: center; vertical-align: middle;">Segmentation</td>
    <td style="text-align: center; vertical-align: middle;">Provider / Payer</td>   
  </tr>
  <tr>
    <td style="text-align: center; vertical-align: middle;">9</td>
    <td style="text-align: center; vertical-align: middle;">Outstanding PAS requests</td>
    <td style="text-align: center; vertical-align: middle;">Operation Dashboard</td>
    <td style="text-align: center; vertical-align: middle;">Provider / Intermediary</td>   
  </tr>
  <tr>
    <td style="text-align: center; vertical-align: middle;">10</td>
    <td style="text-align: center; vertical-align: middle;">Aging of PENDED requests</td>
    <td style="text-align: center; vertical-align: middle;">Operation Dashboard</td>
    <td style="text-align: center; vertical-align: middle;">Provider / Intermediary</td>   
  </tr>
</table>

### Metric Data Model
In the interest of enabling such evaluation processes, this guide has defined a 
[logical PAS Metric model](StructureDefinition-PASMetricData.html) that describes the data elements most
likely to be relevant for such evaluation.

This model is NOT a FHIR data structure for information exchange.  Instead, it is a logical model that describes
the types of data that should be available and any constraints on the data (e.g. cardinality, terminology) that
should be captured by PAS implementers to support the evaluation of metrics.  Measures can then be defined
in a standardized way based on these measures.

PAS implementers **SHOULD** store information for each PAS call in a manner that would allow them to respond to
measures based on this logical model.

[Next Page - Downloads](downloads.html)