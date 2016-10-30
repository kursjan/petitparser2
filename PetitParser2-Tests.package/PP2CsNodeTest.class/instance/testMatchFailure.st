as yet unclassified
testMatchFailure
	node := $a asPParser match.
	
	self context defaultStack push: $b.
	self assert: node fail: 'b'.