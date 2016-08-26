test - properties
testPropertyAtIfAbsentPut
	| parser |
	parser := PP2Node new.
	self assert: (parser propertyAt: #foo ifAbsentPut: [ true ]).
	self assert: (parser propertyAt: #foo ifAbsentPut: [ false ])