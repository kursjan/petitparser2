test - water
testWaterBoundary
	| water |
	water := PP2WaterNode new
		boundaryElements: 'foo' asPParser;
		yourself.
	
	self assert: water parse: 'foobar' to: '' end: 0.
	self assert: water parse: 'barfoo' to: 'bar' end: 3.
	
	self assert: water fail: ''.
	self assert: water fail: 'barbar'.	