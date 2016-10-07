tests
testAfterWater
	sea := PP2SeaNode new
		island: $a asPParser;
		yourself.
	context := PP2Context new.
	context parser: sea plus.

	self assert: (sea afterWater: context) isAdaptable.
	self assert: ((sea afterWater: context) child isKindOf: PP2WaterNode).