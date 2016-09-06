testing-literals
testArrayLiteral10
	super testArrayLiteral10.
	self assert: self result isLiteralNode.
	self assert: self result value equals: #(#(1 2) #(1 2 3))