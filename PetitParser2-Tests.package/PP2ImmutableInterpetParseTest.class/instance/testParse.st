tests - parsing
testParse
	self assert: ((PP2ImmutableInterpret on: $a asParser2) parse: 'a') isPetit2Success.