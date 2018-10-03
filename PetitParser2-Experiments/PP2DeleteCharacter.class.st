Class {
	#name : #PP2DeleteCharacter,
	#superclass : #PP2InputChange,
	#category : 'PetitParser2-Experiments-Reparsing'
}

{ #category : #'as yet unclassified' }
PP2DeleteCharacter >> changeAfterRange: highIndex [
	^ position > (highIndex + 1)
]

{ #category : #'as yet unclassified' }
PP2DeleteCharacter >> changeBeforeRange: lowIndex [
	^ position  < lowIndex
]

{ #category : #'as yet unclassified' }
PP2DeleteCharacter >> changeBetween: lowIndex and: highIndex [
	^ position >= lowIndex and: [ (position - 1) <= highIndex ]
]

{ #category : #'private - updates' }
PP2DeleteCharacter >> updateBuffer: buffer [
	| newBuffer|
	newBuffer := IdentityDictionary new.
	
	buffer associationsDo: [ :assoc |
		| key memento  lowIndex highIndex contextMemento |
		key := assoc key.
		memento := assoc value.
		
		lowIndex := (assoc key + 1).
		highIndex := assoc value furthestPosition.
		contextMemento := assoc value contextMemento.

		(self changeAfterRange: highIndex) ifTrue: [ newBuffer at: key put: memento ].
		(self changeBetween: lowIndex and: highIndex) ifTrue: [ 
			newBuffer at: key put: (PP2MementoPromise new
				contextMemento: contextMemento - 1;
				furthestPosition: highIndex - 1;
				buffer: newBuffer;
				position: key;
				yourself)
		].
		(self changeBeforeRange: lowIndex) ifTrue: [ 
			memento contextMemento: contextMemento - 1.
			newBuffer at: key - 1 put: memento 
		].
	].

	^ newBuffer
]

{ #category : #'private - updates' }
PP2DeleteCharacter >> updateToken: token [
	(self changeBeforeRange: token start) ifTrue: [ 
		token start: token start - 1.
		token stop: token stop - 1.
		token collection: input
	]
]
