testing-literals
testArrayLiteral7
	super testArrayLiteral7.
	self assert: self result isLiteralNode.
	self assert: self result value equals: #(#size #at: #at:put: #==).
	self result value do: [ :each | self assert: each isSymbol ]