testing-literals
testSymbolLiteral4
	super testSymbolLiteral4.
	self assert: self result isLiteralNode.
	self assert: self result value equals: #key:value:.
	self assert: self result value isSymbol