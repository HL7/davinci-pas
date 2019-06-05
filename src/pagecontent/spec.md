This section of the implementation guide defines the specific conformance requirements for systems wishing to conform to this Prior Authorization Support implementation guide.  The bulk of it focuses on the Claim $submit operation, though it also provides guidance on privacy, security and other implementation requirements.


### Context

#### Pre-reading
Before reading this formal specification, implementers should first familiarize themselves with two other key portions of the specification:

* The [Use Cases & Overview](usecases.html) page provides context for what this formal specification is trying to accomplish and will give a sense of both the business context and general process flow enabled by the formal specification below.

* The [Technical Background](background.html) page provides information about the underlying specifications and indicates what portions of them should be read and understood to have necessary foundation to understand the constraints and usage guidance described here.


#### Conventions
This implementation guide uses specific terminology to flag statements that have relevance for the evaluation of conformance with the guide:

* **SHALL** indicates requirements that must be met to be conformant with the specification.

* **SHOULD** indicates behaviors that are strongly recommended (and which may result in interoperability issues or sub-optimal behavior if not adhered to), but which do not, for this version of the specification, affect the determination of specification conformance.

* **MAY** describes optional behaviors that are free to consider but where the is no recommendation for or against adoption.


#### Systems

This implementation guide sets expectations for two types of systems:

* **Client** systems are electronic medical records, pharmacy systems and other clinical and administrative systems responsible for requesting prior authorizations
* **Payer** systems are systems run by insurers, clearing houses and other organizations that are responsible for relaying or responding to requests for prior authorization


#### Profiles
This specification makes significant use of [FHIR profiles]({{site.data.fhir.path}}profiling.html) and terminology artifacts to describe the content to be shared as part of prior authorization requests and responses.

The full set of profiles defined in this implementation guide can be found by following the links on the [Artifacts](allartifacts.html) page.
