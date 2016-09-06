testing-literals
testNumberLiteral7
	super testNumberLiteral7.
	self assert: self result isLiteralNode.
	self assert: self result value equals: -123.
	self assert: self result value isInteger