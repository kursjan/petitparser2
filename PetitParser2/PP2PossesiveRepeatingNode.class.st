Class {
	#name : #PP2PossesiveRepeatingNode,
	#superclass : #PP2RepeatingNode,
	#category : 'PetitParser2-Nodes'
}

{ #category : #visiting }
PP2PossesiveRepeatingNode >> accept: aPP2Visitor [
	^ aPP2Visitor visitPossesiveRepeating: self
]

{ #category : #comparing }
PP2PossesiveRepeatingNode >> hash [
	^ super hash bitXor: (min hash bitXor: max hash)
]

{ #category : #comparing }
PP2PossesiveRepeatingNode >> localEquals: anotherNode [
	(super localEquals: anotherNode) ifFalse: [ ^ false ].
	
	self min = anotherNode min ifFalse: [ ^ false ].
	self max = anotherNode max ifFalse: [ ^ false ].
	^ true
]

{ #category : #initialization }
PP2PossesiveRepeatingNode >> resetStrategy [
	strategy := PP2PossesiveRepeating on: self
]
