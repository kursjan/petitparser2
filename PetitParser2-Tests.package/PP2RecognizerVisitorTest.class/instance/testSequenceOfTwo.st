tests
testSequenceOfTwo
	parser := $a asParser2, $b asParser2.
	parser strategy: (PP2SequenceOfTwo on: parser).
	token := parser token.
	
	self visit: token.
	
	self assert: parser strategy isKindOf: PP2SequenceOfTwoRecognizer 