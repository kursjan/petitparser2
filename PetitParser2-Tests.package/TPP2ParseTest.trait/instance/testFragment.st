test
testFragment
	| fragment parser result |
	fragment := $a asPParser plus fragment.
	parser := fragment wrapped.
	
	result := (self assert: parser parse: 'aa') returnValue.

	self assert: result isPetit2Context.
	self assert: result start equals: 0.
	self assert: result stop equals: 2.
	self assert: result parsedValue size equals: 2.
	self assert: result parsedValue first equals: $a.	
	self assert: result parsedValue second equals: $a.
	self assert: result parser == fragment.	
	
	self assert: parser fail: 'b'.
	self assert: parser fail: ''.