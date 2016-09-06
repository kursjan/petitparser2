testing-literals
testSymbolLiteral9
	super testSymbolLiteral9.
	self assert: self result isLiteralNode.
	self assert: self result value equals: #fucker.
	self assert: self result value isSymbol