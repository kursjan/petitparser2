test - context
testMatchEmpty
	| node |
	node := $a asPParser match.
	
	self assert: node fail: 'a'.