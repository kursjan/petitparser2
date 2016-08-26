testing-literals
testSymbolLiteral5
	super testSymbolLiteral5.
	self assert: result isLiteralNode.
	self assert: result value equals: #'testing-result'.
	self assert: result value isSymbol