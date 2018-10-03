Class {
	#name : #PP2BacktrackingInterpret,
	#superclass : #PP2Interpret,
	#category : 'PetitParser2-Experiments-Backtracking'
}

{ #category : #'visiting - helpers' }
PP2BacktrackingInterpret >> backtrackIfPossible [
	(currentContext continuationStack isEmpty) ifFalse: [  	
		| assoc |
		assoc := currentContext continuationStack pop.
		assoc key value: assoc value.
	]
]

{ #category : #'visiting - helpers' }
PP2BacktrackingInterpret >> backtrackingVisit: parser [
	"visit parser, if it fails, try to backtrack (if the parser created any continuations)"
	| size retval |
	size := currentContext continuationStack size.
	retval := self visit: parser.
	
	(retval isPetit2Failure and: [ currentContext continuationStack size > size ]) 
		ifTrue: [ self backtrackIfPossible ].
		
	^ retval
]

{ #category : #parsing }
PP2BacktrackingInterpret >> parseWithContext: context [
	| result |
	result := super parseWithContext: context.
	result isPetit2Failure ifTrue: [ self backtrackIfPossible  ].
	^ result
]

{ #category : #'visiting - helpers' }
PP2BacktrackingInterpret >> returnPossesiveMin: min index: index elements: elements [
	^ (min <= index) 
		ifTrue: [ elements copyFrom: 1 to: index ]
		ifFalse: [ PP2Failure message: 'not enough repetitions' ]
]

{ #category : #visiting }
PP2BacktrackingInterpret >> visitBacktrackingChoice: parser [
	| continuation index memento |
	memento := currentContext remember.
	index := Continuation currentDo: [ :cc | continuation := cc. 1 ].
	"
	 A bit of magic here, but currentContext is instance variable and is not 
	 persistend when a continuation is created, therefore it should be restored 
	 from a stack variable.
	"
	currentContext restore: memento.

	^ (index <= parser children size) ifTrue: [ 
		currentContext continuationStack push: (continuation -> (index + 1)).
		self visit: (parser childAt: index) .
	] ifFalse: [ 
		PP2Failure message: 'no suitable choice found' context: currentContext
	]

]

{ #category : #visiting }
PP2BacktrackingInterpret >> visitChoice: parser [
	| retval |
	1 to: parser children size do: [ :index |
		"Before each child fails, do backtracking:"
		(retval := self backtrackingVisit: (parser childAt: index)) isPetit2Failure 
			ifFalse: [ ^ retval ] 
	].
	^ retval
]

{ #category : #visiting }
PP2BacktrackingInterpret >> visitPossesiveRepeating: parser [
	| retval elements index |

	"
		JK: Use index to allow for continuations. When the context is restored from the continuation,
		the collection is not restored. We can either use immutable collections (but we do not) or
		we can keept track of index and manage the collection elements on our own.
	"
	
	index := 0.
	elements := OrderedCollection new.
	
	[ index < parser min ] whileTrue: [
	 	(retval := self visit: parser child) isPetit2Failure 
			ifTrue: [ ^ retval ].
		index := index + 1.
		elements at: index ifAbsentPut: retval.
	].

	[ index < parser max ] whileTrue: [
	 	(retval := self visit: parser child) isPetit2Failure 
			ifTrue: [ ^ (elements copyFrom: 1 to: index) ].
		index := index + 1.
		elements at: index ifAbsentPut: retval.
	].

	^ elements

]
