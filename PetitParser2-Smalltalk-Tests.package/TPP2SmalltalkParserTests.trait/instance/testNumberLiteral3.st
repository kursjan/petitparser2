testing-literals
testNumberLiteral3
	super testNumberLiteral3.
	self assert: self result isLiteralNode.
	self assert: self result value equals: 123.
	self assert: self result value isInteger