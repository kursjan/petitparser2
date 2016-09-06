testing-literals
testStringLiteral1
	super testStringLiteral1.
	self assert: self result isLiteralNode.
	self assert: self result value equals: ''