as yet unclassified
fail: aPP2Parser reparseWithContext: startContext
	| resultContext |
	resultContext := self parser optimize enableDebug reparseAdaptableWithContext: startContext.
	
	self assert: resultContext isPetit2Failure.
	
	^ resultContext