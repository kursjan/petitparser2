testing-literals
testNumberLiteral5
	super testNumberLiteral5.
	self assert: result isLiteralNode.
	self assert: result value equals: 0.
	self assert: result value isInteger