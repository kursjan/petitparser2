Class {
	#name : #PP2TrimmingToken,
	#superclass : #PP2Strategy,
	#instVars : [
		'tokenClass',
		'trimmer',
		'tokenChild'
	],
	#category : 'PetitParser2-Strategies'
}

{ #category : #parsing }
PP2TrimmingToken >> initializeFor: aNode [
	super initializeFor: aNode.
	
	tokenClass := aNode child tokenClass.
	tokenChild := aNode child child.
	trimmer := aNode trimmer.
]

{ #category : #parsing }
PP2TrimmingToken >> parseOn: context [
	| position retval start |
	position := context rememberPosition.
	trimmer parseOn: context.

	start := context position.
	(retval := tokenChild parseOn: context) isPetit2Failure ifTrue: [ 
		context restorePosition: position.
		^ retval
	].
	retval := context newToken: tokenClass from: start.
	trimmer parseOn: context.

	^ retval
]

{ #category : #accessing }
PP2TrimmingToken >> tokenChild [
	^ tokenChild
]

{ #category : #accessing }
PP2TrimmingToken >> tokenChild: anObject [
	tokenChild := anObject
]

{ #category : #accessing }
PP2TrimmingToken >> tokenClass [
	^ tokenClass
]

{ #category : #accessing }
PP2TrimmingToken >> tokenClass: anObject [
	tokenClass := anObject
]

{ #category : #accessing }
PP2TrimmingToken >> trimmer [
	^ trimmer
]

{ #category : #accessing }
PP2TrimmingToken >> trimmer: anObject [
	trimmer := anObject
]
