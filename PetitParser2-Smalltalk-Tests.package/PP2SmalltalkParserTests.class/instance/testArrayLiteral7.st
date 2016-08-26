testing-literals
testArrayLiteral7
	super testArrayLiteral7.
	self assert: result isLiteralNode.
	self assert: result value equals: #(#size #at: #at:put: #==).
	result value do: [ :each | self assert: each isSymbol ]