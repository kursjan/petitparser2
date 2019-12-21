Class {
	#name : #PP2FirstSetCache,
	#superclass : #PP2FirstSetVisitor,
	#traits : 'TPP2AnalysisCache',
	#classTraits : 'TPP2AnalysisCache classTrait',
	#category : #'PetitParser2-Optimizations'
}

{ #category : #optimizations }
PP2FirstSetCache >> doPass: node [
	| children child |
	self visit: node.
	children := node allNodes.
	
	[(child := children detect: [ :e | (e hasProperty: self propertySymbol) not ] 
							ifNone: [ nil ]) notNil ] whileTrue: [ 		
		self visit: child
	]
]

{ #category : #'as yet unclassified' }
PP2FirstSetCache >> propertySymbol [
	^ #firstSet
]
