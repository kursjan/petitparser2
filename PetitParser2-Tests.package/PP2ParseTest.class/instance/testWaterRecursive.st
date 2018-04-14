test - water
testWaterRecursive
	| water |
	water := PP2WaterNode new
		yourself.

	water boundary: water.
	self assert: water parse: 'foobar' to: '' end: 0