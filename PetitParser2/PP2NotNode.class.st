Class {
	#name : #PP2NotNode,
	#superclass : #PP2DelegateNode,
	#category : 'PetitParser2-Nodes'
}

{ #category : #visiting }
PP2NotNode >> accept: aPP2Visitor [
	^ aPP2Visitor visitNot: self
]

{ #category : #'analysis - first' }
PP2NotNode >> firstCharSet [
	^ PP2UnknownCharSetPredicate instance
]

{ #category : #'analysis - first' }
PP2NotNode >> isFirstSetTerminal [
	^ true
]

{ #category : #'parsing - private' }
PP2NotNode >> parseOn: aPP2Context [
	^ strategy parseOn: aPP2Context 
]

{ #category : #initialization }
PP2NotNode >> resetStrategy [
	strategy := PP2Not on: self
]
