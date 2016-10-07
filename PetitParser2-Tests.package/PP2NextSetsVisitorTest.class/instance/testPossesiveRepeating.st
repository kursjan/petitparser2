accessing
testPossesiveRepeating
	| plus |
	parser := $a asPParser.
	plus := parser plus.
	
	self nextSet: parser in: plus.

	self assert: nextSet size equals: 2.
	self assert: nextSet includes: eoi.
	
	self nextSet: plus in: plus.
	self assert: nextSet size equals: 1.
	self assert: nextSet includes: eoi.