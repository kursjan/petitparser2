test - properties
testHasProperty
	| parser |
	parser := PP2Node new.
	self deny: (parser hasProperty: #foo).
	parser propertyAt: #foo put: 123.
	self assert: (parser hasProperty: #foo)