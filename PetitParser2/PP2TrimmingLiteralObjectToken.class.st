Class {
	#name : #PP2TrimmingLiteralObjectToken,
	#superclass : #PP2TrimmingToken,
	#instVars : [
		'literal',
		'failure'
	],
	#category : 'PetitParser2-Strategies'
}

{ #category : #'as yet unclassified' }
PP2TrimmingLiteralObjectToken >> initializeFor: aNode [
	| token |
	super initializeFor: aNode.
	
	token := aNode child.
	literal := token childSkipDelegate literal.

	failure := PP2Failure message: 'literal expected'
]

{ #category : #'as yet unclassified' }
PP2TrimmingLiteralObjectToken >> literal [
	^ literal
]

{ #category : #'as yet unclassified' }
PP2TrimmingLiteralObjectToken >> parseOn: context [
	| position retval |
	position := context rememberPosition.
	trimmer parseOn: context.
	
	(context nextFor: literal) ifTrue: [
		retval := context newToken: tokenClass from: context position - 1
	] ifFalse: [  
		context restorePosition: position.
		^ failure
	].
	
	trimmer parseOn: context.

	^ retval
]
