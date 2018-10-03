Class {
	#name : #PP2ContextMemento,
	#superclass : #Object,
	#traits : 'TPP2Properties',
	#classTraits : 'TPP2Properties classTrait',
	#instVars : [
		'stream',
		'position',
		'properties'
	],
	#category : 'PetitParser2-Core'
}

{ #category : #arithmetic }
PP2ContextMemento >> + anInteger [
	^ (self copy)
		position: position + anInteger;
		yourself
]

{ #category : #arithmetic }
PP2ContextMemento >> - anInteger [
	^ (self copy)
		position: position - anInteger;
		yourself
]

{ #category : #comparison }
PP2ContextMemento >> = anotherMemento [
	self class == anotherMemento class ifFalse: [ ^ false ].
	
	self position == anotherMemento position ifFalse: [ ^ false ].
	self stream == anotherMemento stream ifFalse: [ ^ false ].
	
	^ self properties = anotherMemento properties
]

{ #category : #comparison }
PP2ContextMemento >> hash [
	^ self position hash
]

{ #category : #accessing }
PP2ContextMemento >> position [
	^ position
]

{ #category : #accessing }
PP2ContextMemento >> position: anObject [
	position := anObject
]

{ #category : #copying }
PP2ContextMemento >> postCopy [
	properties := properties copy
]

{ #category : #'accessing - properties' }
PP2ContextMemento >> properties [
	^ properties
]

{ #category : #'accessing - properties' }
PP2ContextMemento >> properties: newProperties [
	^ properties := newProperties
]

{ #category : #accessing }
PP2ContextMemento >> stream [
	^ stream
]

{ #category : #accessing }
PP2ContextMemento >> stream: anObject [
	stream := anObject
]
