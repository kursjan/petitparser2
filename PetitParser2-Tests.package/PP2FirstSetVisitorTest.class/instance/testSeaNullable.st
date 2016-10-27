tests
testSeaNullable
	| sea |
	parser := $a asPParser.
	sea := parser optional sea.
	firstSet := self firstSetWithoutDuplicates: sea.

	self assert: firstSet size equals: 3.
	self assert: firstSet includes: parser.
	self assert: firstSet includes: #any asPParser.
	self assert: firstSet includes: #eoi asPParser.	