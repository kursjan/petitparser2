Class {
	#name : #PP2NewLine,
	#superclass : #PP2Strategy,
	#instVars : [
		'failure'
	],
	#category : #'PetitParser2-Strategies'
}

{ #category : #initialization }
PP2NewLine >> initializeFor: aPP2Node [
	super initializeFor: aPP2Node.
	failure := PP2Failure message: 'new line expected'

]

{ #category : #parsing }
PP2NewLine >> parseOn: context [
	context atEnd ifTrue: [ ^ failure ].
	
	(context uncheckedPeek == Character lf) ifTrue: [ 
		context shift.
		^ String lf
	].

	(context uncheckedPeek == Character cr) ifTrue: [  
		context shift.
		(context peek == Character lf) ifTrue: [ 
			context shift.
			^ String crlf.
		].
		^ String cr
	].

	^ failure
]
