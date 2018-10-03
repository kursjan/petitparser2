Class {
	#name : #PP2PossesiveRepeating,
	#superclass : #PP2Strategy,
	#category : 'PetitParser2-Strategies'
}

{ #category : #parsing }
PP2PossesiveRepeating >> parseOn: context [
	| memento elements retval |
	elements := OrderedCollection new.
	memento := context remember.
	
	[ elements size < node min ] whileTrue: [
		(retval := node child parseOn: context) isPetit2Failure ifTrue: [
			context restore: memento.
			^ retval
		].
		elements addLast: retval 
	].
	
	[ elements size < node max ] whileTrue: [
	 	(retval := node child parseOn: context) isPetit2Failure ifTrue: [ 
			^ elements 
		].
		elements addLast: retval 
	].

	^ elements
]
