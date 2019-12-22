"
Matches if the underlying parsers, delegate, matches. Delegate is the only child.

Instance Variables:
	child		<PP2Node>	The parser to delegate to.
"
Class {
	#name : #PP2DelegateNode,
	#superclass : #PP2Node,
	#instVars : [
		'child'
	],
	#category : #'PetitParser2-Nodes'
}

{ #category : #'instance creation' }
PP2DelegateNode class >> on: node [
	^ self new child: node
		
	
]

{ #category : #visiting }
PP2DelegateNode >> accept: aPP2Visitor [
	^ aPP2Visitor visitDelegate: self
]

{ #category : #transforming }
PP2DelegateNode >> changeChild: newChild [
	self assert: child isAdaptable.
	child changeChild: newChild.
]

{ #category : #accessing }
PP2DelegateNode >> child [
	^ child
]

{ #category : #accessing }
PP2DelegateNode >> child: newChild [
	child := newChild
]

{ #category : #accessing }
PP2DelegateNode >> childSkipDelegate [
	^ child isJustDelegate ifTrue: [  child child ] ifFalse: [	^ child ]

]

{ #category : #accessing }
PP2DelegateNode >> children [
	^ Array with: child
]

{ #category : #'optimizations - caching' }
PP2DelegateNode >> isCacheForbidden [
	self isJustDelegate ifFalse: [  
		^ super isCacheForbidden 
	].

	^ super isCacheForbidden or: [ self child isCacheForbidden  ]
]

{ #category : #testing }
PP2DelegateNode >> isDelegate [
	self class == PP2DelegateNode 
]

{ #category : #testing }
PP2DelegateNode >> isJustDelegate [
	^ self class == PP2DelegateNode 
]

{ #category : #transforming }
PP2DelegateNode >> replace: node with: anotherNode [
	child == node ifTrue: [ child := anotherNode ]
]

{ #category : #initialization }
PP2DelegateNode >> resetStrategy [
	strategy := PP2Delegate on: self
]
