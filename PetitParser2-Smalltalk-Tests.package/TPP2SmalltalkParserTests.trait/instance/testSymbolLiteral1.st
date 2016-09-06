testing-literals
testSymbolLiteral1
	super testSymbolLiteral1.
	self assert: self result isLiteralNode.
	self assert: self result value equals: #foo.
	self assert: self result value isSymbol