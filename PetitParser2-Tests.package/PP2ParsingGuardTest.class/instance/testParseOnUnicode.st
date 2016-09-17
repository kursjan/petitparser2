as yet unclassified
testParseOnUnicode
	| parser context guard |
	parser := #letter asPParser.
	guard := self guardOn: parser.
	context := 'α' asPetit2Stream asPetit2Context.
	
	self assert: (guard parseOn: context) isPetit2Success.