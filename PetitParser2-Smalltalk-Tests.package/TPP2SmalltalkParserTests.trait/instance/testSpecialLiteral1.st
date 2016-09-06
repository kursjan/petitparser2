testing-literals
testSpecialLiteral1
	super testSpecialLiteral1.
	self assert: self result isLiteralNode.
	self assert: self result value equals: true