testing
testVariable7
	super testVariable7.
	self assert: self result isVariable.
	self assert: self result name equals: '__gen_var_123__'