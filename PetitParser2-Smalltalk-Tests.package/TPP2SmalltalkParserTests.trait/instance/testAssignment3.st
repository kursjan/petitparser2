testing
testAssignment3
	super testAssignment3.
	self assert: self result isAssignment.
	self assert: self result variable isVariable.
	self assert: self result variable name equals: 'a'.
	self assert: self result value isAssignment.
	self assert: self result value variable isVariable.
	self assert: self result value variable name equals: 'b'.
	self assert: self result value value isLiteralNode.
	self assert: self result value value value equals: 1