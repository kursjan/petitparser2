testing-literals
testSymbolLiteral5
	super testSymbolLiteral5.
	self assert: self result isLiteralNode.
	self assert: self result value equals: #'testing-result'.
	self assert: self result value isSymbol