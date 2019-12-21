"
A parser that performs an action block with the given number of arguments with the successful parse result of the delegate.

Instance Variables:
	block	<BlockClosure>	The action block to be executed.

"
Class {
	#name : #PP2MappingNode,
	#superclass : #PP2AbstractActionNode,
	#category : #'PetitParser2-Nodes'
}

{ #category : #visiting }
PP2MappingNode >> accept: aPP2Visitor [
	^ aPP2Visitor visitMapping: self
]

{ #category : #initialization }
PP2MappingNode >> resetStrategy [
	strategy := PP2Mapping on: self
]
