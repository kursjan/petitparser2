Class {
	#name : #PP2StarRecognizer,
	#superclass : #PP2PossesiveRepeating,
	#category : #'PetitParser2-Strategies'
}

{ #category : #parsing }
PP2StarRecognizer >> parseOn: aPP2Context [
	| retval |
		
	[ (retval := node child parseOn: aPP2Context) isPetit2Failure ] whileFalse.


]

{ #category : #parsing }
PP2StarRecognizer >> parsingGuard: classification [
	^ (super parsingGuard: classification)
		retval: #();
		yourself
]
