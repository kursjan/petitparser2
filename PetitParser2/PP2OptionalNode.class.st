Class {
	#name : #PP2OptionalNode,
	#superclass : #PP2DelegateNode,
	#category : 'PetitParser2-Nodes'
}

{ #category : #visiting }
PP2OptionalNode >> accept: aPP2Visitor [
	^ aPP2Visitor visitOptional: self
]

{ #category : #'parsing - private' }
PP2OptionalNode >> parseOn: aPP2Context [
	^ strategy parseOn: aPP2Context 
]

{ #category : #initialization }
PP2OptionalNode >> resetStrategy [
	strategy := PP2Optional on: self
]
