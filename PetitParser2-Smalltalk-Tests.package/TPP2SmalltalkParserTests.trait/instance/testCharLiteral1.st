testing-literals
testCharLiteral1
	super testCharLiteral1.
	self assert: self result isLiteralNode.
	self assert: self result value equals: $a