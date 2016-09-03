tests
testSmalltalkIdentierWithBufferStream
	| parser stream result |
	parser := PPSmalltalkGrammar new identifierToken asPetit2Parser.
	stream := PP2BufferStream on: (PP2MinimalStream	on: 'foo').
		
	result := parser parse: stream.
	self assert: result isPetit2Success.
	self assert: result value inputValue = 'foo'.