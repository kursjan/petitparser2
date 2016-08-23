as yet unclassified
testRepetitions
	| parser result |
	parser := ('foo' asParser, ':=' asParser) plus asPetit2Parser.
	
	result := (self assert: parser parse: 'foo:=').
	
	self assert: result value size equals: 1.
	self assert: result value first equals: #('foo' ':=').
	
	self assert: parser fail: 'foo' end: 3.