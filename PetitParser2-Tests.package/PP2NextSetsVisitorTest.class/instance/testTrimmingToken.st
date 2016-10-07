accessing
testTrimmingToken
	| token |
	parser := $a asPParser.
	token := parser token trim.
	
	self nextSet: parser in: token.

	self assert: nextSet size equals: 1.
	self assert: nextSet includes: eoi.
	
	self nextSet: token in: token.
	self assert: nextSet size equals: 1.
	self assert: nextSet includes: eoi.