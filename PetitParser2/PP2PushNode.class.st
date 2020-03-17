Class {
	#name : #PP2PushNode,
	#superclass : #PP2CsNode,
	#category : 'PetitParser2-Context'
}

{ #category : #visiting }
PP2PushNode >> accept: visitor [
	^ visitor visitPush: self
]

{ #category : #initialization }
PP2PushNode >> resetStrategy [
	strategy := PP2Push on: self
]
