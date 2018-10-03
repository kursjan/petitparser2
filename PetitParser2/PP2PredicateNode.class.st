Class {
	#name : #PP2PredicateNode,
	#superclass : #PP2Node,
	#instVars : [
		'predicate',
		'predicateMessage',
		'negated',
		'negatedMessage'
	],
	#category : 'PetitParser2-Nodes'
}

{ #category : #'instance creation' }
PP2PredicateNode class >> on: predicate message: message [
	^ self new
		predicate: predicate;
		predicateMessage: message;
		negated: [ :arg | (predicate value: arg) not ];
		negatedMessage: 'no ', message;
		yourself
]

{ #category : #comparing }
PP2PredicateNode >> localEquals: anotherNode [
	(super localEquals: anotherNode) ifFalse: [ ^ false ].
	
	self predicate printString = anotherNode predicate printString ifFalse: [ ^ false ].
	self predicateMessage = anotherNode predicateMessage ifFalse: [ ^ false ].
	^ true
]

{ #category : #comparing }
PP2PredicateNode >> localHash [
	^ super localHash bitXor: (predicate printString hash bitXor: predicateMessage hash)
]

{ #category : #operators }
PP2PredicateNode >> negate [
	"Answer a parser that is the negation of the receiving predicate parser."
	
	^ (self class new)
		predicate: negated;
		predicateMessage: negatedMessage;
		negated: predicate;
		negatedMessage: predicateMessage
]

{ #category : #accessing }
PP2PredicateNode >> negated [
	^ negated
]

{ #category : #accessing }
PP2PredicateNode >> negated: anObject [
	negated := anObject
]

{ #category : #accessing }
PP2PredicateNode >> negatedMessage [
	^ negatedMessage
]

{ #category : #accessing }
PP2PredicateNode >> negatedMessage: anObject [
	negatedMessage := anObject
]

{ #category : #accessing }
PP2PredicateNode >> predicate [
	^ predicate
]

{ #category : #accessing }
PP2PredicateNode >> predicate: anObject [
	predicate := anObject
]

{ #category : #accessing }
PP2PredicateNode >> predicateMessage [
	^ predicateMessage
]

{ #category : #accessing }
PP2PredicateNode >> predicateMessage: anObject [
	predicateMessage := anObject
]
