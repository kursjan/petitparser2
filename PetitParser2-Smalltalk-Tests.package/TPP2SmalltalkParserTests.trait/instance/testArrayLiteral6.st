testing-literals
testArrayLiteral6
	super testArrayLiteral6.
	self assert: self result isLiteralNode.
	self assert: self result value equals: #(1.2)