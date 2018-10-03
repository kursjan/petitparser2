Class {
	#name : #PP2BacktrackingChoiceNode,
	#superclass : #PP2ListNode,
	#category : 'PetitParser2-Experiments-Backtracking'
}

{ #category : #operators }
PP2BacktrackingChoiceNode >> // aRule [ 
	^ self copyWith: aRule
]

{ #category : #visiting }
PP2BacktrackingChoiceNode >> accept: aPP2Visitor [
	^ aPP2Visitor visitBacktrackingChoice: self
]

{ #category : #'parsing - private' }
PP2BacktrackingChoiceNode >> parseOn: aPP2Context [

	| continuation index retval |
	
	index := Continuation currentDo: [ :cc | continuation := cc. 1 ].
	(index > children size) ifFalse: [ 
		aPP2Context continuationStack push: (continuation -> (index + 1)).
		retval := (children at: index) parseWithContext: aPP2Context.
	] ifTrue: [ 
		retval := aPP2Context failure: 'no suitable choice found'
	].

	^ retval

]

{ #category : #'as yet unclassified' }
PP2BacktrackingChoiceNode >> resetStrategy [
	"TODO"
]
