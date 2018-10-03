Class {
	#name : #PP2PopNode,
	#superclass : #PP2CsNode,
	#category : 'PetitParser2-Context'
}

{ #category : #visiting }
PP2PopNode >> accept: visitor [
	^ visitor visitPop: self
]

{ #category : #initialization }
PP2PopNode >> resetStrategy [
	strategy := PP2Pop on: self
]
