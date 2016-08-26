testing-literals
testArrayLiteral6
	super testArrayLiteral6.
	self assert: result isLiteralNode.
	self assert: result value equals: #(1.2)