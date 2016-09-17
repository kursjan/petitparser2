as yet unclassified
testSimpleTrimmingToken
	parser := $a asPParser token trim.
	
	visitor doPass: parser.
	self assert: parser trimmer strategy isKindOf: PP2TrimmingCache