testing-parsers
testRemoveParser
	self performRefactoring: (PP2RemoveParserRefactoring onClass: PP2GrammarRefactoringStubParser).
	self assert: self changes size equals: 1.
	self assert: self changes first class equals: RBRemoveClassChange.
	self assert: self changes first changeClassName equals: 'PP2GrammarRefactoringStubParser'