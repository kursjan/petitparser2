test
testFragment
	| parser result |
	parser := $a asPParser plus fragment.

	result := (self assert: parser parse: 'aa') returnValue.

	self assert: (result isKindOf: PP2Fragment).
	self assert: result start equals: 0.
	self assert: result stop equals: 2.
	self assert: result parsedValue size equals: 2.
	self assert: result parsedValue first equals: $a.	
	self assert: result parsedValue second equals: $a.	
	
	self assert: parser fail: 'b'.
	self assert: parser fail: ''.