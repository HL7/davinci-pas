Profile: PASCoverage
Parent: Coverage
Id: profile-coverage
Title: "PAS Coverage"
Description: "PAS constraints on Coverage resource mandating support for insurance elements relevant to the prior authorization request"
* status MS
* status = #active (exactly)
* subscriber MS
* subscriber only Reference(PASSubscriber)
* subscriberId MS
* beneficiary MS
* beneficiary only Reference(PASBeneficiary)
* relationship MS
* payor MS
* payor only Reference(PASInsurer)
