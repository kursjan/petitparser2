test - properties
testRemovePropertyIfAbsent
	| parser |
	parser := PP2Parser new.
	self assert: (parser removeProperty: #foo ifAbsent: [ true ]).
	parser propertyAt: #foo put: true.
	self assert: (parser removeProperty: #foo ifAbsent: [ false ])