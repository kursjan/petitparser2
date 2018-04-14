test - context
testPushStarTwo
	| node |
	node := $a asPParser push star.
	
	self assert: node parse: 'aa'.
	self assert: self context defaultStack size equals: 2.
