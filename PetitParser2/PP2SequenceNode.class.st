Class {
	#name : #PP2SequenceNode,
	#superclass : #PP2ListNode,
	#category : 'PetitParser2-Nodes'
}

{ #category : #operators }
PP2SequenceNode >> , aRule [
	^ self copyWith: aRule
]

{ #category : #visiting }
PP2SequenceNode >> accept: aPP2Visitor [
	^ aPP2Visitor visitSequence: self
]

{ #category : #accessing }
PP2SequenceNode >> children: newChildren [
	super children: newChildren
]

{ #category : #initialization }
PP2SequenceNode >> resetStrategy [
	strategy := PP2Sequence on: self
]
