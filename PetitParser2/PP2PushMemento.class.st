Class {
	#name : #PP2PushMemento,
	#superclass : #Object,
	#instVars : [
		'position',
		'stackSize'
	],
	#category : 'PetitParser2-Context'
}

{ #category : #accessing }
PP2PushMemento >> position [
	^ position
]

{ #category : #accessing }
PP2PushMemento >> position: anObject [
	position := anObject
]

{ #category : #accessing }
PP2PushMemento >> stackSize [
	^ stackSize
]

{ #category : #accessing }
PP2PushMemento >> stackSize: anObject [
	stackSize := anObject
]
