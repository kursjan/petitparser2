testing-literals
testStringLiteral2
	super testStringLiteral2.
	self assert: result isLiteralNode.
	self assert: result value equals: 'ab'