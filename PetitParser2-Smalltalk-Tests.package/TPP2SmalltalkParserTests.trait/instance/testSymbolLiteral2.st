testing-literals
testSymbolLiteral2
	super testSymbolLiteral2.
	self assert: self result isLiteralNode.
	self assert: self result value equals: #+.
	self assert: self result value isSymbol