testing-literals
testNumberLiteral12
	super testNumberLiteral12.
	self assert: self result isLiteralNode.
	self assert: self result value equals: 175.
	self assert: self result value isInteger