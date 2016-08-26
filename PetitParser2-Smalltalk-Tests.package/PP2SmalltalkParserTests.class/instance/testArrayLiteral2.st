testing-literals
testArrayLiteral2
	super testArrayLiteral2.
	self assert: result isLiteralNode.
	self assert: result value equals: #(1)