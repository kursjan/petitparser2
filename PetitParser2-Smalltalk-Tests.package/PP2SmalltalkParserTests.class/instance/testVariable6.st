testing
testVariable6
	super testVariable6.
	self assert: result isVariable.
	self assert: result name equals: 'super_nanny'