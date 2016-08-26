testing-literals
testArrayLiteral9
	super testArrayLiteral9.
	self assert: result isLiteralNode.
	self assert: result value equals: #(#(1) 2)