as yet unclassified
testSequenceOfTwoRecognizer

	parser := $a asPParser wrapped, $b asPParser wrapped.
	parser strategy: (PP2SequenceOfTwoRecognizer on: parser).
	
	self visit: parser.
	
	self assert: parser strategy firstChild isKindOf: PP2LiteralObjectNode.
	self assert: parser strategy secondChild isKindOf: PP2LiteralObjectNode.	