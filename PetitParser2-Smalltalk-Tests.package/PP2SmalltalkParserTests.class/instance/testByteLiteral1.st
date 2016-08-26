testing-literals
testByteLiteral1
	super testByteLiteral1.
	self assert: result isLiteralNode.
	self assert: (result value isKindOf: ByteArray).
	self assert: result value isEmpty