testing-productions
testRenameProduction
	self performRefactoring: (PP2RenameProdcutionRefactoring onClass: PP2ExpressionGrammar rename: #addition to: #add).
	self assert: self changes size equals: 3.
	self assert: self changes first class equals: RBRenameInstanceVariableChange.
	self assert: self changes first oldName equals: 'addition'.
	self assert: self changes first newName equals: 'add'.
	self assert: self changes second class equals: RBAddMethodChange.
	self
		assert: self changes second parseTree
		equals:
			(RBParser
				parseMethod:
					'add ^ primary, $+ asPParser trim, terms').
	self assert: self changes last class equals: RBRemoveMethodChange.
	self assert: self changes last selector equals: #addition