private - updates
updateBuffer: buffer
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