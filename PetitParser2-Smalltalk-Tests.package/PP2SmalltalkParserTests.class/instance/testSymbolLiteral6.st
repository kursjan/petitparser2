testing-literals
testSymbolLiteral6
	super testSymbolLiteral6.
	PPSmalltalkGrammar allowUnderscoreAssignment
		ifTrue: [ ^ self ].
	self assert: result isLiteralNode.
	self assert: result value equals: #'__gen__binding'.
	self assert: result value isSymbol