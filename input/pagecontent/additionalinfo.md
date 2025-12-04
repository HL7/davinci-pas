A payer **MAY** request additional information from the provider to support a prior authorization request by responding to the X12 278 Request with an X12 278 Response that includes any of the following:

1. One or more codes in the PWK01 element
2. One or more of the approved LOINC codes Attachments – LOINC in the HI segment
3. A single 102089-0 LOINC code in the HI segment to request information via a payer’s specific questionnaire.  When this option is used, the TRN at the X12 278 header or line level associated with the 102089-0 LOINC code **SHALL** be the DTR context ID used to retrieve the appropriate questionnaire 

There are two ways of sending attachments depending on whether it is unsolicited or solicited.  The following diagram shows the flow:
{::options parse_block_html="false" /}
<figure>
  <img style="padding-top:0;padding-bottom:30px" width="800px" src="PAS_CDex_Attachments_Workflow_Summary.png" alt="PAS Required Solicited and Unsolicited Workflows"/>
  <figcaption>Figure 3.1 - PAS Required Solicited and Unsolicited Workflows</figcaption>
</figure>
{::options parse_block_html="true" /}

Here is a high-level diagram that shows how the $submit-attachment call is used:
{::options parse_block_html="false" /}
<figure>
  <img style="padding-top:0;padding-bottom:30px" width="800px" src="high-level-submit-attachment.png" alt="High Level $submit-attachment Use"/>
  <figcaption>Figure 3.2 - High Level $submit-attachment Use</figcaption>
</figure>
{::options parse_block_html="true" /}

{::options parse_block_html="false" /}
<figure>
  <img style="padding-top:0;padding-bottom:30px" width="800px" src="pas-additionalinforequest-workflow.png" alt="PAS Additional Documentation Request Workflow"/>
  <figcaption>Figure 3.3 - Request For Additional Information Workflow</figcaption>
</figure>
{::options parse_block_html="true" /}

The [PAS task profile](StructureDefinition-profile-task.html) **SHALL** be used to convey PAS X12 278 Response information to CDex.
 
All of the additional information request codes **SHOULD** be used as input to a CDex task.  The CDex task will include all of the information required to enable CDex to assemble the required documentation and send it to the payer’s operation endpoint for attachments.  When the LOINC code 102089-0 is present, the associated TRNs **SHALL** also be exchange as Task.input.  The following diagram defines the PAS, CDex, DTR workflow. A separate task **SHALL** be created for each of the above attachment request types (PWK01, LOINC, questionnaire).

Although CDex defines a set of operations, it **MAY** be implemented in a separate module.  The Task is used to represent the information that is needed to make the CDex calls.  If the CDex calls are not in a separate module, then the Task may just be conceptual and not actually created.  In PAS, the Task is created by the Provider but that the remaining CDex workflow remains the same.

PAS uses the Task based profile to request additional documentation (“attachments”) for prior authorizations. It constrains the Task resource to minimal necessary data elements needed to request specific attachments and provides the information necessary to respond via the $submit-attachment operation. This response is compatible with existing 278 response transactions to allow reassociation of the requested documents (using LOINC codes and/or PWK01 codes) and/or questionnaireResponse(s).  The following Task profile supports all of the elements necessary to exchange a request for additional documentation between the PAS 278 response and CDex.  For guidance when the provider is not able to complete the Task, refer to the [When The Task Cannot Be Completed CDex section ](http://hl7.org/fhir/us/davinci-cdex/STU2/task-based-approach.html#when-the-task-cannot-be-completed).
Note: since task.code is cardinality 0..1, a Task will need to be created for each of the values (if required).  One for code(s) and another for questionnaire(s).

A Task.code of either “attachment-request-code” or “attachment-request-questionnaire” is communicating that the Payer is requesting attachments for a prior authorization using a code or data request questionnaire:

* If the code is “attachment-request-code”, the provider system returns attachment(s) identified by the LOINC attachment code(s) or the PWK01 cod(s)in the “attachments-needed” input parameter.
* If the code is “attachment-request-questionnaire”, the provider system uses Documentation Templates and Rules (DTR) to complete the Questionnaire referenced in the "questionnaires-needed" input parameter.
* When either code is present, the provider system uses the $submit-attachment operation to return the information to the endpoint provided in “payer-url” input parameter.

The Task.requester.identifier and Task.owner.reference represents the Payer ID
The Task.for references the Patient information.
The Task.reasonReference references the Prior Authorization request.

The Task.input provides for the following information:

* 'payerUrl' slice represents the Payer endpoint URL that is used to submit attachments using the $submit-attachment operation
* 'attachmentsNeeded' slice communicates which attachments are needed using LOINC attachment or PWK01 codes
* 'questionnairesNeeded' slice communicates to DTR which questionnaire(s) are needed using TRN codes

Both the 'attachmentsNeeded' and 'questionnairesNeeded' slice contains an extension point to the prior authorization line number.

|PAS Task Profile Element|PAS Claim Response Element|
|---|---|
|identifier|ClaimResponse.identifier[0]|
|reasonCode|Fixed to 'priorAuthorization'|
|requestor.identifier|ClaimResponse.insurer.identifier[0]|
|reasonReference|ClaimResponse.request|
|input "paLineNumber" extension|CommunicationRequest.payload "serviceLineNumber" extension|
|input "AttachmentsNeeded" slice value|CommunicationRequest.payload.contentString|
|input "AttachmentsNeeded" slice "contentModifier" extension|CommunicationRequest.payload "contentModifier" extension|
|input "QuestionnaireContext" slice value| Claim.item "itemTraceNumber" extension|
