tests
testSmalltalkGrammar
	| parser |
	parser := PPSmalltalkGrammar new asPetit2Parser.
	
	self assert: parser parse: 'foo ^ 1'.
	