test
testFailing
	| parser |
	parser := PP2FailingNode message: 'Plonk'.

	self assert: parser fail: ''.
	self assert: parser fail: 'a'.
	self assert: parser fail: 'aa'.