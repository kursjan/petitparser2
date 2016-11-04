test - context
testPopStarOne
	| node |
	node := $a asPParser pop star.
	
	self context defaultStack push: $a.
	self assert: node parse: 'a'.
	self assert: context defaultStack size equals: 0.