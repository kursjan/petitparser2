Class {
	#name : #PP2PredicateObject,
	#superclass : #PP2Strategy,
	#category : 'PetitParser2-Strategies'
}

{ #category : #parsing }
PP2PredicateObject >> parseOn: aPP2Context [
	^ (aPP2Context atEnd not and: [ node predicate value: aPP2Context uncheckedPeek ])
		ifFalse: [ PP2Failure message: node predicateMessage context: aPP2Context  ]
		ifTrue: [ aPP2Context uncheckedNext ]
]

{ #category : #conversion }
PP2PredicateObject >> recognizer [
	^ PP2PredicateObjectRecognizer on: self node
]
