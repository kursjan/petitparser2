testing-literals
testCharLiteral2
	super testCharLiteral2.
	self assert: result isLiteralNode.
	self assert: result value equals: Character space