Class {
	#name : #PP2PopMemento,
	#superclass : #Object,
	#instVars : [
		'top',
		'position',
		'stackSize'
	],
	#category : 'PetitParser2-Context'
}

{ #category : #accessing }
PP2PopMemento >> position [
	^ position
]

{ #category : #accessing }
PP2PopMemento >> position: anObject [
	position := anObject
]

{ #category : #accessing }
PP2PopMemento >> stackSize [
	^ stackSize
]

{ #category : #accessing }
PP2PopMemento >> stackSize: anObject [
	stackSize := anObject
]

{ #category : #accessing }
PP2PopMemento >> stackTop [
	^ top
]

{ #category : #accessing }
PP2PopMemento >> stackTop: anObject [
	top := anObject
]
