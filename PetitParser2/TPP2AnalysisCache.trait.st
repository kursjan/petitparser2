Trait {
	#name : #TPP2AnalysisCache,
	#category : 'PetitParser2-Optimizations'
}

{ #category : #hooks }
TPP2AnalysisCache >> afterAccept: ctx result: result [
	ctx node propertyAt: self propertySymbol ifAbsentPut: result
]

{ #category : #optimizations }
TPP2AnalysisCache >> doPass: node [
	| children child |
	self visit: node.
	children := node allNodes.
	
	[child := children detect: [ :e | (e hasProperty: self propertySymbol) not ] 
							ifNone: [ nil ] ] whileNotNil: [ 		
		self visit: child
	]
]

{ #category : #accessing }
TPP2AnalysisCache >> propertySymbol [
	self explicitRequirement
]
