as yet unclassified
testMatchEmpty
	node := $a asPParser match.
	
	self assert: node fail: 'a'.