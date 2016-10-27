tests
testBeforeWater
	sea := PP2SeaNode new
		island: $a asPParser;
		yourself.

	self assert: sea beforeWater isKindOf: PP2WaterNode.