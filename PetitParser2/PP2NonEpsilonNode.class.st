Class {
	#name : #PP2NonEpsilonNode,
	#superclass : #PP2DelegateNode,
	#category : #'PetitParser2-Nodes'
}

{ #category : #visiting }
PP2NonEpsilonNode >> accept: visitor [
	^ visitor visitNonEpsilon: self
]

{ #category : #initialization }
PP2NonEpsilonNode >> resetStrategy [
	strategy := PP2NonEpsilon on: self
]
