as yet unclassified
testPushStarOne
	node := $a asPParser push star.
	
	self assert: node parse: 'a'.
	self assert: context defaultStack size equals: 1.