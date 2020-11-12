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
* relationship from https://valueset.x12.org/x217/005010/request/2000D/INS/1/02/00/1069 (required)
* relationship  ^binding.description = "Codes indicating the relationship between two individuals or entities. These codes are listed within an X12 implementation guide (TR3) and maintained by X12. All X12 work products are copyrighted. See their website for licensing terms and conditions."
* payor MS
* payor only Reference(PASInsurer)
