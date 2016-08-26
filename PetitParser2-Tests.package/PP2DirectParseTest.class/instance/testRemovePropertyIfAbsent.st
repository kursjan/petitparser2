test - properties
testRemovePropertyIfAbsent
	| parser |
	parser := PP2Node new.
	self assert: (parser removeProperty: #foo ifAbsent: [ true ]).
	parser propertyAt: #foo put: true.
	self assert: (parser removeProperty: #foo ifAbsent: [ false ])