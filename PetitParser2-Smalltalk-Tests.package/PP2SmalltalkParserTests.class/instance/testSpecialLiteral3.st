testing-literals
testSpecialLiteral3
	super testSpecialLiteral3.
	self assert: result isLiteralNode.
	self assert: result value equals: nil