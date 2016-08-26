testing-literals
testNumberLiteral8
	super testNumberLiteral8.
	self assert: result isLiteralNode.
	self assert: result value equals: -123.
	self assert: result value isInteger