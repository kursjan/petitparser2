Class {
	#name : #PP2TrimmingNode,
	#superclass : #PP2DelegateNode,
	#instVars : [
		'trimmer'
	],
	#category : 'PetitParser2-Nodes'
}

{ #category : #visiting }
PP2TrimmingNode >> accept: aPP2Visitor [
	^ aPP2Visitor visitTrimming: self
]

{ #category : #accessing }
PP2TrimmingNode >> children [
	^ Array with: trimmer with: child
]

{ #category : #testing }
PP2TrimmingNode >> isTrimming [
	^ true
]

{ #category : #testing }
PP2TrimmingNode >> isTrimmingToken [
	^ self child isToken
]

{ #category : #'parsing - private' }
PP2TrimmingNode >> parseOn: aPP2Context [
	^ strategy parseOn: aPP2Context 
]

{ #category : #transforming }
PP2TrimmingNode >> replace: node with: anotherNode [
	node == child ifTrue: [ child := anotherNode ].
	node == trimmer ifTrue: [ trimmer := anotherNode ].
]

{ #category : #initialization }
PP2TrimmingNode >> resetStrategy [
	strategy := PP2Trimming on: self
]

{ #category : #accessing }
PP2TrimmingNode >> trimmer [
	^ trimmer 
]

{ #category : #accessing }
PP2TrimmingNode >> trimmer: aPP2arser [
	trimmer := aPP2arser
]
