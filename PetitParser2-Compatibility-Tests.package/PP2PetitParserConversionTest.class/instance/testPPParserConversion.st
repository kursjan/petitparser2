test - conversion
testPPParserConversion
	| converted parser |
	parser := PPParser new
		propertyAt: #foo ifAbsentPut: #bar;
		name: 'foobar'
		yourself.
		
	converted := parser convertTo: (PP2Node new).
	self assert: (converted isKindOf: PP2Node).
	self assert: (parser name = 'foobar')