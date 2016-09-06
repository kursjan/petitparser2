testing-literals
testStringLiteral2
	super testStringLiteral2.
	self assert: self result isLiteralNode.
	self assert: self result value equals: 'ab'