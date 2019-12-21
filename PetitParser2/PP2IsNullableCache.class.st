Class {
	#name : #PP2IsNullableCache,
	#superclass : #PP2IsNullableVisitor,
	#traits : 'TPP2AnalysisCache',
	#classTraits : 'TPP2AnalysisCache classTrait',
	#category : #'PetitParser2-Optimizations'
}

{ #category : #optimizations }
PP2IsNullableCache >> doPass: node [
	| children child |
	self visit: node.
	children := node allNodes.
	
	[(child := children detect: [ :e | (e hasProperty: self propertySymbol) not ] 
							ifNone: [ nil ]) notNil ] whileTrue: [ 		
		self visit: child
	]
]

{ #category : #optimizations }
PP2IsNullableCache >> propertySymbol [
	^ #isNullable
]
