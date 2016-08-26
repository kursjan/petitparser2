testing-literals
testSymbolLiteral8
	super testSymbolLiteral8.
	self assert: result isLiteralNode.
	self assert: result value equals: #fucker.
	self assert: result value isSymbol