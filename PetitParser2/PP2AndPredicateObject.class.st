Class {
	#name : #PP2AndPredicateObject,
	#superclass : #PP2And,
	#instVars : [
		'predicate',
		'literal'
	],
	#category : 'PetitParser2-Strategies'
}

{ #category : #'as yet unclassified' }
PP2AndPredicateObject >> initializeFor: aNode [
	super initializeFor: aNode.
	predicate := aNode child predicate
]

{ #category : #'as yet unclassified' }
PP2AndPredicateObject >> parseOn: context [
	| peek |
	peek := context peek.
	^ (peek isNil not and: [ predicate value: peek ])
		ifTrue: [ peek ] 
		ifFalse: [ PP2Failure message: 'predicate expected' context: context ]
]
