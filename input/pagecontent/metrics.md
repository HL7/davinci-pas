[Previous Page - ePA Coordinator Workflow](epaWorkflow.html)

### Overview

One of the main objectives of the PAS implementation guide (and the burden reduction guides as a whole) is to
improve efficiency of the healthcare system with respect to provider-payer interaction.  However, for this
objective to be achieved, it's important that the information provided by payers be useful and timely and
it's equally important that the relevant information from the EHR be available (and findable) for payers in
computable form.

EHRs, payers, and governing authorities such as CMS will all have an interest in understanding how well the
implementation of PAS is working.  They will be interested in such questions as:

* How long does the average PAS call take to execute?
* How many PAS calls result in 'satisfied' authorization?
* How many PAS calls require access to provider information, and what type is accessed

It is likely that formal metrics (likely using the [Measure]({{site.data.fhir.path}}measure.html) resource)
will be defined to help evaluate and potentially benchmark PAS implementations.  However, in order to evaluate
such measures, the relevant information will need to be available in both provider and payer systems to support
the measures.

### Metric Examples
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