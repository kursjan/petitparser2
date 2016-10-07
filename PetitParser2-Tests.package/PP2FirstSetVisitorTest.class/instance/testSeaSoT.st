tests - seas or terminals
testSeaSoT
	| sea |
	sea := $a asPParser sea.
	parser := sea wrapped.
	
	firstSet := self firstSetWithSeasOrTerminals: parser.
	
	self assert: firstSet size equals: 1.
	self assert: firstSet includes: sea.
