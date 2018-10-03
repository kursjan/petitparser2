Class {
	#name : #PP2ContextChangesCache,
	#superclass : #PP2ContextChangesVisitor,
	#traits : 'TPP2AnalysisCache',
	#classTraits : 'TPP2AnalysisCache classTrait',
	#category : 'PetitParser2-Optimizations'
}

{ #category : #accessing }
PP2ContextChangesCache >> propertySymbol [
	^ #contextChanges
]
