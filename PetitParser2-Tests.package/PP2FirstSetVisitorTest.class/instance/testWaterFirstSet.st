tests
testWaterFirstSet
	| boundary waterToken |
	boundary := $b asPParser.
	waterToken := $a asPParser.
	parser := PP2WaterNode new boundary: boundary; waterToken: waterToken.
	
	firstSet := self firstSet: parser.
	
	self assert: firstSet size equals: 2.
	self assert: firstSet includes: boundary.
	self assert: firstSet includes: waterToken.
