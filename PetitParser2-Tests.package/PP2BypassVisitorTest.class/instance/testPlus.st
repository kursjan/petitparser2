as yet unclassified
testPlus

	parser := $a asPParser wrapped plus.
	parser strategy: (PP2Plus on: parser).
	
	self visit: parser.
	
	self assert: parser strategy child isKindOf: PP2LiteralObjectNode.