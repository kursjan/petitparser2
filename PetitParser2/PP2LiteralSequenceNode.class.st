Class {
	#name : #PP2LiteralSequenceNode,
	#superclass : #PP2LiteralNode,
	#category : 'PetitParser2-Nodes'
}

{ #category : #visiting }
PP2LiteralSequenceNode >> accept: aPP2Visitor [
	^ aPP2Visitor visitLiteralSequence: self
]

{ #category : #operators }
PP2LiteralSequenceNode >> caseInsensitive [
	"Answer a parser that can parse the receiver case-insensitive."
	
	literal asUppercase = literal asLowercase ifTrue: [ ^ self ].
	^ PP2PredicateSequenceNode 
		on: [ :value | literal sameAs: value ] 
		message: message
		size: literal size
]

{ #category : #'analysis - first' }
PP2LiteralSequenceNode >> firstCharSet [
	^ (literal = '') ifTrue: [ 
		PP2CharSetPredicate any
	] ifFalse: [ 
		PP2CharSetPredicate on: [ :e | self literal first = e ]
	]
]

{ #category : #'parsing - private' }
PP2LiteralSequenceNode >> parseOn: aPP2Context [
	^ strategy parseOn: aPP2Context 
]

{ #category : #initialization }
PP2LiteralSequenceNode >> resetStrategy [
	strategy := PP2LiteralSequence  on: self
]

{ #category : #accessing }
PP2LiteralSequenceNode >> size [
	^ literal size
]
