Class {
	#name : #PP2SmalltalkWhitespaceStrategy,
	#superclass : #PP2Strategy,
	#instVars : [
		'failure'
	],
	#category : 'PetitParser2-Smalltalk-Strategies'
}

{ #category : #'as yet unclassified' }
PP2SmalltalkWhitespaceStrategy >> initializeFor: aPP2Node [
	super initializeFor: aPP2Node.
	
	failure := PP2Failure message: 'no whitespace found'
]

{ #category : #parsing }
PP2SmalltalkWhitespaceStrategy >> parseOn: aPP2Context [
	[ 
		[ aPP2Context peek isSeparator ] whileTrue: [ 
			aPP2Context shift 
		].
	
		(aPP2Context peek == $" ) 
	] whileTrue: [
		aPP2Context shift.
		aPP2Context upTo: $".
	].

	^ failure
]
