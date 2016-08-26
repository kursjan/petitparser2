testing-literals
testSymbolLiteral4
	super testSymbolLiteral4.
	self assert: result isLiteralNode.
	self assert: result value equals: #key:value:.
	self assert: result value isSymbol