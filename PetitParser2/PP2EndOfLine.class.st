Class {
	#name : #PP2EndOfLine,
	#superclass : #PP2Strategy,
	#instVars : [
		'failure'
	],
	#category : #'PetitParser2-Strategies'
}

{ #category : #initialization }
PP2EndOfLine >> initializeFor: aPP2Node [
	super initializeFor: aPP2Node.
	
	failure := PP2Failure message: 'end of line expected'
]

{ #category : #'newline handling' }
PP2EndOfLine >> insideCRLF: context [
	(context position < 1) ifTrue: [ ^ false ].
	
	^ (context peek = (Character codePoint: 10)) and: [ context peekBack = (Character codePoint: 13) ]
]

{ #category : #'newline handling' }
PP2EndOfLine >> isEndOfLine: context [
	context atEnd ifTrue: [ ^ true ].
	(self insideCRLF: context) ifTrue: [ ^ false ].
	^ (context peek = (Character codePoint: 13) or: [ context peek = (Character codePoint: 10)]).
]

{ #category : #parsing }
PP2EndOfLine >> parseOn: context [
	^ (self isEndOfLine: context) ifTrue: [ ^ nil ] ifFalse: [ failure context: context ]
]
