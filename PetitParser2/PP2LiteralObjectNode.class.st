Class {
	#name : #PP2LiteralObjectNode,
	#superclass : #PP2LiteralNode,
	#category : 'PetitParser2-Nodes'
}

{ #category : #visiting }
PP2LiteralObjectNode >> accept: aPP2Visitor [
	^ aPP2Visitor visitLiteralObject: self
]

{ #category : #operators }
PP2LiteralObjectNode >> caseInsensitive [
	"Answer a parser that can parse the receiver case-insensitive."
	
	literal asUppercase = literal asLowercase ifTrue: [ ^ self ].
	^ PP2PredicateObjectNode on: [ :value | literal sameAs: value ] message: message
]

{ #category : #'analysis - first' }
PP2LiteralObjectNode >> firstCharSet [
	^ PP2CharSetPredicate on: [ :e | e = literal ]
]

{ #category : #operators }
PP2LiteralObjectNode >> negate [
	^ (PP2PredicateObjectNode expect: literal message: message) negate
]

{ #category : #'parsing - private' }
PP2LiteralObjectNode >> parseOn: aPP2Context [
	^ strategy parseOn: aPP2Context 
]

{ #category : #initialization }
PP2LiteralObjectNode >> resetStrategy [
	strategy := PP2LiteralObject on: self
]
