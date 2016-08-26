tests - parsing
testParseWithContext
	self assert: ((PP2ImmutableInterpret on: $a asParser2) parse: 'a' withContext: PP2ImmutableSuccess new) isPetit2Success.