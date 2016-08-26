testing
testAssignment6
	super testAssignment6.
	self assert: result isAssignment.
	self assert: result variable isVariable.
	self assert: result variable name equals: 'a'.
	self assert: result value isAssignment.
	self assert: result value variable isVariable.
	self assert: result value variable name equals: 'b'.
	self assert: result value value isVariable.
	self assert: result value value name equals: 'c'