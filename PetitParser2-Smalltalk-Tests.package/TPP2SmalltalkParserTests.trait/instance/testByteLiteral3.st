testing-literals
testByteLiteral3
	super testByteLiteral3.
	self assert: self result isLiteralNode.
	self assert: (self result value isKindOf: ByteArray).
	self assert: self result value size equals: 1.
	self assert: self result value first equals: 255