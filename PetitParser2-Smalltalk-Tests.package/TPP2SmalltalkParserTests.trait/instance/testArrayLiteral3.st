testing-literals
testArrayLiteral3
	super testArrayLiteral3.
	self assert: self result isLiteralNode.
	self assert: self result value equals: #(1 2)