tests - parsing
testParseWithContext
	self assert: ((PP2Interpret on: $a asParser2) parse: 'a' withContext: PP2Success new) isPetit2Success.