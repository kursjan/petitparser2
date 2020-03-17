Class {
	#name : #PP2Memoization,
	#superclass : #Object,
	#category : 'PetitParser2-Context'
}

{ #category : #memoization }
PP2Memoization >> remember: context [
	self subclassResponsibility 
]

{ #category : #memoization }
PP2Memoization >> restore: context from: memento [
	self subclassResponsibility 
]
