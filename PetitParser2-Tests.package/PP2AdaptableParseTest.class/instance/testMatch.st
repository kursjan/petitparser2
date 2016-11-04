test - context
testMatch
	| node |
	node := $a asPParser match.
	
	self context defaultStack push: $a.
	self assert: node parse: 'a'.