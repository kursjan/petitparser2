tests
testSequenceOfTwo
	parser := $a asParser2, $b asParser2.
	
	visitor visit: parser.
	
	self assert: parser strategy isKindOf: PP2SequenceOfTwo.