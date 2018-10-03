Class {
	#name : #PP2BacktrackNode,
	#superclass : #PP2DelegateNode,
	#category : 'PetitParser2-Experiments-Backtracking'
}

{ #category : #visiting }
PP2BacktrackNode >> accept: aPP2Visitor [
	^ aPP2Visitor visitBacktracking: self
]

{ #category : #operators }
PP2BacktrackNode >> backtrack [
	^ self
]

{ #category : #'parsing - private' }
PP2BacktrackNode >> parseOn: startContext [
	| size returnContext |
	size := startContext continuationStack size.
	returnContext := child parseWithContext: startContext.
	
	(returnContext isPetit2Failure and: [ returnContext continuationStack size > size]) ifTrue: [  	
		| assoc |
		assoc := returnContext continuationStack pop.
		assoc key value: assoc value.
	].

	^ returnContext
]

{ #category : #'as yet unclassified' }
PP2BacktrackNode >> resetStrategy [
	"TODO"
]
