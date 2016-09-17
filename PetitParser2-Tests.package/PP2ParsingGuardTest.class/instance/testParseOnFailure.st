as yet unclassified
testParseOnFailure
	| parser context guard |
	parser := #letter asPParser.
	guard := self guardOn: parser.
	context := '1' asPetit2Stream asPetit2Context.
	
	self assert: (guard parseOn: context) isPetit2Failure