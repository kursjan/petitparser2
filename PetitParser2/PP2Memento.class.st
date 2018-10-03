Class {
	#name : #PP2Memento,
	#superclass : #Object,
	#instVars : [
		'returnValue',
		'contextMemento',
		'furthestPosition'
	],
	#category : 'PetitParser2-Core'
}

{ #category : #accessing }
PP2Memento >> contextMemento [
	^ contextMemento
]

{ #category : #accessing }
PP2Memento >> contextMemento: anObject [
	contextMemento := anObject
]

{ #category : #accessing }
PP2Memento >> furthestPosition [
	^ furthestPosition
]

{ #category : #accessing }
PP2Memento >> furthestPosition: anObject [
	furthestPosition := anObject
]

{ #category : #testing }
PP2Memento >> isPromise [
	^ false
]

{ #category : #resolving }
PP2Memento >> resolveFor: parser in: context [
	^ self
]

{ #category : #accessing }
PP2Memento >> returnValue [
	^ returnValue
]

{ #category : #accessing }
PP2Memento >> returnValue: anObject [
	returnValue := anObject
]
