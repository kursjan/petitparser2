Class {
	#name : #PP2InsertCharacter,
	#superclass : #PP2InputChange,
	#instVars : [
		'character'
	],
	#category : 'PetitParser2-Experiments-Reparsing'
}

{ #category : #testing }
PP2InsertCharacter >> changeAfterRange: highIndex [
	^ position > (highIndex + 1)
]

{ #category : #testing }
PP2InsertCharacter >> changeBeforeRange: lowIndex [
	^ position < lowIndex
]

{ #category : #testing }
PP2InsertCharacter >> changeBetween: lowIndex and: highIndex [
	^ (position >= lowIndex) and: [ position <= (highIndex + 1) ]
]

{ #category : #'private - updates' }
PP2InsertCharacter >> updateBuffer: buffer [
	| newBuffer |
	newBuffer := IdentityDictionary new.

	buffer associationsDo: [ :assoc |
		| key lowIndex highIndex memento contextMemento |
		"for some reason, key has indexing from zero"
		memento := assoc value.
		key := assoc key.
		lowIndex := (assoc key + 1).
		highIndex := assoc value furthestPosition.
		contextMemento := assoc value contextMemento.

		(self changeAfterRange: highIndex) ifTrue: [ newBuffer at: key put: memento ].
		(self changeBetween: lowIndex and: highIndex) ifTrue: [ 
			newBuffer at: key put: (PP2MementoPromise new
				contextMemento: contextMemento + 1;
				furthestPosition: highIndex +1;
				position: key;
				buffer: newBuffer;
				yourself)
		].
		(self changeBeforeRange: lowIndex) ifTrue: [ 
			memento contextMemento: contextMemento + 1.
			newBuffer at: (key + 1) put: memento 
		].

	].

	^ newBuffer
]

{ #category : #'private - updates' }
PP2InsertCharacter >> updateToken: token [
	(self changeBeforeRange: token start) ifTrue: [ 
		token start: token start + 1.
		token stop: token stop + 1.
		token collection: input
	]
]
