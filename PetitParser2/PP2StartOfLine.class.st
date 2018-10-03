Class {
	#name : #PP2StartOfLine,
	#superclass : #PP2Strategy,
	#instVars : [
		'failure'
	],
	#category : 'PetitParser2-Strategies'
}

{ #category : #initialization }
PP2StartOfLine >> initializeFor: aPP2Node [
	super initializeFor: aPP2Node.
	
	failure := PP2Failure message: 'start of line expected'
]

{ #category : #'newline handling' }
PP2StartOfLine >> insideCRLF: context [
	(context position < 1) ifTrue: [ ^ false ].
	
	^ (context peek = (Character codePoint: 10)) and: [ context peekBack = (Character codePoint: 13) ]
]

{ #category : #'newline handling' }
PP2StartOfLine >> isStartOfLine: context [
	(context position = 0) ifTrue: [ ^ true ].

	(self insideCRLF: context) ifTrue: [ ^ false ].
	
	^ (context peekBack = (Character codePoint: 13)) or: [ context peekBack = (Character codePoint: 10)].
]

{ #category : #parsing }
PP2StartOfLine >> parseOn: context [
	^ (self isStartOfLine: context) ifTrue: [ ^ nil ] ifFalse: [ failure context: context ]
]
