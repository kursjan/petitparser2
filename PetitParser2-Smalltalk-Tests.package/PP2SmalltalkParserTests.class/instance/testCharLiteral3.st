testing-literals
testCharLiteral3
	super testCharLiteral3.
	self assert: result isLiteralNode.
	self assert: result value equals: $$