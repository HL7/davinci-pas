Profile: PASQuantity
Parent: SimpleQuantity
Id: profile-quantity
Title: "PAS Quantity"
Description: """Constraints and extensions on SimpleQuantity which restricts the units. 
Each PAS Quantity SHALL have:
1. a value
2. either a unit or a code and system.

If a code is present, it SHALL use the X12 quantity units."""
* value 1..1 MS
* unit 0..1 MS
* code 0..1 MS
* code from https://valueset.x12.org/x217/005010/request/2000F/HSD/1/01/00/673 (required)
* system 0..1 MS