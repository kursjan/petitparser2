tests - smalltalk
testSmalltalkGrammarIdentifier
	parser := PPSmalltalkGrammar new identifier asPetit2Parser.
	stream := PP2BufferStream on: (MinimalStream	on: 'foo').
		
	result := parser parse: stream.
	self assert: result isPetit2Success.
	self assert: result value first = $f.