as yet unclassified
testSimpleTrimmingToken
	parser := $a asParser2 token trim.
	
	visitor doPass: parser.
	self assert: parser trimmer strategy isKindOf: PP2TrimmingCache