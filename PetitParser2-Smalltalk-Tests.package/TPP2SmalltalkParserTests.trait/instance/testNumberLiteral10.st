testing-literals
testNumberLiteral10
	super testNumberLiteral10.
	self assert: self result isLiteralNode.
	self assert: self result value equals: 10.
	self assert: self result value isInteger