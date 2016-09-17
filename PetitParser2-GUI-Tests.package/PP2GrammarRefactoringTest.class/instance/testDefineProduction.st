testing-productions
testDefineProduction
	self
		performRefactoring:
			(PP2DefineProdcutionRefactoring
				onClass: PP2ExpressionGrammar
				source: 'function ^ #any asPParser plus , $( asPParser , $) asPParser ==> [ :e | 0 ]'
				protocols: (Array with: #productions)).
	self assert: self changes size equals: 2.
	self assert: self changes first class equals: RBAddInstanceVariableChange.
	self assert: self changes first variable equals: 'function'.
	self assert: self changes last class equals: RBAddMethodChange.
	self
		assert: self changes last parseTree
		equals: (RBParser parseMethod: 'function ^ #any asPParser plus , $( asPParser , $) asPParser ==> [ :e | 0 ]')