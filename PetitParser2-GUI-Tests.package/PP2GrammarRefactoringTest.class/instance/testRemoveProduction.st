testing-productions
testRemoveProduction
	self performRefactoring: (PP2RemoveProdcutionRefactoring onClass: PP2ExpressionGrammar production: #addition).
	self assert: self changes size equals: 2.
	self assert: self changes first class equals: RBRemoveMethodChange.
	self assert: self changes first selector equals: #addition.
	self assert: self changes last class equals: RBRemoveInstanceVariableChange.
	self assert: self changes last variable equals: 'addition'