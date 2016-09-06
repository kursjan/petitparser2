testing-literals
testStringLiteral3
	super testStringLiteral3.
	self assert: self result isLiteralNode.
	self assert: self result value equals: 'ab''cd'