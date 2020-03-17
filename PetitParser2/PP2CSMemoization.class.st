Class {
	#name : #PP2CSMemoization,
	#superclass : #PP2Memoization,
	#category : 'PetitParser2-Context'
}

{ #category : #testing }
PP2CSMemoization >> isContextFree [
	^ false
]

{ #category : #memoization }
PP2CSMemoization >> remember: context [
	^ context remember 
]

{ #category : #memoization }
PP2CSMemoization >> restore: context from: memento [
	context restore: memento
]
