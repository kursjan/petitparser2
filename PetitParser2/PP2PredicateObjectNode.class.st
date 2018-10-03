Class {
	#name : #PP2PredicateObjectNode,
	#superclass : #PP2PredicateNode,
	#category : 'PetitParser2-Nodes'
}

{ #category : #'factory-objects' }
PP2PredicateObjectNode class >> anyOf: aCollection [
	^ self new
		predicate: [ :each | aCollection includes: each ];
		predicateMessage: 'any of ' , aCollection printString , ' expected';
		negated: [ :each | (aCollection includes: each) not ];
		negatedMessage: 'none of ' , aCollection printString ,  'expected'
]

{ #category : #'factory-objects' }
PP2PredicateObjectNode class >> expect: anObject message: aString [
	^ (self new)
		predicate: [ :each | each = anObject ];
		predicateMessage: aString;
		negated: [ :each | each ~= anObject ];
		negatedMessage: 'no ' , aString
]

{ #category : #'factory-objects' }
PP2PredicateObjectNode class >> noneOf: aCollection [
	^ self new
		predicate: [ :each | (aCollection includes: each) not ];
		predicateMessage: 'none of ' , aCollection printString , ' expected';
		negated: [ :each | (aCollection includes: each) ];
		negatedMessage: 'any of ' , aCollection printString ,  'expected'
]

{ #category : #visiting }
PP2PredicateObjectNode >> accept: aPP2Visitor [
	^ aPP2Visitor visitPredicateObject: self
]

{ #category : #'analysis - first' }
PP2PredicateObjectNode >> firstCharSet [
	^ predicate asCharSetPredicate
]

{ #category : #accessing }
PP2PredicateObjectNode >> predicate: aPP2CharSetPredicateOrBlock [
	"Using char set predicate is a performance optimization"
	predicate := aPP2CharSetPredicateOrBlock asCharSetPredicate
]

{ #category : #initialization }
PP2PredicateObjectNode >> resetStrategy [
	strategy := PP2PredicateObject on: self
]
