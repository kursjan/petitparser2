Trait {
	#name : #TPP2Globals,
	#category : 'PetitParser2-Core'
}

{ #category : #'accessing - globals' }
TPP2Globals >> globalAt: aKey [
	"Answer the global property value associated with aKey."
	
	^ self globalAt: aKey ifAbsent: [ self error: 'Property not found' ]
]

{ #category : #'accessing - globals' }
TPP2Globals >> globalAt: aKey ifAbsent: aBlock [
	"Answer the global property value associated with aKey or, if aKey isn't found, answer the result of evaluating aBlock."
	
	^ self globals isNil
		ifTrue: [ aBlock value ]
		ifFalse: [ self globals at: aKey ifAbsent: aBlock ]
]

{ #category : #'accessing - globals' }
TPP2Globals >> globalAt: aKey ifAbsentPut: aBlock [
	"Answer the global property associated with aKey or, if aKey isn't found store the result of evaluating aBlock as new value."
	
	^ self globalAt: aKey ifAbsent: [ self globalAt: aKey put: aBlock value ]
]

{ #category : #'accessing - globals' }
TPP2Globals >> globalAt: aKey put: anObject [
	"Set the global property at aKey to be anObject. If aKey is not found, create a new entry for aKey and set is value to anObject. Answer anObject."

	^ (self globals ifNil: [ self globals: (IdentityDictionary new: 1) ])
		at: aKey put: anObject
]

{ #category : #'accessing - globals' }
TPP2Globals >> globals [
	self explicitRequirement
]

{ #category : #'accessing - globals' }
TPP2Globals >> hasGlobal: aKey [
	"Test if the global property aKey is present."
	
	^ self globals notNil and: [ self globals includesKey: aKey ]
]

{ #category : #'accessing - globals' }
TPP2Globals >> removeGlobal: aKey [
	"Remove the property with aKey. Answer the property or raise an error if aKey isn't found."
	
	^ self removeGlobal: aKey ifAbsent: [ self error: 'Property not found' ]
]

{ #category : #'accessing - globals' }
TPP2Globals >> removeGlobal: aKey ifAbsent: aBlock [
	"Remove the global property with aKey. Answer the value or, if aKey isn't found, answer the result of evaluating aBlock."
	
	| answer |
	self globals isNil ifTrue: [ ^ aBlock value ].
	answer := self globals removeKey: aKey ifAbsent: aBlock.
	self globals isEmpty ifTrue: [ self globals: nil ].
	^ answer
]
