testing-literals
testSymbolLiteral3
	super testSymbolLiteral3.
	self assert: result isLiteralNode.
	self assert: result value equals: #key:.
	self assert: result value isSymbol