testing-literals
testCharLiteral1
	super testCharLiteral1.
	self assert: result isLiteralNode.
	self assert: result value equals: $a