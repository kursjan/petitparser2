Trait {
	#name : #TPP2CollectionAssertions,
	#category : 'PetitParser2-Tests-Core'
}

{ #category : #assertions }
TPP2CollectionAssertions >> assert: aCollection allSatisfy: aBlock [
	self assert: (aCollection allSatisfy: aBlock)
]

{ #category : #assertions }
TPP2CollectionAssertions >> assert: aCollection anySatisfy: aBlock [
	self assert: (aCollection anySatisfy: aBlock)
]

{ #category : #assertions }
TPP2CollectionAssertions >> assert: aCollection includes: aBlock [
	self assert: (aCollection includes: aBlock)
]

{ #category : #assertions }
TPP2CollectionAssertions >> assert: aCollection noneSatisfy: aBlock [
	self assert: (aCollection noneSatisfy: aBlock)
]
