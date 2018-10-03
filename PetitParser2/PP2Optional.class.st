Class {
	#name : #PP2Optional,
	#superclass : #PP2Strategy,
	#category : 'PetitParser2-Strategies'
}

{ #category : #parsing }
PP2Optional >> parseOn: aPP2Context [
	| memento retval |
	memento := aPP2Context remember.
	
	^ (retval := node child parseOn: aPP2Context) isPetit2Success
		ifTrue: [ retval ]
		ifFalse: [ aPP2Context restore: memento. nil ]

]

{ #category : #'as yet unclassified' }
PP2Optional >> parsingGuard: classification [
	^ (super parsingGuard: classification)
		retval: nil
		yourself
]
