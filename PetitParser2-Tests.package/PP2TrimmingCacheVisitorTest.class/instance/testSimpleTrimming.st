as yet unclassified
testSimpleTrimming
	parser := $a asPParser trim.
	
	visitor doPass: parser.
	self assert: parser trimmer strategy isKindOf: PP2TrimmingCache