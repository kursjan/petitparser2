Class {
	#name : #PP2AnyStarLazyLiteralObject,
	#superclass : #PP2StarLazy,
	#instVars : [
		'literal'
	],
	#category : 'PetitParser2-Strategies'
}

{ #category : #'instance creation' }
PP2AnyStarLazyLiteralObject class >> on: node literal: literal [
	^ (super on: node)
		literal: literal;
		yourself
]

{ #category : #accessing }
PP2AnyStarLazyLiteralObject >> literal [
	^ literal
]

{ #category : #accessing }
PP2AnyStarLazyLiteralObject >> literal: newLiteral [
	literal := newLiteral 
]

{ #category : #parsing }
PP2AnyStarLazyLiteralObject >> parseOn: context [
	| retval position |
	retval := OrderedCollection new.
	position := context rememberPosition.	

	[ 
		context atEnd ifTrue: [ 
			context restorePosition: position.
			^ PP2Failure message: 'boundary not found' context: context
		].

		context uncheckedPeek == literal
	] whileFalse: [  
		retval addLast: context uncheckedNext
	].

	^ retval

]
