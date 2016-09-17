tests
testPlus
	| plus |
	parser := $a asPParser.
	plus := parser plus.
	firstSet := self firstSet: plus.

	self assert: firstSet size equals: 1.
	self assert: firstSet includes: parser.