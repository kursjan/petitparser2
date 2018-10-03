Class {
	#name : #PP2AnyStarLazyPredicateObject,
	#superclass : #PP2StarLazy,
	#instVars : [
		'predicate'
	],
	#category : 'PetitParser2-Strategies'
}

{ #category : #'as yet unclassified' }
PP2AnyStarLazyPredicateObject class >> on: node predicate: predicate [
	^ (super on: node)
		predicate: predicate;
		yourself
]

{ #category : #parsing }
PP2AnyStarLazyPredicateObject >> parseOn: context [
	| retval position |

	retval := OrderedCollection new.
	position := context rememberPosition.

	[ 
		context atEnd ifTrue: [ 
			context restorePosition: position.
			^ PP2Failure message: 'boundary not found' context: context
		].

		predicate value: context uncheckedPeek
	] whileFalse: [  
		retval addLast: context uncheckedNext
	].

	^ retval

]

{ #category : #accessing }
PP2AnyStarLazyPredicateObject >> predicate [
	^ predicate
]

{ #category : #accessing }
PP2AnyStarLazyPredicateObject >> predicate: newPredicate [
	predicate := newPredicate 
]
