test - context
testPopStarZero
	| node |
	node := $a asPParser pop star.
	
	self context defaultStack push: $a.
	self assert: node parse: ''.
	self assert: context defaultStack size equals: 1.