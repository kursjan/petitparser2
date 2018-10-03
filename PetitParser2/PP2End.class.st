Class {
	#name : #PP2End,
	#superclass : #PP2Strategy,
	#category : 'PetitParser2-Strategies'
}

{ #category : #parsing }
PP2End >> parseOn: aPP2Context [
	| memento retval |
	memento := aPP2Context remember.
	retval := node child parseOn: aPP2Context.
	
	^ aPP2Context atEnd ifTrue: [ 
		retval 
	] ifFalse: [
		| failure | 
		failure := PP2Failure message: 'end of input expected' context: aPP2Context. 
		aPP2Context restore: memento. 
		^ failure
	]
]
