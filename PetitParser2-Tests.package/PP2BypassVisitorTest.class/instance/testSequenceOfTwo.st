as yet unclassified
testSequenceOfTwo

	parser := $a asPParser wrapped, $b asPParser wrapped.
	parser strategy: (PP2SequenceOfTwo on: parser).
	
	self visit: parser.
	
	self assert: parser strategy firstChild isKindOf: PP2LiteralObjectNode.
	self assert: parser strategy secondChild isKindOf: PP2LiteralObjectNode.	