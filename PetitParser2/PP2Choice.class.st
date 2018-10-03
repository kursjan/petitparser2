Class {
	#name : #PP2Choice,
	#superclass : #PP2Strategy,
	#category : 'PetitParser2-Strategies'
}

{ #category : #parsing }
PP2Choice >> parseOn: aPP2Context [
	| retval |
	
	1 to: node children size do: [ :index |
		(retval := (node childAt: index) parseOn: aPP2Context) isPetit2Success ifTrue: [ ^ retval ] 
	].
	
	^ retval
]
