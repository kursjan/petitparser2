testing-literals
testNumberLiteral9
	super testNumberLiteral9.
	self assert: self result isLiteralNode.
	self assert: self result value equals: -123.456.
	self assert: self result value isFloat