as yet unclassified
testDifferentTrimmers
	parser := $a asParser2 trimSpaces, $b asParser2 trimBlanks.
	
	visitor doPass: parser.
	self assert: parser firstChild trimmer strategy isKindOf: PP2PossesiveRepeating.
	self assert: parser secondChild trimmer strategy isKindOf: PP2PossesiveRepeating	