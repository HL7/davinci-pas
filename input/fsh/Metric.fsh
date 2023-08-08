Logical: PASMetricData
Id: PASMetricData
Title: "PAS Metric Data"
Description: "A logical model describing the information that should be captured by PAS implementers about every PAS invocation to support measures evaluating PAS implementation"
* ^status = #draft
* ^experimental = false
* ^extension[http://hl7.org/fhir/StructureDefinition/structuredefinition-fmm].valueInteger = 1
* ^extension[http://hl7.org/fhir/StructureDefinition/structuredefinition-standards-status].valueCode = #informative
* source            1..1 code            "provider-src | intermediary-src | payer-src"            "A code to indicate which type of system collected the metric data."
* source    from MetricDataSource      (required)
* providerId        1..1 Identifier      "User invoking hook"                  "The NPI number of the user who initiated the PAS request."
* providerId.system = "http://hl7.org/fhir/sid/us-npi"
* providerId.value  1..1
* groupId           1..1 Identifier      "Healthcare org of user"              "The NPI of the hospital/clinic/other organization that initiated the PAS request."
* groupId.system    = "http://hl7.org/fhir/sid/us-npi"
* groupId.value     1..1
* payerId           1..1 Identifier      "Payer receiving hook"                "The identifier of the payer organization to whom the PAS call was made."
* payerId.system    1..1
* payerId.value     1..1
* trackingId        1..1 Identifier     "Submission Tracking ID"              "This is the provider assigned tracking ID."
* trackingId.system 1..1
* trackingId.value  1..1
* exchanges         1..* BackboneElement "Prior Authorization Exchanges" "Exchanges between providers, intermediares, and payers to support prior authorization."
  * submissionType  1..1 code  "initial | subsequent | cancel | update | query | initialDocToPayer"   "A code indicating the type of exchange"
  * exchangeWith    0..1 code  "provider | intermediary | payer"               "The destination for the exchange"
  * exchangeTYpe    1..1 code  "x12 | RESTful | IHE | Direct | Other"          "The exchange standard used for this exchange"
  * requestTime       1..1 instant         "Time exchange initiated"                 "For providers, the time the PAS request was made.  For payers, the time the PAS request was received."
  * responseTime      0..1 instant         "Time of exchange response"               "For providers, the time the PAS response was received.  For payers, the time the PAS response was returned."
  * exchangeResponse      0..1 positiveInt     "e.g. 200"                            "What HTTP response code was returned for the PAS request."
  * errorCode            1..1 code            "Error code"                          "The issue.code value from the OperationOutcome for this issue."
  * errorCode            from IssueType             (required)
  * errorDetails         0..1 CodeableConcept "More detailed error code"            "The issue.details value from the OperationOutcome for this issue."
  * errorDetails         from OperationOutcomeCodes (example)
  * AAACodes 0..* BackboneElement "AAA codes returned" "Any AAA codes returned during the exchange."
    * loopID 1..1 string "Id of element where error occurred" "The loop, segment, or element where error occurred."
    * code 1..1 string "Specific AAA code returned" "The AAA code returned during the exchange."
    * followupAction 0..1 CodeableConcept "What action must be taken" "What action must be taken to resolve this error."
    * followupAction from X12278FollowUpActionCodes (required)
* itemDetail        0..* BackboneElement "Service level item detail" "Service level detail."
  * itemTraceNumber 0..1 integer      "Item Trace Number"     "This is the payer assigned trace number for this item."
  * item            1..1 CodeableConcept "eg. ICD10, HCPCS, NDC"  "The specific procedure, item, medication, appointment, nutrition that is the subject of the order."
  * assertionId     0..1  string  "Unique ID for order item"  "The unique ID for the order item returned by CRD in the coverage information."
  * initialSubmissionTime 0..1 dateTime "Date/time of the initial submission of the item" "Date/time of the initial submission of the service item."
  * finalResponseTime 0..1 dateTime "Date/time of final result" "Date/time that the final result was returned for the specific service item."
  * responsesRequired 0..1 integer  "Number of responses"  "Number of responses (initial and any with result pended) for the service item."
  * AAACodes 0..* BackboneElement "AAA codes returned" "Any AAA codes returned during the exchange."
    * loopID 1..1 string "Id of element where error occurred" "The loop, segment, or element where error occurred."
    * code 1..1 string "Specific AAA code returned" "The AAA code returned during the exchange."
    * followupAction 0..1 CodeableConcept "What action must be taken" "What action must be taken to resolve this error."
    * followupAction from X12278FollowUpActionCodes (required)
  * result  0..1  code "approved | modified | denied"  "Final result of the specific service item."
  * supportingDocumentation  0..1  url "Documentation submitted as part of PAS Bundle"  "The URL of the questionnaire that was the basis for the questionnaireResponse submitted as part of the PAS bundle for the specific service item."
  * requestedDocumentation 0..* BackboneElement "Documentation requested via 278 response" "Documentation requested via 278 response."
    * additionalDocumentationReq 1..*  CodeableConcept "Coded requests for additional documentation" "Coded requests for documentation in the 278 response."
    * timeRequested 1..1 dateTime "Date/Time of initial request" "Date/Time of initial request for this item."
    * timeSubmitted 0..1 dateTime "Date/Time of final result" "Date/Time of final result for this item."
    * submissionMethod 0..1 code "CDex | portal | fax | x12 | other" "The technical method used to submit the requested additional documentation."
* exceptionSubmission 0..1 boolean "True if exchange is based on the exception grant" "Indicator that exchange was performed under an exception grant from the National Standard Group."
* locationType 0..1 CodeableConcept "Site of Service" "The site where the service will be performed."
* businessLine  0..1 CodeableConcept "E.g. MedicareAdvantage"              "A code that indicates which type of insurance the patient is covered by."


ValueSet: MetricDataSource
Id: metricDataSource
Title: "Metric Data Source"
Description: "A list of codes indicating the perspective from which metric data was captured"
* ^status = #draft
* ^experimental = false
* PASTempCodes#payer-src
* PASTempCodes#provider-src
* PASTempCodes#intermediary-src

CodeSystem: PASTempCodes
Id: temp
Title: "PAS Temporary Codes"
Description: "Codes temporarily defined as part of the PAS implementation guide.  These will eventually migrate into an officially maintained terminology (likely either SNOMED CT or HL7's UTG code systems)."
* ^status = #draft
* ^experimental = false
* ^caseSensitive = true
* ^hierarchyMeaning = #is-a
* ^content = #complete

// Metric data source
* #provider-src            "Provider-sourced"                  "The metric information was captured from the provider system's perspective"
* #payer-src               "Payer-sourced"                     "The metric information was captured from the payer system's perspective"
* #intermediary-src               "Intermediary-sourced"                     "The metric information was captured from the intermediary system's perspective"
