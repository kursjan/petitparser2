tests
testChoice
	| parserOne parserTwo |
	parserOne := 'foo' asPParser token trim wrapped.
	parserTwo := 'bar' asPParser token trim wrapped.
	
	self optimize: parserOne / parserTwo.
	
	self assert: parserOne strategy isKindOf: PP2ParsingGuard.
	self assert: parserOne strategy classification isNotNil.
	
	self assert: parserTwo strategy isKindOf: PP2ParsingGuard.
	self assert: parserTwo strategy classification isNotNil.