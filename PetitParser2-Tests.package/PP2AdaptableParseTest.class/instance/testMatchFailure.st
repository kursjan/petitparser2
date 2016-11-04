test - context
testMatchFailure
	| node |
	node := $a asPParser match.
	
	self context defaultStack push: $b.
	self assert: node fail: 'b'.