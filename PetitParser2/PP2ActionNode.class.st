"
A parser that performs an action block with the successful parse result of the delegate.

Instance Variables:
	block	<BlockClosure>	The action block to be executed.

"
Class {
	#name : #PP2ActionNode,
	#superclass : #PP2AbstractActionNode,
	#category : #'PetitParser2-Nodes'
}

{ #category : #visiting }
PP2ActionNode >> accept: aPP2Visitor [
	^ aPP2Visitor visitAction: self
]

{ #category : #'parsing - private' }
PP2ActionNode >> parseOld: aPP2Context [
	| context |
	self deprecated: 'This seems to be leftover to be deleted.'.
	^ (context := child parseWithContext:  aPP2Context) isPetit2Failure
		ifFalse: [ context setValue: (block value: context value) ]
		ifTrue: [ context ]
]

{ #category : #initialization }
PP2ActionNode >> resetStrategy [
	strategy := PP2Action on: self
]
