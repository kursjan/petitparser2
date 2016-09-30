tests
testChildren
	| waterToken island |
	waterToken := #space asPParser.
	island := $a asPParser optional.
	sea := PP2SeaNode new
		island: island;
		waterToken: waterToken;
		yourself.

	self assert: sea children size equals: 3.
	self assert: sea children first isKindOf: PP2Node.
	self assert: sea children second == island.
	self assert: sea children third isKindOf: PP2Node.