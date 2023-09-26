Logical: PASMetricData
Id: PASMetricData
Title: "PAS Metric Data"
Description: "A logical model describing the information that should be captured by PAS implementers about every PAS invocation to support measures evaluating PAS implementation"
* ^status = #draft
* ^experimental = false
* ^extension[http://hl7.org/fhir/StructureDefinition/structuredefinition-fmm].valueInteger = 1
* ^extension[http://hl7.org/fhir/StructureDefinition/structuredefinition-standards-status].valueCode = #informative
* source            1..1 code            "provider | intermediary | payer"            "A code to indicate which type of system collected the metric data."
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
* exchange         1..* BackboneElement "Prior Authorization Exchanges" "Exchanges between providers, intermediares, and payers to support prior authorization."
  * type  1..1 code  "initial | subsequent | cancel | update | query | initialDocToPayer"   "A code indicating the type of exchange"
  * with    0..1 code  "provider | intermediary | payer"               "The destination for the exchange"
  * method    1..1 code  "x12 | restful | ihe | direct | other"          "Exchange standard used for this specific exchange.  Note: RESTful is the default for any Provider to Intermediary exchange, X12 is the defalt for any exchange between the intermediary and the payer for the X12 278, the exchange of the PAS bundle between the intermediary and the payer may be any of the methods included in the value set."
  * requestTime       1..1 instant         "Time exchange initiated"                 "For providers, the request was made.  For payers, the time the request was received.  For intermediaries time the request was received from the provider or time the request was sent to the payer."
  * responseTime      0..1 instant         "Time of exchange response"               "For providers, the response was received.  For payers, the time the response  was sent.  For intermediaries time the response  was sent to the provider or time the response was received from the payer."
  * httpResponse      1..1 code     "e.g. 200"                            "What HTTP response code was returned for the exchange invocation."
* issue 0..* BackboneElement "OperationOutcome info" "In the event of an HTTP error, if an OperationOutcome was returned, what were the issues."
  * code            1..1 code            "Error code"                          "The issue.code value from the OperationOutcome for this issue."
  * code            from IssueType             (required)
  * details         0..1 CodeableConcept "More detailed error code"            "The issue.details value from the OperationOutcome for this issue."
  * details         from OperationOutcomeCodes (example)
* aaaCodes 0..* BackboneElement "AAA codes returned" "Any AAA codes returned during the exchange."
  * loopID 1..1 code "see X12 loop IDs" "X12 loop ID."
  * aaaCode 1..1 code "approved | modified | denied" "AAA code returned with response."
* itemDetail        0..* BackboneElement "Service level item detail" "Service level detail.  One interation of the backbone for each service item in the PA exchange."
  * trn 0..1 integer      "Service Level TRN"     "Service level TRN assigned by the payer if a questionnaire is required."
  * item            1..1 CodeableConcept "eg. ICD10, HCPCS, NDC"  "The specific procedure, item, medication, appointment, nutrition that is the subject of the order."
  * assertionId     0..1  string  "Unique ID for order item"  "The unique ID for the order item returned by CRD in the coverage information."
  * initialSubmissionTime 0..1 dateTime "Date/time of the initial submission of the item" "Date/time of the initial submission of the servcie item. This may be the time of the initial PA request or the time of an updated that added the service item."
  * finalResponseTime 0..1 dateTime "Date/time of final result" "Date/time that the final result was returned for the specific service item."
  * responsesRequired 0..1 integer  "Number of responses"  "Number of responses (initial and any with result pended) for the service item."
  * aaaCodes 0..* BackboneElement "AAA codes returned" "Any AAA codes returned during the exchange."
    * loopID 1..1 code "see X12 loop IDs" "X12 loop ID."
    * aaaCode 1..1 code "approved | modified | deined" "AAA error code returned in the response."
  * locationType 0..1 code "inpatient | outpatient | home" "The site where the service will be performed."
  * result  0..1  code "approved | modified | denied | pended"  "Final result of the specific service item."
  * denialReason 0..1 code "Denial Reason" "A code specifying the reason why the item was denied."
* supportingDoc  0..1  url "Documentation submitted as part of PAS Bundle"  "The URL of the questionnaire that was the basis for the questionnaireResponse submitted as part of the PAS bundle for the specific service item."
* requestedDoc 0..* BackboneElement "Documentation requested via 278 response" "Documentation requested via 278 response."
  * docRequest 1..*  CodeableConcept "Coded requests for additional documentation" "Coded requests for documentation in the 278 response. May be LOINC codes as determined by HIPAA tab or X12 codes from the PWK01 element."
  * timeRequested 1..1 dateTime "Date/Time of initial request" "Date/Time of initial request for this item (may be part of the initial submission or part an update."
  * timeSubmitted 0..1 dateTime "Date/Time of final result" "Date/Time of final result for this item (may be part of the initial submission or part an update."
  * submissionMethod 0..1 code "CDex | portal | fax | x12 | other" "The technical method used to submit the requested additional documentation."
* exceptionSubmission 0..1 boolean "True if exchange is based on the exception grant" "Indicator that exchange was performed under an exception grant from the National Standard Group."
* businessLine  0..1 CodeableConcept "E.g. MedicareAdvantage"              "A code that indicates which type of insurance the patient is covered by."
