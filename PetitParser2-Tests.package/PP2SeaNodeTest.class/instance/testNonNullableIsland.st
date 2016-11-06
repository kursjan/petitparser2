tests
testNonNullableIsland
	| waterToken island beforeWater boundary elements |
	waterToken := #space asPParser.
	island := $a asPParser optional.
	sea := PP2SeaNode new
		island: island;
		waterToken: waterToken;
		yourself.
	boundary := $b asPParser.
		
	parser := sea, boundary.
	
	sea updateBeforeWater: parser.
	beforeWater := sea beforeWater.
			
	elements := beforeWater boundaryElements.
	self assert: elements size equals: 2.	
	self assert: elements noneSatisfy: [ :e | e isNullable  ].