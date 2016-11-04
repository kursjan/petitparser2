test - context
testPopStarTwo
	| node |
	node := $a asPParser pop star.
	
	self context defaultStack push: $a.
	self context defaultStack push: $a.
	self assert: node parse: 'aa'.
	self assert: context defaultStack size equals: 0.