testing-objects
testEmptyObject
	self parse: '{}'.
	self assert: (result isKindOf: Dictionary).
	self assert: result isEmpty