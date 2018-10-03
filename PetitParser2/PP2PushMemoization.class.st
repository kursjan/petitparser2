Class {
	#name : #PP2PushMemoization,
	#superclass : #PP2Memoization,
	#category : 'PetitParser2-Context'
}

{ #category : #memoization }
PP2PushMemoization >> remember: context [
	"TODO JK: make it working with other than default stacks"
	^ PP2PushMemento new 
		position: context rememberPosition;
		stackSize: context defaultStack size;
		yourself
	
]

{ #category : #memoization }
PP2PushMemoization >> restore: context from: memento [
	context restorePosition: memento position.
	context defaultStack size > memento stackSize ifTrue: [ 	
		context defaultStack pop
	]
]
