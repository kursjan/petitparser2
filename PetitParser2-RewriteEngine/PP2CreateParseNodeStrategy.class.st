Class {
	#name : #PP2CreateParseNodeStrategy,
	#superclass : #PP2Strategy,
	#category : 'PetitParser2-RewriteEngine-Strategies'
}

{ #category : #parsing }
PP2CreateParseNodeStrategy >> parseOn: context [
	| retval startPosition |
	startPosition := context position.
	(retval := node child parseOn: context) isPetit2Failure ifTrue: [  
		^ retval
	].
	
	^ node nodeClass new
		children: (self toCollection: retval);
		startPosition: startPosition + 1;
		stopPosition: context position;
		name: self node nodeName;
		yourself
]

{ #category : #'*PetitParser2-RewriteEngine' }
PP2CreateParseNodeStrategy >> patternMatching [
	^ PP2PatternStrategy on: self
]

{ #category : #private }
PP2CreateParseNodeStrategy >> toCollection: object [
	object isCollection ifTrue: [ ^ object ].
	
	^ object asOrderedCollection
]
