testing
testVariable1
	super testVariable1.
	self assert: self result isVariable.
	self assert: self result name equals: 'trueBinding'