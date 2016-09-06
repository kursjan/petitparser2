testing-literals
testByteLiteral2
	super testByteLiteral2.
	self assert: self result isLiteralNode.
	self assert: (self result value isKindOf: ByteArray).
	self assert: self result value size equals: 1.
	self assert: self result value first equals: 0