testing-literals
testArrayLiteral3
	super testArrayLiteral3.
	self assert: result isLiteralNode.
	self assert: result value equals: #(1 2)