testing-literals
testArrayLiteral2
	super testArrayLiteral2.
	self assert: self result isLiteralNode.
	self assert: self result value equals: #(1)