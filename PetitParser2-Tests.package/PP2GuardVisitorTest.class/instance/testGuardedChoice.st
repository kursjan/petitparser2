tests
testGuardedChoice
	| parserOne parserTwo parserThree choiceOne |
	parserOne := 'foo' asParser2 token trim wrapped.
	parserTwo := 'bar' asParser2 token trim wrapped.
	parserThree := 'baz' asParser2 token trim wrapped.
	
	choiceOne := (parserOne / parserTwo) wrapped.
	
	self optimize: choiceOne / parserThree.
	
	self assert: choiceOne strategy isKindOf: PP2ParsingGuard.
	self assert: choiceOne strategy classification isNotNil.
	
	self assert: parserThree strategy isKindOf: PP2ParsingGuard.
	self assert: parserThree strategy classification isNotNil.
	
	self assert: parserOne strategy isKindOf: PP2ParsingGuard.
	self assert: parserTwo strategy isKindOf: PP2ParsingGuard.
