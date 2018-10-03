Class {
	#name : #PP2ReparsableContext,
	#superclass : #PP2InMemoryContext,
	#instVars : [
		'furthestPosition'
	],
	#category : 'PetitParser2-Experiments-Reparsing'
}

{ #category : #converting }
PP2ReparsableContext >> asReparsableContext [
	^ self
]

{ #category : #accessing }
PP2ReparsableContext >> furthestPosition [
	^ furthestPosition max: position
]

{ #category : #accessing }
PP2ReparsableContext >> furthestPosition: anObject [
	furthestPosition := anObject
]

{ #category : #accessing }
PP2ReparsableContext >> next: integer [
	furthestPosition := (furthestPosition max: position + integer).
	^ super next: integer
]

{ #category : #initialization }
PP2ReparsableContext >> on: aCollection [
	furthestPosition := -1.
	^ (super on: aCollection)
]

{ #category : #memoization }
PP2ReparsableContext >> restore: contextMemento [
	furthestPosition := (furthestPosition max: position).
	^ super restore: contextMemento
]

{ #category : #memoization }
PP2ReparsableContext >> restorePosition: contextMemento [
	furthestPosition := (furthestPosition max: position).
	^ super restorePosition: contextMemento
]

{ #category : #converting }
PP2ReparsableContext >> startMemento: anObject [

	self assert: (anObject isKindOf: PP2ContextMemento).
	super startMemento: anObject
]

{ #category : #memoization }
PP2ReparsableContext >> stream: aStream [
	super stream: aStream.
	furthestPosition := position
]
