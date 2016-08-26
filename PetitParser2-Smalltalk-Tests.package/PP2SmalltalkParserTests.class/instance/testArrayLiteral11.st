testing-literals
testArrayLiteral11
	super testArrayLiteral11.
	self assert: result isLiteralNode.
	self assert: result value size equals: 2.
	self assert: (result value first isKindOf: ByteArray).
	self assert: result value first size equals: 2.
	self assert: (result value last isKindOf: ByteArray).
	self assert: result value last size equals: 3