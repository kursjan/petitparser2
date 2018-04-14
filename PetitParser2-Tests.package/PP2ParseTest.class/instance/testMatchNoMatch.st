test - context
testMatchNoMatch
	| node |
	node := $a asPParser match.
	
	self context defaultStack push: $b.
	self assert: node fail: 'a'.