tests
testChoice
	| parserOne parserTwo |
	parserOne := 'foo' asParser2 token trim wrapped.
	parserTwo := 'bar' asParser2 token trim wrapped.
	
	self optimize: parserOne / parserTwo.
	
	self assert: parserOne strategy isKindOf: PP2ChoiceAlternativeGuard.
	self assert: parserOne strategy classification isNotNil.
	
	self assert: parserTwo strategy isKindOf: PP2ChoiceAlternativeGuard.
	self assert: parserTwo strategy classification isNotNil.