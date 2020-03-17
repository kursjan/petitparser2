Class {
	#name : #PP2NoopContext,
	#superclass : #Object,
	#traits : 'TPP2Properties',
	#classTraits : 'TPP2Properties classTrait',
	#instVars : [
		'node',
		'properties'
	],
	#category : 'PetitParser2-Core'
}

{ #category : #'instance creation' }
PP2NoopContext class >> with: node [
	^ (self new)
		node: node;
		yourself
]

{ #category : #comparing }
PP2NoopContext >> = anotherContext [
	self class == anotherContext class ifFalse: [ ^ false ].
	self node == anotherContext node ifFalse: [ ^ false ].
	
	^ self properties = anotherContext properties
]

{ #category : #comparing }
PP2NoopContext >> hash [
	^ self node identityHash bitXor: (self properties hash)
]

{ #category : #initialization }
PP2NoopContext >> initialize [
	super initialize
]

{ #category : #accessing }
PP2NoopContext >> node [
	^ node
]

{ #category : #accessing }
PP2NoopContext >> node: anObject [
	node := anObject
]

{ #category : #'accessing - properties' }
PP2NoopContext >> properties [
	^ properties
]

{ #category : #'accessing - properties' }
PP2NoopContext >> properties: anObject [
	^ properties := anObject 
]
