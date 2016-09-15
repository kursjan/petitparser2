as yet unclassified
testDebugResult
	| parser result |
	parser := 'bar' asParser2 plus.
	
	result := parser parse: 'foofoo'.
	self assert: result isPetit2Failure.
	self assert: result debugResult isNil not.
	self assert: result debugResult children size equals: 1.