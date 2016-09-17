test
testRepetitions
	| parser result |
	parser := ('foo' asPParser, ':=' asPParser) plus.
	
	result := (self assert: parser parse: 'foo:=').
	
	self assert: result value size equals: 1.
	self assert: result value first equals: #('foo' ':=').
	
	self assert: parser fail: 'foo' end: 3.