testing-literals
testSymbolLiteral7
	super testSymbolLiteral7.
	self assert: self result isLiteralNode.
	self assert: self result value equals: #fucker.
	self assert: self result value isSymbol