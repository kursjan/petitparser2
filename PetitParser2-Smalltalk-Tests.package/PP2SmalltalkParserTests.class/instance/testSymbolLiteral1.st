testing-literals
testSymbolLiteral1
	super testSymbolLiteral1.
	self assert: result isLiteralNode.
	self assert: result value equals: #foo.
	self assert: result value isSymbol