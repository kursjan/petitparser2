tests
testGuardedChoice2
	| parserOne parserTwo parserThree choiceOne |
	parserOne := 'baz' asParser2 token trim wrapped.
	parserTwo := 'bar' asParser2 token trim wrapped.
	parserThree := 'foo' asParser2 token trim wrapped.
	
	choiceOne := (parserOne / parserTwo) wrapped.
	parser := choiceOne / parserThree.

	self optimize: parser.
	
	self assert: choiceOne strategy isKindOf: PP2ParsingGuard.
	self assert: choiceOne strategy classification isNotNil.
	
	self assert: parserThree strategy isKindOf: PP2ParsingGuard.
	self assert: parserThree strategy classification isNotNil.
	
	"already guarded by a parent!"
	self deny: parserOne strategy isKindOf: PP2ParsingGuard.
	self deny: parserTwo strategy isKindOf: PP2ParsingGuard.
