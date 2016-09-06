testing-literals
testArrayLiteral4
	super testArrayLiteral4.
	self assert: self result isLiteralNode.
	self assert: self result value equals: #(true false nil)