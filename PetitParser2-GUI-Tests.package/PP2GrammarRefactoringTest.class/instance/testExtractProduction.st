testing-productions
testExtractProduction
	self
		performRefactoring:
			(PP2ExtractProductionRefactoring
				onClass: PPArithmeticParser
				production: #addition
				interval: (36 to: 60)
				to: #plusOrMinus).
	self assert: self changes size equals: 3.
	self assert: self changes first class equals: RBAddInstanceVariableChange.
	self assert: self changes first variable equals: 'plusOrMinus'.
	self assert: self changes second class equals: RBAddMethodChange.
	self assert: self changes second parseTree equals: (RBParser parseMethod: 'plusOrMinus ^ $+ asParser / $- asParser').
	self assert: self changes last class equals: RBAddMethodChange.
	self
		assert: self changes last parseTree
		equals:
			(RBParser
				parseMethod:
					'addition ^ (factors separatedBy: plusOrMinus trim) foldLeft: [ :a :op :b | a perform: op asSymbol with: b ]')