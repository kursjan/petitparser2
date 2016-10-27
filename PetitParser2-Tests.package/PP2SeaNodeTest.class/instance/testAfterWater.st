tests
testAfterWater
	sea := PP2SeaNode new
		island: $a asPParser;
		yourself.

	self assert: sea afterWater isKindOf: PP2WaterNode.
