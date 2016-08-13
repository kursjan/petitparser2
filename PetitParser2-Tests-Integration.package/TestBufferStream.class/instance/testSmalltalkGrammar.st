tests - smalltalk
testSmalltalkGrammar
	parser := PPSmalltalkGrammar new asPetit2Parser.
	stream := PP2BufferStream on: (MinimalStream	on: 'foo ^ 1').
		
	result := parser parse: stream.
	self assert: result isPetit2Success.