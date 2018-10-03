Class {
	#name : #PP2ContextSensitivityCache,
	#superclass : #PP2ContextSensitivityVisitor,
	#traits : 'TPP2AnalysisCache',
	#classTraits : 'TPP2AnalysisCache classTrait',
	#category : 'PetitParser2-Optimizations'
}

{ #category : #accessing }
PP2ContextSensitivityCache >> propertySymbol [
	^ #isContextSensitive
]
