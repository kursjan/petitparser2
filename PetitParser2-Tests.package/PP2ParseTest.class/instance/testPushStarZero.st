test - context
testPushStarZero
	| node |
	node := $a asPParser push star.
	
	self assert: node parse: ''.
	self assert: self context defaultStack size equals: 0.