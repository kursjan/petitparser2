Class {
	#name : #PP2UnresolvedNode,
	#superclass : #PP2Node,
	#category : 'PetitParser2-Core'
}

{ #category : #testing }
PP2UnresolvedNode >> isUnresolved [
	^ true
]

{ #category : #parsing }
PP2UnresolvedNode >> parseOn: aStream [
	self error: self printString , ' need to be resolved before execution.'
]

{ #category : #initialization }
PP2UnresolvedNode >> resetStrategy [
	"nothing to do here"
]
