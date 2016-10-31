accessing
boundaryElements: collection
	boundary := (PP2ChoiceNode withAll: collection) and.
	
	self strategy isDebugging ifTrue: [ boundary enableDebug ]