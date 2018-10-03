Class {
	#name : #PP2PopMemoization,
	#superclass : #PP2Memoization,
	#category : 'PetitParser2-Context'
}

{ #category : #memoization }
PP2PopMemoization >> remember: context [
	"TODO JK: make it working with other than default stacks"
	^ PP2PopMemento new 
		position: context rememberPosition;
		stackSize: context defaultStack size;
		stackTop: context defaultStack top;
		yourself
	
]

{ #category : #memoization }
PP2PopMemoization >> restore: context from: memento [
	context restorePosition: memento position.
	context defaultStack size < memento stackSize ifTrue: [ 	
		context defaultStack push: memento stackTop.
	]
]
