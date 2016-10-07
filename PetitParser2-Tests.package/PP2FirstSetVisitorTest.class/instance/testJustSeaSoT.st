tests - seas or terminals
testJustSeaSoT
	parser := $a asPParser sea.
	
	firstSet := self firstSetWithSeasOrTerminals: parser.
	
	self assert: firstSet size equals: 1.
	self assert: firstSet includes: parser.
