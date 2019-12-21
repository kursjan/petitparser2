Class {
	#name : #PP2PredicateSequenceNode,
	#superclass : #PP2PredicateNode,
	#instVars : [
		'size'
	],
	#category : #'PetitParser2-Nodes'
}

{ #category : #'as yet unclassified' }
PP2PredicateSequenceNode class >> on: predicate message: message size: size [
	^ (super on: predicate message: message)
		size: size;
		yourself
]

{ #category : #visiting }
PP2PredicateSequenceNode >> accept: aPP2Visitor [
	^ aPP2Visitor visitPredicateSequence: self
]

{ #category : #'analysis - first' }
PP2PredicateSequenceNode >> firstCharSet [
	"
		TODO(JanKurs): We can optimize a bit here. For example, for 
			'abc' asPParser caseInsensitive
		
		the first chare set can be derived.
	"
	^ PP2UnknownCharSetPredicate new
]

{ #category : #comparing }
PP2PredicateSequenceNode >> localEquals: anotherNode [
	(super localEquals: anotherNode) ifFalse: [ ^ false ].
	
	^ self size = anotherNode size
]

{ #category : #comparing }
PP2PredicateSequenceNode >> localHash [
	^ super localHash bitXor: size hash
]

{ #category : #operators }
PP2PredicateSequenceNode >> negate [
	"Answer a parser that is the negation of the receiving predicate parser."
	
	^ super negate
		size: size;
		yourself
]

{ #category : #initialization }
PP2PredicateSequenceNode >> resetStrategy [
	strategy := PP2PredicateSequence on: self
]

{ #category : #accessing }
PP2PredicateSequenceNode >> size [
	^ size
]

{ #category : #accessing }
PP2PredicateSequenceNode >> size: anObject [
	size := anObject
]
