testing-literals
testSymbolLiteral2
	super testSymbolLiteral2.
	self assert: result isLiteralNode.
	self assert: result value equals: #+.
	self assert: result value isSymbol