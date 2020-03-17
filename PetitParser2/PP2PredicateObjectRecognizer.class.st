Class {
	#name : #PP2PredicateObjectRecognizer,
	#superclass : #PP2Strategy,
	#category : 'PetitParser2-Strategies'
}

{ #category : #'as yet unclassified' }
PP2PredicateObjectRecognizer >> parseOn: aPP2Context [
	^ (aPP2Context atEnd not and: [ node predicate value: aPP2Context uncheckedPeek ])
		ifFalse: [ PP2Failure message: node predicateMessage context: aPP2Context  ]
		ifTrue: [ aPP2Context shift ]
]
