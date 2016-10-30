as yet unclassified
testPushStarZero
	node := $a asPParser push star.
	
	self assert: node parse: ''.
	self assert: context defaultStack size equals: 0.