tests
testPlus
	parser := $a asParser2 plus.
	
	visitor visit: parser.
	
	self assert: parser strategy isKindOf: PP2PossesiveRepeating.