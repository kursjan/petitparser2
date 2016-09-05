as yet unclassified
testSequenceOfTwoRecognizer

	parser := $a asParser2 wrapped, $b asParser2 wrapped.
	parser strategy: (PP2SequenceOfTwoRecognizer on: parser).
	
	self visit: parser.
	
	self assert: parser strategy firstChild isKindOf: PP2LiteralObjectNode.
	self assert: parser strategy secondChild isKindOf: PP2LiteralObjectNode.	