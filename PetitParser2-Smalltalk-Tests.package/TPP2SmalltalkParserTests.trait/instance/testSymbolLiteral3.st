testing-literals
testSymbolLiteral3
	super testSymbolLiteral3.
	self assert: self result isLiteralNode.
	self assert: self result value equals: #key:.
	self assert: self result value isSymbol