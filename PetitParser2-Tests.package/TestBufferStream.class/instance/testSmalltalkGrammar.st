tests - smalltalk
testSmalltalkGrammar
	| tokens |
	parser := PPSmalltalkGrammar new asPetit2Parser.
	stream := PP2BufferStream on: (MinimalStream	on: 'foo ^ 1').
		
	result := parser parse: stream.
	self assert: result isPetit2Success.
	
	tokens := (result retval deepFlatten select: [ :e | e isKindOf: PPToken ]).
	self assert: tokens size equals: 3.
	self assert: tokens first inputValue = 'foo'.
	self assert: tokens third inputValue = '1'.