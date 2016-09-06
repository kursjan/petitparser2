testing-literals
testNumberLiteral8
	super testNumberLiteral8.
	self assert: self result isLiteralNode.
	self assert: self result value equals: -123.
	self assert: self result value isInteger