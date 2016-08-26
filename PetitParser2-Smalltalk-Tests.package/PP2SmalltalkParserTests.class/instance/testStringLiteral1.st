testing-literals
testStringLiteral1
	super testStringLiteral1.
	self assert: result isLiteralNode.
	self assert: result value equals: ''