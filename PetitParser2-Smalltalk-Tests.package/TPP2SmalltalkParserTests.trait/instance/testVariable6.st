testing
testVariable6
	super testVariable6.
	self assert: self result isVariable.
	self assert: self result name equals: 'super_nanny'