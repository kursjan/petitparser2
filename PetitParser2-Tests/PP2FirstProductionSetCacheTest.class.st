Class {
	#name : #PP2FirstProductionSetCacheTest,
	#superclass : #TestCase,
	#category : 'PetitParser2-Tests-Optimizations'
}

{ #category : #tests }
PP2FirstProductionSetCacheTest >> testSanity [
	| parser |
	parser := PP2ExpressionGrammar new.
	PP2FirstProductionSetCache new doPass: parser.
	
	parser allNodesDo: [ :child | 
		self assert: (child hasProperty: #firstProductionSet).
		self assert: (child firstProductionSet allSatisfy: [ :e | e isProduction  ])
	]
]
