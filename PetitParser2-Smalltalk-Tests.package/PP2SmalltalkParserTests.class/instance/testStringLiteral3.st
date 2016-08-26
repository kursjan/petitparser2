testing-literals
testStringLiteral3
	super testStringLiteral3.
	self assert: result isLiteralNode.
	self assert: result value equals: 'ab''cd'