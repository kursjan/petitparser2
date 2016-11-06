accessing
boundaryElements: collectionOrElement
	| elements |
	elements := collectionOrElement asCollection.
	elements := elements collect: [:e | self nonEpsilon: e ].
	elements := elements collect: #and.
		
	boundary := (PP2ChoiceNode withAll: elements).
	
	self strategy isDebugging ifTrue: [ boundary enableDebug ]