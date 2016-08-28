test - conversion
testPPDelegateParserConversion
	| converted child parser |
	child := PPParser new.
	parser := (child wrapped)
		propertyAt: #foo ifAbsentPut: #bar;
		name: 'foobar'
		yourself.
		
	converted := parser asPetit2Node.
	self assert: (converted isKindOf: PP2DelegateNode).
	self assert: (parser name = 'foobar').
	self assert: (converted child == child).
