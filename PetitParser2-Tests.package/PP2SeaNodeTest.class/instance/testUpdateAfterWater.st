tests
testUpdateAfterWater
	| waterToken island afterWater boundary elements nextBoundary |
	waterToken := #space asPParser.
	island := $a asPParser.
	sea := PP2SeaNode new
		island: island;
		waterToken: waterToken;
		yourself.
	boundary := $b asPParser optional.
	nextBoundary := $c asPParser.
		
	parser := sea, boundary, nextBoundary.
	
	sea updateAfterWater: parser.
	afterWater := sea afterWater.
	
	self assert: afterWater isKindOf: PP2WaterNode.
	self assert: afterWater waterToken equals: waterToken.
	self assert: afterWater boundary isKindOf: PP2ChoiceNode.
	self assert: afterWater boundary children allSatisfy: [ :child | child isKindOf: PP2AndNode].	
		
	elements := afterWater boundaryElements.
	self assert: elements size equals: 2.	
	self assert: elements noneSatisfy: [ :n | n isNullable ].
	self assert: elements includes: nextBoundary.	