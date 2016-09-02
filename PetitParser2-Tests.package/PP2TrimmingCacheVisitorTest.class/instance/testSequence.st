as yet unclassified
testSequence
	parser := $a asParser2 trim, $b asParser2 trim.
	
	visitor doPass: parser.
	self assert: parser firstChild trimmer strategy isKindOf: PP2TrimmingCache.
	self assert: parser secondChild trimmer strategy isKindOf: PP2TrimmingCache	