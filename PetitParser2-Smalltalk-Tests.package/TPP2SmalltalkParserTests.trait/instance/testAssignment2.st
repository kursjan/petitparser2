testing
testAssignment2
	super testAssignment2.
	self assert: self result isAssignment.
	self assert: self result variable isVariable.
	self assert: self result variable name equals: 'a'.
	self assert: self result value isLiteralNode.
	self assert: self result value value equals: 1