testing-literals
testSymbolLiteral6
	super testSymbolLiteral6.
	self assert: self result isLiteralNode.
	self assert: self result value equals: #'__gen__binding'.
	self assert: self result value isSymbol