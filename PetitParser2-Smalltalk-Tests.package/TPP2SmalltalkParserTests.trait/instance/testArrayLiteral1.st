testing-literals
testArrayLiteral1
	super testArrayLiteral1.
	self assert: self result isLiteralNode.
	self assert: self result value equals: #()