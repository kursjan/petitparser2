tests - seas or terminals
testPossibleSeaSoT
	| sea before |
	sea := $a asPParser sea.
	before := $b asPParser.
	parser := before optional, sea.
	
	firstSet := self firstSetWithSeasOrTerminals: parser.
	
	self assert: firstSet size equals: 2.
	self assert: firstSet includes: sea.
	self assert: firstSet includes: before.