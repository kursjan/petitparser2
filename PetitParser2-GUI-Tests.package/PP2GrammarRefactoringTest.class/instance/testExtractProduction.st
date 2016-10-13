testing-productions
testExtractProduction
	self
		performRefactoring:
			(PP2ExtractProductionRefactoring
				onClass: PP2ExpressionGrammar
				production: #addition
				interval: (22 to: 33)
				to: #plus).
	self assert: self changes size equals: 3.
	self assert: self changes first class equals: RBAddInstanceVariableChange.
	self assert: self changes first variable equals: 'plus'.
	self assert: self changes second class equals: RBAddMethodChange.
	self assert: self changes second parseTree equals: (RBParser parseMethod: 'plus ^ $+ asPParser').
	self assert: self changes last class equals: RBAddMethodChange.
	self
		assert: self changes last parseTree
		equals:
			(RBParser
				parseMethod:
					'addition	^ primary, plus trim, terms')