tests
testCreateAfterWater
	| waterToken island beforeWater boundary elements nextBoundary |
	waterToken := #space asPParser.
	island := $a asPParser.
	sea := PP2SeaNode new
		island: island;
		waterToken: waterToken;
		yourself.
	boundary := $b asPParser optional.
	nextBoundary := $c asPParser.
		
	parser := sea, boundary, nextBoundary.
	
	context := PP2Context new.
	context parser: parser.

	beforeWater := sea createAfterWater: context.
	
	self assert: beforeWater isKindOf: PP2WaterNode.
	self assert: beforeWater waterToken equals: waterToken.
	self assert: beforeWater boundary isKindOf: PP2AndNode.
	self assert: beforeWater boundary child isKindOf: PP2ChoiceNode.	
		
	elements := beforeWater boundary child children.
	self assert: elements isKindOf: OrderedCollection.
	self assert: elements size equals: 2.	
	self assert: elements noneSatisfy: [ :n | n isNullable ].
	self assert: elements includes: nextBoundary.	