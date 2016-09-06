testing-literals
testCharLiteral2
	super testCharLiteral2.
	self assert: self result isLiteralNode.
	self assert: self result value equals: Character space