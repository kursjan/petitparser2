testing-literals
testNumberLiteral5
	super testNumberLiteral5.
	self assert: self result isLiteralNode.
	self assert: self result value equals: 0.
	self assert: self result value isInteger