testing-literals
testArrayLiteral9
	super testArrayLiteral9.
	self assert: self result isLiteralNode.
	self assert: self result value equals: #(#(1) 2)