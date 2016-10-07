tests
testBeforeWater
	sea := PP2SeaNode new
		island: $a asPParser;
		yourself.
	context := PP2Context new.
	context parser: sea plus.

	self assert: (sea beforeWater: context) isAdaptable.
	self assert: ((sea beforeWater: context) child isKindOf: PP2WaterNode).