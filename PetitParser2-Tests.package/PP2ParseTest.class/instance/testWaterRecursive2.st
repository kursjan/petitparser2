test - water
testWaterRecursive2
	| water eof |
	water := PP2WaterNode new
		yourself.
	eof := PP2EndOfInputNode new.

	water boundary: (water, eof) / eof.
	self assert: water parse: 'foobar' to: 'foobar'