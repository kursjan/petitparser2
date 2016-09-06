testing-literals
testNumberLiteral2
	super testNumberLiteral2.
	self assert: self result isLiteralNode.
	self assert: self result value equals: 0.1.
	self assert: self result value isFloat