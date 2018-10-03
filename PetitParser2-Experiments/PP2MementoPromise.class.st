Class {
	#name : #PP2MementoPromise,
	#superclass : #Object,
	#instVars : [
		'buffer',
		'position',
		'contextMemento',
		'furthestPosition'
	],
	#category : 'PetitParser2-Experiments-Reparsing'
}

{ #category : #accessing }
PP2MementoPromise >> buffer [
	^ buffer
]

{ #category : #accessing }
PP2MementoPromise >> buffer: anObject [
	buffer := anObject
]

{ #category : #accessing }
PP2MementoPromise >> contextMemento [
	^ contextMemento
]

{ #category : #accessing }
PP2MementoPromise >> contextMemento: anObject [
	contextMemento := anObject
]

{ #category : #accessing }
PP2MementoPromise >> furthestPosition [
	^ furthestPosition
]

{ #category : #accessing }
PP2MementoPromise >> furthestPosition: anObject [
	furthestPosition := anObject
]

{ #category : #testing }
PP2MementoPromise >> isPromise [
	^ true
]

{ #category : #accessing }
PP2MementoPromise >> position [
	^ position
]

{ #category : #accessing }
PP2MementoPromise >> position: anObject [
	position := anObject
]

{ #category : #resolving }
PP2MementoPromise >> resolveFor: parser in: context [
	| memento |
	memento := PP2Memento new
		returnValue: (parser parseOn: context);
		contextMemento: context remember;
		furthestPosition: context furthestPosition;
		yourself.

	(contextMemento isNotNil and: [ memento contextMemento position ~= contextMemento position ]) ifTrue: [ 
		PP2ReparseException signal: 'reparse consumed more or less characters than expected'
	].
		
	^ buffer at: position put: memento.
	

]
