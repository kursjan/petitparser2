tests
testUpdateBeforeWater
	| waterToken island beforeWater boundary elements |
	waterToken := #space asPParser.
	island := $a asPParser.
	sea := PP2SeaNode new
		island: island;
		waterToken: waterToken;
		yourself.
	boundary := $b asPParser.
		
	parser := sea, boundary.
	
	sea updateBeforeWater: parser.
	beforeWater := sea beforeWater.
	
	self assert: beforeWater isKindOf: PP2WaterNode.
	self assert: beforeWater waterToken equals: waterToken.
	self assert: beforeWater boundary isKindOf: PP2AndNode.
	self assert: beforeWater boundary child isKindOf: PP2ChoiceNode.	
		
	elements := beforeWater boundary child children.
	self assert: elements isKindOf: OrderedCollection.
	self assert: elements size equals: 2.	
	self assert: elements includes: island.
	self assert: elements includes: boundary.