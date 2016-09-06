testing-literals
testNumberLiteral15
	super testNumberLiteral15.
	self assert: self result isLiteralNode.
	self assert: self result value equals: 1 / 2