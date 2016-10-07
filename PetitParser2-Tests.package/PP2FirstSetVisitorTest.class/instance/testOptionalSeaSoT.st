tests - seas or terminals
testOptionalSeaSoT
	| sea |
	sea := $a asPParser sea.
	parser := sea optional wrapped.
	
	firstSet := self firstSetWithSeasOrTerminals: parser.
	
	self assert: firstSet size equals: 2.
	self assert: firstSet includes: sea