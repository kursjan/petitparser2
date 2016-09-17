as yet unclassified
testSequence
	parser := $a asPParser trim, $b asPParser trim.
	
	visitor doPass: parser.
	self assert: parser firstChild trimmer strategy isKindOf: PP2TrimmingCache.
	self assert: parser secondChild trimmer strategy isKindOf: PP2TrimmingCache	