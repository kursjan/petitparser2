Class {
	#name : #PP2EventRecord,
	#superclass : #Object,
	#instVars : [
		'event',
		'position',
		'strategy'
	],
	#category : 'PetitParser2-Recording'
}

{ #category : #accessing }
PP2EventRecord >> event [
	^ event
]

{ #category : #accessing }
PP2EventRecord >> event: anObject [
	event := anObject
]

{ #category : #testing }
PP2EventRecord >> isInvocation [
	^ false
]

{ #category : #accessing }
PP2EventRecord >> node [
	^ strategy node
]

{ #category : #accessing }
PP2EventRecord >> position [
	^ position
]

{ #category : #accessing }
PP2EventRecord >> position: anObject [
	position := anObject
]

{ #category : #accessing }
PP2EventRecord >> strategy [
	^ strategy
]

{ #category : #accessing }
PP2EventRecord >> strategy: anObject [
	strategy := anObject
]
