accessing
testFlatten
	| flatten |
	parser := $a asPParser.
	flatten := parser flatten.
	
	self nextSet: parser in: flatten.

	self assert: nextSet size equals: 1.
	self assert: nextSet includes: eoi.
	
	self nextSet: flatten in: flatten.
	self assert: nextSet size equals: 1.
	self assert: nextSet includes: eoi.