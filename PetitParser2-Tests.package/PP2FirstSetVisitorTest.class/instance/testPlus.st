tests
testPlus
	| plus |
	parser := $a asParser2.
	plus := parser plus.
	firstSet := self firstSet: plus.

	self assert: firstSet size equals: 1.
	self assert: firstSet includes: parser.