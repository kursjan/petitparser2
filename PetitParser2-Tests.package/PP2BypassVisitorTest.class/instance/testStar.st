as yet unclassified
testStar

	parser := $a asParser2 wrapped star.
	parser strategy: (PP2Star on: parser).
	
	self visit: parser.
	
	self assert: parser strategy child isKindOf: PP2LiteralObjectNode.