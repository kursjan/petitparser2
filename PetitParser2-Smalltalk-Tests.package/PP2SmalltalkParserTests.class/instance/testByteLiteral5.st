testing-literals
testByteLiteral5
	super testByteLiteral5.
	self assert: result isLiteralNode.
	self assert: (result value isKindOf: ByteArray).
	self assert: result value size equals: 3.
	self assert: result value first equals: 10.
	self assert: result value second equals: 63.
	self assert: result value last equals: 255