testing-literals
testSpecialLiteral1
	super testSpecialLiteral1.
	self assert: result isLiteralNode.
	self assert: result value equals: true