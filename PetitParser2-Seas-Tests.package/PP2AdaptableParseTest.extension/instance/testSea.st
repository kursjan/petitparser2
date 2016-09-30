*PetitParser2-Seas-Tests
testSea
	| boundary island sea |
	island := 'foo' asPParser.
	boundary := 'bar' asPParser.
	
	sea := PP2SeaNode new
		island: island;
		setBeforeWater: (PP2WaterNode boundary: island / boundary);
		setAfterWater: (PP2WaterNode boundary: boundary).
	
	self assert: sea parse: '..foo...bar' to: #('..' 'foo' '...') end: 8.
	self assert: sea fail: '..'.
	self assert: sea fail: '..bar'.
	self assert: sea fail: '..foo...baz'.	