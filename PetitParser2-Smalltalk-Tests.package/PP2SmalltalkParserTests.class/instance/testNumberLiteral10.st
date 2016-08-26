testing-literals
testNumberLiteral10
	super testNumberLiteral10.
	self assert: result isLiteralNode.
	self assert: result value equals: 10.
	self assert: result value isInteger