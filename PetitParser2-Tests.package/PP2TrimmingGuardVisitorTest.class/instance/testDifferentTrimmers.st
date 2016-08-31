as yet unclassified
testDifferentTrimmers
	parser := $a asParser2 trimSpaces, $b asParser2 trimBlanks.
	
	visitor doPass: parser.
	self assert: parser firstChild trimmer strategy isKindOf: PP2PredicateObject.
	self assert: parser secondChild trimmer strategy isKindOf: PP2PredicateObject	