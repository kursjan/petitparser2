asserting
assert: aPP2Parser reparseWithContext: startContext
	| resultContext |
	resultContext := aPP2Parser optimize enableDebug reparseAdaptableWithContext: startContext.
	
	self assert: resultContext isPetit2Success.
	self assert: resultContext atEnd.
	
	^ resultContext