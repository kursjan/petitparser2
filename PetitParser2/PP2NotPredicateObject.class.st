Class {
	#name : #PP2NotPredicateObject,
	#superclass : #PP2Not,
	#instVars : [
		'predicate',
		'literal'
	],
	#category : 'PetitParser2-Strategies'
}

{ #category : #'as yet unclassified' }
PP2NotPredicateObject >> initializeFor: aNode [
	super initializeFor: aNode.
	predicate := aNode child predicate
]

{ #category : #'as yet unclassified' }
PP2NotPredicateObject >> parseOn: context [
	| peek |
	peek := context peek.
	^ (peek isNil not and: [ predicate value: peek ])
		ifFalse: [ nil ] 
		ifTrue: [ PP2Failure message: 'predicate not expected' context: context ]
]
