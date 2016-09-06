testing-literals
testSymbolLiteral8
	super testSymbolLiteral8.
	self assert: self result isLiteralNode.
	self assert: self result value equals: #fucker.
	self assert: self result value isSymbol