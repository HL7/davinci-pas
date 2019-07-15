### Da Vinci
Da Vinci is an HL7-sponsored project that brings together the U.S. EHR vendor and Payer communities to help payers and providers to positively impact clinical, quality, cost, and care management outcomes using FHIR-related technologies.  The project organizes meetings (face-to-face and conference calls) as well as connectathons to find ways to leverage FHIR technologies to support and integrate value-based care (VBC) data exchange across communities.  Additional information about Da Vinci, its members, the use cases and the implementation guides being developed can all be found on the [HL7 website](http://www.hl7.org/about/davinci).  Meeting minutes and other materials can be found on the [Da Vinci Confluence page](https://confluence.hl7.org/display/DVP).

### Systems
The PAS implementation guide defines the responsibilities of the two types of systems involved in a PAS solution:

**Client systems** are typically Electronic Medical Record (EMR) systems but could theoretically be any system responsible for requesting prior authorizations .  (E.g. pharmacy systems, dental systems, etc.)

**Payer systems** (or servers) are systems that act on behalf of payer organizations and which process requests for prior authorizations or which relay those requests to downstream systems (and return back the resulting responses).

### Underlying technologies

This guide is based on the [HL7 FHIR]({{site.data.fhir.path}}index.html) standard.  Implementers of this specification therefore need to understand some basic information about these specifications.


#### FHIR

This implementation guide uses terminology, notations and design principles that are
specific to FHIR.  Before reading this implementation guide, it's important to be familiar with some of the basic principles of FHIR as well
as general guidance on how to read FHIR specifications.  Readers who are unfamiliar with FHIR are encouraged to read (or at least skim) the following
prior to reading the rest of this implementation guide.

* [FHIR overview]({{site.data.fhir.path}}overview.html)
* [Developer's introduction]({{site.data.fhir.path}}overview-dev.html) (or [Clinical introduction]({{site.data.fhir.path}}overview-clinical.html))
* [FHIR data types]({{site.data.fhir.path}}datatypes.html)
* [Using codes]({{site.data.fhir.path}}terminologies.html)
* [References between resources]({{site.data.fhir.path}}references.html)
* [How to read resource & profile definitions]({{site.data.fhir.path}}formats.html)
* [Base resource]({{site.data.fhir.path}}resource.html)

This implementation guide supports the [R4]({{site.data.fhir.path}}index.html) version of the FHIR standard. R4 is just recently published and the goal is to ensure the implementation guide is aligned with the current direction of the FHIR standard.

This implementation guide also builds on the US Core Implementation Guide and implementers need to familiarize themselves with the profiles in those Implementation Guides:
<table>
  <tr>
    <td><a href="http://hl7.org/fhir/us/core/2019Jan">US Core (3.0.0 - R4 based)</a></td>
  </tr>
  <tr>
    <td><a href="http://hl7.org/fhir/us/core/STU2">US Core (2.0.0 - STU3 based)</a></td>
  </tr>
</table>


Implementers should also familiarize themselves with the FHIR resources used within the guide:
<!-- TODO: update this table -->
<table>
  <thead>
    <tr>
      <th>STU3</th>
      <th>R4</th>
    </tr>
  </thead>
  <tr>
    <td>
      <a href="http://hl7.org/fhir/STU3/appointment.html">Appointment</a><br/>
      <a href="http://hl7.org/fhir/STU3/coverage.html">Coverage</a><br/>
      <a href="http://hl7.org/fhir/STU3/communicationrequest.html">CommunicationRequest</a><br/>
      <a href="http://hl7.org/fhir/STU3/device.html">Device</a><br/>
      <a href="http://hl7.org/fhir/STU3/devicerequest.html">DeviceRequest</a><br/>
      <a href="http://hl7.org/fhir/STU3/encounter.html">Encounter</a><br/>
      <a href="http://hl7.org/fhir/STU3/location.html">Location</a><br/>
      <a href="http://hl7.org/fhir/STU3/organization.html">Organization</a><br/>
      <a href="http://hl7.org/fhir/STU3/medication.html">Medication</a><br/>
      <a href="http://hl7.org/fhir/STU3/medicationrequest.html">MedicationRequest</a><br/>
      <a href="http://hl7.org/fhir/STU3/nutritionorder.html">NutritionOrder</a><br/>
      <a href="http://hl7.org/fhir/STU3/patient.html">Patient</a><br/>
      <a href="http://hl7.org/fhir/STU3/practitioner.html">Practitioner</a><br/>
      <a href="http://hl7.org/fhir/STU3/practitionerrole.html">PractitionerRole</a><br/>
      <a href="http://hl7.org/fhir/STU3/procedurerequest.html">ProcedureRequest</a><br/>
      <a href="http://hl7.org/fhir/STU3/questionnaire.html">Questionnaire</a><br/>
      <a href="http://hl7.org/fhir/STU3/referralrequest.html">ReferralRequest</a><br/>
      <a href="http://hl7.org/fhir/STU3/supplyrequest.html">SupplyRequest</a><br/>
      <a href="http://hl7.org/fhir/STU3/task.html">Task</a><br/>
      <a href="http://hl7.org/fhir/STU3/visionprescription.html">VisionPrescription</a>
    </td>
    <td>
      <a href="{{site.data.fhir.path}}appointment.html">Appointment</a><br/>
      <a href="{{site.data.fhir.path}}coverage.html">Coverage</a><br/>
      <a href="{{site.data.fhir.path}}communicationrequest.html">CommunicationRequest</a><br/>
      <a href="{{site.data.fhir.path}}device.html">Device</a><br/>
      <a href="{{site.data.fhir.path}}devicerequest.html">DeviceRequest</a><br/>
      <a href="{{site.data.fhir.path}}encounter.html">Encounter</a><br/>
      <a href="{{site.data.fhir.path}}location.html">Location</a><br/>
      <a href="{{site.data.fhir.path}}organization.html">Organization</a><br/>
      <a href="{{site.data.fhir.path}}medication.html">Medication</a><br/>
      <a href="{{site.data.fhir.path}}medicationrequest.html">MedicationRequest</a><br/>
      <a href="{{site.data.fhir.path}}nutritionorder.html">NutritionOrder</a><br/>
      <a href="{{site.data.fhir.path}}patient.html">Patient</a><br/>
      <a href="{{site.data.fhir.path}}practitioner.html">Practitioner</a><br/>
      <a href="{{site.data.fhir.path}}practitionerrole.html">PractitionerRole</a><br/>
      <a href="{{site.data.fhir.path}}questionnaire.html">Questionnaire</a><br/>
      <a href="{{site.data.fhir.path}}servicerequest.html">ServiceRequest</a><br/>
      <a href="{{site.data.fhir.path}}supplyrequest.html">SupplyRequest</a><br/>
      <a href="{{site.data.fhir.path}}task.html">Task</a><br/>
    </td>
  </tr>
</table>

#### X12
=======
This implementation guide also builds on the US Core Implementation Guide and implementers need to familiarize themselves with the profiles in that Implementation Guide: <a href="http://hl7.org/fhir/us/core/2019Jan">US Core (2.1.0 - R4 based)</a>