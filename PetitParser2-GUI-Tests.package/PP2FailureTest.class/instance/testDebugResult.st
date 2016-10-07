test
testDebugResult
	| parser result |
	parser := 'bar' asPParser plus.
	
	result := parser parseContext: 'foofoo'.
	self assert: result isPetit2Failure.
	
	self assert: result debugResult isNil not.
	self assert: result debugResult children size equals: 1.