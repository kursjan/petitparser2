testing-literals
testArrayLiteral11
	super testArrayLiteral11.
	self assert: self result isLiteralNode.
	self assert: self result value size equals: 2.
	self assert: (self result value first isKindOf: ByteArray).
	self assert: self result value first size equals: 2.
	self assert: (self result value last isKindOf: ByteArray).
	self assert: self result value last size equals: 3