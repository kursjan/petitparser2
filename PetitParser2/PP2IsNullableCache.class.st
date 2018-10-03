Class {
	#name : #PP2IsNullableCache,
	#superclass : #PP2IsNullableVisitor,
	#traits : 'TPP2AnalysisCache',
	#classTraits : 'TPP2AnalysisCache classTrait',
	#category : 'PetitParser2-Optimizations'
}

{ #category : #optimizations }
PP2IsNullableCache >> propertySymbol [
	^ #isNullable
]
