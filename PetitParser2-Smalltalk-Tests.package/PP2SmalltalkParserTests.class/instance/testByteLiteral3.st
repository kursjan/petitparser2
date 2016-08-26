testing-literals
testByteLiteral3
	super testByteLiteral3.
	self assert: result isLiteralNode.
	self assert: (result value isKindOf: ByteArray).
	self assert: result value size equals: 1.
	self assert: result value first equals: 255