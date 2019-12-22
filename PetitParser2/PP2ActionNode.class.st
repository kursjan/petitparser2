"
Performs an action block with the successful parse result of the delegate. Fails if the delegate fails.

Instance Variables:
	block	<BlockClosure>	The action block to be executed.

Example:
$a asPParser ==> [ :a | a uppercase ] parse: 'a'
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

{ #category : #initialization }
PP2ActionNode >> resetStrategy [
	strategy := PP2Action on: self
]
