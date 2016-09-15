testing-parsers
testAddParser
	self performRefactoring: (PP2AddParserRefactoring name: #PPMockParser category: #'PetitGui-Mock').
	self assert: self changes size equals: 2.
	self assert: self changes first class equals: RBAddClassChange.
	self assert: self changes first definitionClass equals: PP2CompositeNode.
	self assert: self changes first changeClassName equals: #PPMockParser.
	self assert: self changes first category equals: #'PetitGui-Mock'.
	self assert: self changes last class equals: RBAddMethodChange.
	self assert: self changes last parseTree equals: (RBParser parseMethod: 'start ^ self shouldBeImplemented')