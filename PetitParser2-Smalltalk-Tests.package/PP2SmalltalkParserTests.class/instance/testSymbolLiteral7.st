testing-literals
testSymbolLiteral7
	super testSymbolLiteral7.
	self assert: result isLiteralNode.
	self assert: result value equals: #fucker.
	self assert: result value isSymbol