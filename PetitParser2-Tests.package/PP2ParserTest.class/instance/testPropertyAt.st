test - properties
testPropertyAt
	| parser |
	parser := PP2Parser new.
	self should: [ parser propertyAt: #foo ] raise: Error.
	parser propertyAt: #foo put: true.
	self assert: (parser propertyAt: #foo)