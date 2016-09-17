as yet unclassified
testParseOn
	| parser context guard |
	parser := #letter asPParser.
	guard := self guardOn: parser.
	context := 'a' asPetit2Stream asPetit2Context.
		
	self assert: (guard parseOn: context) isPetit2Success