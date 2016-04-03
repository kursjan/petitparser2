test - properties
testRemoveProperty
	| parser |
	parser := PP2Parser new.
	self should: [ parser removeProperty: #foo ] raise: Error.
	parser propertyAt: #foo put: true.
	self assert: (parser removeProperty: #foo)