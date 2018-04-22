as yet unclassified
assert: aPP2Parser reparseWithContext: startContext
	| resultContext |
	resultContext := self parser optimize enableDebug reparseAdaptableWithContext: startContext.
	
	self assert: resultContext isPetit2Success.
	self assert: resultContext atEnd.
	
	^ resultContext