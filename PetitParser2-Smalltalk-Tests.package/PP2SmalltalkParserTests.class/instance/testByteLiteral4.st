testing-literals
testByteLiteral4
	super testByteLiteral4.
	self assert: result isLiteralNode.
	self assert: (result value isKindOf: ByteArray).
	self assert: result value size equals: 2.
	self assert: result value first equals: 1.
	self assert: result value last equals: 2