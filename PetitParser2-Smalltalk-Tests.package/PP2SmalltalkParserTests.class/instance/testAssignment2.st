testing
testAssignment2
	super testAssignment2.
	self assert: result isAssignment.
	self assert: result variable isVariable.
	self assert: result variable name equals: 'a'.
	self assert: result value isLiteralNode.
	self assert: result value value equals: 1