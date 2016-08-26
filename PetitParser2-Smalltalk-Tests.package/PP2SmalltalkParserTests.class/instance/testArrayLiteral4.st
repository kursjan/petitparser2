testing-literals
testArrayLiteral4
	super testArrayLiteral4.
	self assert: result isLiteralNode.
	self assert: result value equals: #(true false nil)