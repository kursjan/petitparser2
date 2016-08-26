testing-literals
testArrayLiteral8
	super testArrayLiteral8.
	self assert: result isLiteralNode.
	self assert: result value equals: #('baz').
	self assert: result value first isString.
	self assert: result value first isSymbol not