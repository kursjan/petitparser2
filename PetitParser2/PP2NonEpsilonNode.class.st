Class {
	#name : #PP2NonEpsilonNode,
	#superclass : #PP2DelegateNode,
	#category : 'PetitParser2-Nodes'
}

{ #category : #'as yet unclassified' }
PP2NonEpsilonNode >> accept: visitor [
	^ visitor visitNonEpsilon: self
]

{ #category : #'as yet unclassified' }
PP2NonEpsilonNode >> resetStrategy [
	strategy := PP2NonEpsilon on: self
]
