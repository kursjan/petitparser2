"
A parser that answers a flat copy of the range my delegate parses.
"
Class {
	#name : #PP2FlattenNode,
	#superclass : #PP2DelegateNode,
	#category : 'PetitParser2-Nodes'
}

{ #category : #visiting }
PP2FlattenNode >> accept: aPP2Visitor [
	^ aPP2Visitor visitFlatten: self
]

{ #category : #initialization }
PP2FlattenNode >> resetStrategy [
	strategy := PP2Flatten on: self
]
