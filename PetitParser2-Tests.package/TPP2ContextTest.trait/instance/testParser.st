tests
testParser
	| context parser |
	parser := $a asPParser.
	
	context := (self contextOn: 'bar')
		parser: parser;
		yourself.
	
	self assert: context parser equals: parser.