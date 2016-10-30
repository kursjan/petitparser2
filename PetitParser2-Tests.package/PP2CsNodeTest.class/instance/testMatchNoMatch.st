as yet unclassified
testMatchNoMatch
	node := $a asPParser match.
	
	self context defaultStack push: $b.
	self assert: node fail: 'a'.