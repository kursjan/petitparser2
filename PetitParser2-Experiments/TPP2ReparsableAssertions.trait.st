Trait {
	#name : #TPP2ReparsableAssertions,
	#category : 'PetitParser2-Experiments-Reparsing'
}

{ #category : #'as yet unclassified' }
TPP2ReparsableAssertions >> assert: aPP2Parser reparseWithContext: startContext [
	| resultContext |
	resultContext := self parser optimize enableDebug reparseAdaptableWithContext: startContext.
	
	self assert: resultContext isPetit2Success.
	self assert: resultContext atEnd.
	
	^ resultContext
]

{ #category : #'as yet unclassified' }
TPP2ReparsableAssertions >> fail: aPP2Parser reparseWithContext: startContext [
	| resultContext |
	resultContext := self parser optimize enableDebug reparseAdaptableWithContext: startContext.
	
	self assert: resultContext isPetit2Failure.
	
	^ resultContext
]

{ #category : #'as yet unclassified' }
TPP2ReparsableAssertions >> parser [
	self explicitRequirement
]
