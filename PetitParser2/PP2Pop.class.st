Class {
	#name : #PP2Pop,
	#superclass : #PP2Strategy,
	#category : 'PetitParser2-Context'
}

{ #category : #'as yet unclassified' }
PP2Pop >> parseOn: context [
	| retval |
	retval := node child parseOn: context.
	
	retval isPetit2Failure ifFalse: [  
		(context stackNamed: node stackId) pop
	].

	^ retval
]
