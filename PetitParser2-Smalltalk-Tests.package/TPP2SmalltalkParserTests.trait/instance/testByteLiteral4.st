testing-literals
testByteLiteral4
	super testByteLiteral4.
	self assert: self result isLiteralNode.
	self assert: (self result value isKindOf: ByteArray).
	self assert: self result value size equals: 2.
	self assert: self result value first equals: 1.
	self assert: self result value last equals: 2