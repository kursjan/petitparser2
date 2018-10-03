Class {
	#name : #PP2MatchNode,
	#superclass : #PP2CsNode,
	#category : 'PetitParser2-Context'
}

{ #category : #visiting }
PP2MatchNode >> accept: visitor [
	^ visitor visitMatch: self
]

{ #category : #initialization }
PP2MatchNode >> resetStrategy [
	strategy := PP2Match on: self
]
