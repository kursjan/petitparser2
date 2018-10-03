"
Strategy that can be used as a decorator around another strategy.
"
Class {
	#name : #PP2WrappingStrategy,
	#superclass : #PP2AbstractStrategy,
	#instVars : [
		'strategy'
	],
	#category : 'PetitParser2-Strategies'
}

{ #category : #'instance creation' }
PP2WrappingStrategy class >> on: aPP2Strategy [
	^ self new initializeFor: aPP2Strategy
]

{ #category : #accessing }
PP2WrappingStrategy >> allChildren [
	^ (strategy allChildren) 
		addFirst: self;
		yourself
]

{ #category : #transformation }
PP2WrappingStrategy >> bypass: aChild to: target [
	strategy bypass: aChild to: target
]

{ #category : #parsing }
PP2WrappingStrategy >> changeStrategy: newStrategy [
	self halt: 'JK: delete?'.
	strategy := newStrategy
]

{ #category : #initialization }
PP2WrappingStrategy >> initializeFor: aPP2Strategy [
	strategy := aPP2Strategy.
	
	self assert: aPP2Strategy class ~= self class
]

{ #category : #testing }
PP2WrappingStrategy >> isCache [
	^ false
]

{ #category : #accessing }
PP2WrappingStrategy >> node [
	^ strategy node
]

{ #category : #accessing }
PP2WrappingStrategy >> node: anObject [
	^ strategy node: anObject
]

{ #category : #parsing }
PP2WrappingStrategy >> parseOn: aPP2Context [
	^ strategy parseOn: aPP2Context
]

{ #category : #copying }
PP2WrappingStrategy >> postCopy [
	super postCopy.
	
	strategy := strategy copy.
]

{ #category : #conversion }
PP2WrappingStrategy >> recognizer [
	strategy := strategy recognizer
]

{ #category : #memoization }
PP2WrappingStrategy >> remember: context [
	^ self node memoizationStrategy remember: context
]

{ #category : #memoization }
PP2WrappingStrategy >> restore: context from: memento [
	^ self node memoizationStrategy restore: context from: memento
]

{ #category : #accessing }
PP2WrappingStrategy >> strategy [
	^ strategy
]

{ #category : #accessing }
PP2WrappingStrategy >> strategy: newStrategy [
	strategy := newStrategy
]
