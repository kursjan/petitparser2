"
The and-predicate, succeeds whenever its delegate does, but does not consume the input stream [Parr 1994, 1995].

Example:
$a asPParser and parse: 'a'
"
Class {
	#name : #PP2AndNode,
	#superclass : #PP2DelegateNode,
	#category : #'PetitParser2-Nodes'
}

{ #category : #visiting }
PP2AndNode >> accept: aPP2Visitor [
	^ aPP2Visitor visitAnd: self
]

{ #category : #operators }
PP2AndNode >> and [
	^ self
]

{ #category : #initialization }
PP2AndNode >> resetStrategy [
	strategy := PP2And on: self
]
