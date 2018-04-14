test - context
testPushStarOne
	| node |
	node := $a asPParser push star.
	
	self assert: node parse: 'a'.
	self assert: context defaultStack size equals: 1.