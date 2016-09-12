tests
testSmalltalkGrammar
	| parser result tokens |
	parser := PPSmalltalkGrammar new.
				
	result := parser parse: 'foo ^ 1'.
	self assert: result isPetit2Success.
	
	tokens := (result retval deepFlatten select: [ :e | e isToken ]).
	self assert: tokens size equals: 3.
	self assert: tokens first inputValue = 'foo'.
	self assert: tokens third inputValue = '1'.