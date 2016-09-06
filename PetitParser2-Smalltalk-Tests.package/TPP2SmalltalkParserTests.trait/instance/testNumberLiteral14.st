testing-literals
testNumberLiteral14
	super testNumberLiteral14.
	self assert: self result isLiteralNode.
	self assert: self result value floor equals: -9.
	self assert: self result value isFloat