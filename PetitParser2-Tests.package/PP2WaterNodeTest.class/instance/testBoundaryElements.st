tests
testBoundaryElements
	| water boundary |
	water := PP2WaterNode new.
	boundary := $a asPParser.
	
	water boundaryElements: boundary asOrderedCollection.
	
	self assert: water boundary isKindOf: PP2ChoiceNode.
	self assert: water boundary firstChild isKindOf: PP2AndNode.
	self assert: water boundaryElements first  == boundary