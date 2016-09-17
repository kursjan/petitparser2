as yet unclassified
testDifferentTrimmers
	parser := $a asPParser trimSpaces, $b asPParser trimBlanks.
	
	visitor doPass: parser.
	self assert: parser firstChild trimmer strategy isKindOf: PP2PossesiveRepeating.
	self assert: parser secondChild trimmer strategy isKindOf: PP2PossesiveRepeating	