Class {
	#name : #PP2PlusPredicateObject,
	#superclass : #PP2PossesiveRepeating,
	#instVars : [
		'predicate',
		'failure'
	],
	#category : 'PetitParser2-Strategies'
}

{ #category : #initialization }
PP2PlusPredicateObject >> initializeFor: aPP2Node [
	super initializeFor: aPP2Node.
	
	predicate := node child predicate.
	failure := PP2Failure message: 'predicate not found'
]

{ #category : #parsing }
PP2PlusPredicateObject >> parseOn: aPP2Context [
	| elements |
	
	(aPP2Context atEnd not and: [predicate value: aPP2Context uncheckedPeek]) ifFalse: [ 
		^ failure
	].

	elements := OrderedCollection with: aPP2Context uncheckedNext.
	
	[aPP2Context atEnd not and: [ predicate value: aPP2Context uncheckedPeek ]] whileTrue: [  
		elements addLast: aPP2Context uncheckedNext
	].

	^ elements

]
