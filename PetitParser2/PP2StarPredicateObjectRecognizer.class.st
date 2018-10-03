Class {
	#name : #PP2StarPredicateObjectRecognizer,
	#superclass : #PP2PossesiveRepeating,
	#instVars : [
		'predicate'
	],
	#category : 'PetitParser2-Strategies'
}

{ #category : #'as yet unclassified' }
PP2StarPredicateObjectRecognizer >> initializeFor: aPP2Node [
	super initializeFor: aPP2Node.

	predicate := node child predicate
]

{ #category : #'as yet unclassified' }
PP2StarPredicateObjectRecognizer >> parseOn: aPP2Context [
	[aPP2Context atEnd not and: [ predicate value: aPP2Context uncheckedPeek ]] whileTrue: [  
		aPP2Context shift
	].

	^ #()
	

]
