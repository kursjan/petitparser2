testing-literals
testNumberLiteral1
	super testNumberLiteral1.
	self assert: self result isLiteralNode.
	self assert: self result value equals: 0.
	self assert: self result value isInteger