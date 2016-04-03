tests
testFailing
	| parser |
	parser := PP2FailingParser message: 'Plonk'.

	self assert: parser fail: ''.
	self assert: parser fail: 'a'.
	self assert: parser fail: 'aa'.