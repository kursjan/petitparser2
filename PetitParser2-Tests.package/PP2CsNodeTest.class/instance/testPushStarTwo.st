as yet unclassified
testPushStarTwo
	node := $a asPParser push star.
	
	self assert: node parse: 'aa'.
	self assert: context defaultStack size equals: 2.
