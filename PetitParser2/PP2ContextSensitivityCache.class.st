Class {
	#name : #PP2ContextSensitivityCache,
	#superclass : #PP2ContextSensitivityVisitor,
	#traits : 'TPP2AnalysisCache',
	#classTraits : 'TPP2AnalysisCache classTrait',
	#category : #'PetitParser2-Optimizations'
}

{ #category : #optimizations }
PP2ContextSensitivityCache >> doPass: node [
	| children child |
	self visit: node.
	children := node allNodes.
	
	[(child := children detect: [ :e | (e hasProperty: self propertySymbol) not ] 
							ifNone: [ nil ]) notNil ] whileTrue: [ 		
		self visit: child
	]
]

{ #category : #accessing }
PP2ContextSensitivityCache >> propertySymbol [
	^ #isContextSensitive
]
