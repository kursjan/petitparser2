tests
testTrimming
	| trimming |
	parser := 'foo' asPParser.
	trimming := parser trim.
	firstSet := self firstSet: trimming.

	self assert: firstSet size equals: 2.
	self assert: firstSet includes: parser.
	self assert: firstSet includes: trimming trimmer child.	