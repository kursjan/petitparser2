as yet unclassified
testSmalltalkGrammar
	| parser result |
	parser := PPSmalltalkGrammar new asPetit2Parser.
	
	result := (self assert: parser parse: 'foo ^ 1') value.