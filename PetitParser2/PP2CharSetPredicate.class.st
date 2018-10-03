Class {
	#name : #PP2CharSetPredicate,
	#superclass : #Object,
	#instVars : [
		'block',
		'classification'
	],
	#category : 'PetitParser2-Tools'
}

{ #category : #'instance creation' }
PP2CharSetPredicate class >> any [
	^ self on: [ :e | true ]
]

{ #category : #'instance creation' }
PP2CharSetPredicate class >> empty [
	^ self on: [ :e | false ]
]

{ #category : #'instance creation' }
PP2CharSetPredicate class >> on: aBlock [
	^ self basicNew initializeOn: aBlock
]

{ #category : #converting }
PP2CharSetPredicate >> asCharSetPredicate [
	^ self
]

{ #category : #accessing }
PP2CharSetPredicate >> classification [
	^ classification
]

{ #category : #initialization }
PP2CharSetPredicate >> initializeOn: aBlock [
	block := aBlock.
	classification := Array new: 255.
	1 to: classification size do: [ :index |
		classification at: index put: (block
			value: (Character codePoint: index)) ]
]

{ #category : #testing }
PP2CharSetPredicate >> isUnknown [
	^ false
]

{ #category : #evaluating }
PP2CharSetPredicate >> value: aCharacter [
	| index |
	index := aCharacter asInteger.
	index == 0	ifTrue: [ ^ block value: aCharacter ].
	index > 255	ifTrue: [ ^ block value: aCharacter ].
		
	^ classification at: index
]
