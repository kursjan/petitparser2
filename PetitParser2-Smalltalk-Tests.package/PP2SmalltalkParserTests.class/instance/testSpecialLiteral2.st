testing-literals
testSpecialLiteral2
	super testSpecialLiteral2.
	self assert: result isLiteralNode.
	self assert: result value equals: false