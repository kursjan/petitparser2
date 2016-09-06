testing-literals
testByteLiteral1
	super testByteLiteral1.
	self assert: self result isLiteralNode.
	self assert: (self result value isKindOf: ByteArray).
	self assert: self result value isEmpty