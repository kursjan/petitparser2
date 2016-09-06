testing-literals
testSpecialLiteral3
	super testSpecialLiteral3.
	self assert: self result isLiteralNode.
	self assert: self result value equals: nil