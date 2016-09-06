testing-literals
testArrayLiteral8
	super testArrayLiteral8.
	self assert: self result isLiteralNode.
	self assert: self result value equals: #('baz').
	self assert: self result value first isString.
	self assert: self result value first isSymbol not