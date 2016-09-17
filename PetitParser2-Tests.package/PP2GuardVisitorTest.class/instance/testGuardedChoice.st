tests
testGuardedChoice
	| parserOne parserTwo parserThree choiceOne |
	parserOne := 'foo' asPParser token trim wrapped.
	parserTwo := 'bar' asPParser token trim wrapped.
	parserThree := 'baz' asPParser token trim wrapped.
	
	choiceOne := (parserOne / parserTwo) wrapped.
	
	self optimize: choiceOne / parserThree.
	
	self assert: choiceOne strategy isKindOf: PP2ParsingGuard.
	self assert: choiceOne strategy classification isNotNil.
	
	self assert: parserThree strategy isKindOf: PP2ParsingGuard.
	self assert: parserThree strategy classification isNotNil.
	
	self assert: parserOne strategy isKindOf: PP2ParsingGuard.
	self assert: parserTwo strategy isKindOf: PP2ParsingGuard.
