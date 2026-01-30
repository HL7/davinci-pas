### Mandatory Data Elements
The following data elements must always be present.

§§prof-1^client,payer^exchange:Timings SHALL have at least a count, frequency and period, a calendarPattern, or a deliveryPattern^

**Each PAS Timing SHALL have at least one of:**
1. count (with optional countMax)
2. frequency and period and periodUnit (with optional frequencyMax and periodMax)
3. calendarPattern extension
4. deliveryPattern extension

§§

Please see the documentation on the FHIR Timing datatype for more information of how common timing uses are represented.
