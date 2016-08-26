testing-literals
testSymbolLiteral9
	super testSymbolLiteral9.
	self assert: result isLiteralNode.
	self assert: result value equals: #fucker.
	self assert: result value isSymbol