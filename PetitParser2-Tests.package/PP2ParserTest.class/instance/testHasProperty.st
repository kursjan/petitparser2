test - properties
testHasProperty
	| parser |
	parser := PP2Parser new.
	self deny: (parser hasProperty: #foo).
	parser propertyAt: #foo put: 123.
	self assert: (parser hasProperty: #foo)