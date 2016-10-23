utilities
assertInvalid: aString
	self 
		should: [ self parse: aString ]
		raise: TestResult failure
		description: 'PetitParser could parse an invalid input'