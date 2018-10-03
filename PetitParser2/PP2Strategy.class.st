Class {
	#name : #PP2Strategy,
	#superclass : #PP2AbstractStrategy,
	#instVars : [
		'node'
	],
	#category : 'PetitParser2-Strategies'
}

{ #category : #'instance creation' }
PP2Strategy class >> new [
	^ self error: 'Use "#on: aPP2Node" instead'
]

{ #category : #'instance creation' }
PP2Strategy class >> on: aPP2Node [
	^ self basicNew initializeFor:	aPP2Node
]

{ #category : #accessing }
PP2Strategy >> allChildren [
	^ OrderedCollection with: self
]

{ #category : #transformation }
PP2Strategy >> bypass: aPP2Node to: target [
	"nothing to do really"
]

{ #category : #initialization }
PP2Strategy >> initializeFor: aPP2Node [
	node := aPP2Node
]

{ #category : #accessing }
PP2Strategy >> node [
	^ node
]

{ #category : #accessing }
PP2Strategy >> node: anObject [
	node := anObject
]

{ #category : #parsing }
PP2Strategy >> parseOn: aPP2Context [
	self subclassResponsibility 
]

{ #category : #memoization }
PP2Strategy >> remember: context [
	^ node memoizationStrategy remember: context
]

{ #category : #memoization }
PP2Strategy >> restore: context from: memento [
	node memoizationStrategy restore: context from: memento
]
