testing-literals
testByteLiteral5
	super testByteLiteral5.
	self assert: self result isLiteralNode.
	self assert: (self result value isKindOf: ByteArray).
	self assert: self result value size equals: 3.
	self assert: self result value first equals: 10.
	self assert: self result value second equals: 63.
	self assert: self result value last equals: 255