Trait {
	#name : #TPP2TypeAssertions,
	#category : 'PetitParser2-Tests-Optimizations'
}

{ #category : #assertions }
TPP2TypeAssertions >> assert: anObject isKindOf: aClass [
	self assert: (anObject isKindOf: aClass)
]

{ #category : #assertions }
TPP2TypeAssertions >> deny: anObject isKindOf: aClass [
	self assert: (anObject isKindOf: aClass) not
]
