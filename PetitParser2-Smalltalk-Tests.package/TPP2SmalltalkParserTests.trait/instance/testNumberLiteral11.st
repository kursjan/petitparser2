testing-literals
testNumberLiteral11
	super testNumberLiteral11.
	self assert: self result isLiteralNode.
	self assert: self result value equals: 511.
	self assert: self result value isInteger