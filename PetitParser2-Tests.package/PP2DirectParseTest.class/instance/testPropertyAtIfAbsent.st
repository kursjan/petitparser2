test - properties
testPropertyAtIfAbsent
	| parser |
	parser := PP2Node new.
	self assert: (parser propertyAt: #foo ifAbsent: [ true ]).
	parser propertyAt: #foo put: true.
	self assert: (parser propertyAt: #foo ifAbsent: [ false ])