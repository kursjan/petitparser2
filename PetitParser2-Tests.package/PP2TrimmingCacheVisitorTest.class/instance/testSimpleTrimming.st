as yet unclassified
testSimpleTrimming
	parser := $a asParser2 trim.
	
	visitor doPass: parser.
	self assert: parser trimmer strategy isKindOf: PP2TrimmingCache