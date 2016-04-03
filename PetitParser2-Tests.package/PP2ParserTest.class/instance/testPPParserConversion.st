test - conversion
testPPParserConversion
	| converted parser |
	parser := PPParser new
		propertyAt: #foo ifAbsentPut: #bar;
		name: 'foobar'
		yourself.
		
	converted := parser convertTo: (PP2Parser new).
	self assert: (converted isKindOf: PP2Parser).
	self assert: (parser name = 'foobar')