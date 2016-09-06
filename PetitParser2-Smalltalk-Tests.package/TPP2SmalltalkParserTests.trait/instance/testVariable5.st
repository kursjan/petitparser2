testing
testVariable5
	super testVariable5.
	self assert: self result isVariable.
	self assert: self result name equals: 'supernanny'