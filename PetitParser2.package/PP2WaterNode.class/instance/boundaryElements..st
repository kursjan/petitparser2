accessing
boundaryElements: collection
	| elements |
	elements := collection collect: #nonEpsilon.
	elements := elements collect: #and.
		
	boundary := (PP2ChoiceNode withAll: elements).
	
	self strategy isDebugging ifTrue: [ boundary enableDebug ]