tests
testTrimmingWithEpsilon
	| trimming |
	parser := 'foo' asPParser.
	trimming := parser optional trim.
	firstSet := self firstSet: trimming.

	self assert: firstSet size equals: 3.
	self assert: firstSet includes: parser.
	self assert: firstSet includes: trimming trimmer child.	
	self assert: firstSet includes: PP2EpsilonNode instance.		