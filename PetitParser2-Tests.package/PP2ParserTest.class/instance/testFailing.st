test - parsing (deprecated)
testFailing
	| parser result |
	parser := PP2FailingParser message: 'Plonk'.
	self assert: parser message equals: 'Plonk'.
	self assert: parser fail: ''.
	self assert: parser fail: 'a'.
	self assert: parser fail: 'aa'.
	result := parser parse: 'a'.
	self assert: result message equals: 'Plonk'.
	self assert: result fullMessage equals: 'Plonk at 0'