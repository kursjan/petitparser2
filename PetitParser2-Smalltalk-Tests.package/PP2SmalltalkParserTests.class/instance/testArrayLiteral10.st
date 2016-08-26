testing-literals
testArrayLiteral10
	super testArrayLiteral10.
	self assert: result isLiteralNode.
	self assert: result value equals: #(#(1 2) #(1 2 3))