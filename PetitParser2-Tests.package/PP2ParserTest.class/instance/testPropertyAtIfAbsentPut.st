test - properties
testPropertyAtIfAbsentPut
	| parser |
	parser := PP2Parser new.
	self assert: (parser propertyAt: #foo ifAbsentPut: [ true ]).
	self assert: (parser propertyAt: #foo ifAbsentPut: [ false ])