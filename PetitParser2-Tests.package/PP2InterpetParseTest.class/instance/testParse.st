tests - parsing
testParse
	self assert: ((PP2Interpret on: $a asParser2) parse: 'a') isPetit2Success.