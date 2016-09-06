testing-literals
testSpecialLiteral2
	super testSpecialLiteral2.
	self assert: self result isLiteralNode.
	self assert: self result value equals: false