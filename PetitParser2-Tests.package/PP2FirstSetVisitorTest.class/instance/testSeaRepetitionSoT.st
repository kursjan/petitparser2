tests - seas or terminals
testSeaRepetitionSoT
	| sea |
	sea := $a asPParser sea.
	parser := sea plus.
	
	firstSet := self firstSetWithSeasOrTerminals: parser.
	
	self assert: firstSet size equals: 1.
	self assert: firstSet includes: sea.
