testing-literals
testCharLiteral3
	super testCharLiteral3.
	self assert: self result isLiteralNode.
	self assert: self result value equals: $$