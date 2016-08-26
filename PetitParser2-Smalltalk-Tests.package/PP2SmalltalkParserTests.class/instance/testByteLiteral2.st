testing-literals
testByteLiteral2
	super testByteLiteral2.
	self assert: result isLiteralNode.
	self assert: (result value isKindOf: ByteArray).
	self assert: result value size equals: 1.
	self assert: result value first equals: 0