accessing
testTrim
	| trim |
	parser := $a asPParser.
	trim := parser trim.
	
	self nextSet: parser in: trim.

	self assert: nextSet size equals: 1.
	self assert: nextSet includes: eoi.
	
	self nextSet: trim in: trim.
	self assert: nextSet size equals: 1.
	self assert: nextSet includes: eoi.