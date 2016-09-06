testing
testVariable2
	super testVariable2.
	self assert: self result isVariable.
	self assert: self result name equals: 'falseBinding'