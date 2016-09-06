testing-literals
testArrayLiteral5
	super testArrayLiteral5.
	self assert: self result isLiteralNode.
	self assert: self result value equals: #($a)