"
Purpose of this node is to refer to a piece of grammar, that changes dynamically, during parsing. 

The node is essential to run optimization analyses properly. If no optimizations are done, this node is completely useless.
"
Class {
	#name : #PP2AdaptableNode,
	#superclass : #PP2Node,
	#instVars : [
		'child'
	],
	#category : 'PetitParser2-Nodes'
}

{ #category : #visiting }
PP2AdaptableNode >> accept: visitor [
	^ visitor visitAdaptable: self
]

{ #category : #transforming }
PP2AdaptableNode >> changeChild: newChild [
	child := newChild
]

{ #category : #visiting }
PP2AdaptableNode >> child [
	^ child
]

{ #category : #accessing }
PP2AdaptableNode >> children [
	^ child isNil ifTrue: [ Array new ] ifFalse: [ Array with: child ]

]

{ #category : #testing }
PP2AdaptableNode >> isAdaptable [
	^ true
]

{ #category : #testing }
PP2AdaptableNode >> isFirstSetTerminal [
	^ false
]

{ #category : #transforming }
PP2AdaptableNode >> resetStrategy [
	strategy := PP2Delegate on: self
]
