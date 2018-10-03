Class {
	#name : #PP2Trimming,
	#superclass : #PP2Strategy,
	#category : 'PetitParser2-Strategies'
}

{ #category : #parsing }
PP2Trimming >> parseOn: aPP2Context [
	| position retval |
	position := aPP2Context position.

	node trimmer parseOn: aPP2Context.
	
	(retval := node child parseOn: aPP2Context) isPetit2Failure ifTrue: [ 
		aPP2Context restorePosition: position.
		^ retval
	].
	
	node trimmer parseOn: aPP2Context.

	^ retval
]
