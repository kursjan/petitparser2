Class {
	#name : #PP2StarPredicateObject,
	#superclass : #PP2PossesiveRepeating,
	#instVars : [
		'predicate'
	],
	#category : 'PetitParser2-Strategies'
}

{ #category : #'as yet unclassified' }
PP2StarPredicateObject class >> on: node predicate: predicate [
	^ (super on: node)
		predicate: predicate;
		yourself
]

{ #category : #parsing }
PP2StarPredicateObject >> parseOn: aPP2Context [
	| collection |
	collection := OrderedCollection new.
	
	[aPP2Context atEnd not and: [ predicate value: aPP2Context uncheckedPeek ]] whileTrue: [  
		collection addLast: aPP2Context uncheckedNext
	].

	^ collection
	

]

{ #category : #accessing }
PP2StarPredicateObject >> predicate: newPredicate [
	predicate := newPredicate 
]

{ #category : #conversion }
PP2StarPredicateObject >> recognizer [
	^ PP2StarPredicateObjectRecognizer on: self node
]
