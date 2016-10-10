private - updates
updateBuffer: buffer
	| newBuffer |
	newBuffer := IdentityDictionary new.
	
	buffer associationsDo: [ :assoc |
		| key memento |
		key := assoc key.
		memento := assoc value.
		
		(self indexBefore: memento contextMemento) ifTrue: [ newBuffer at: key put: memento ].
		(self indexAfter: key) ifTrue: [ 
			memento contextMemento: memento contextMemento + 1.
			newBuffer at: key + 1 put: memento 
		].
		(self indexBetween: key and: memento contextMemento) ifTrue: [ 
			newBuffer at: key put: (PP2MementoPromise new
				limit: memento contextMemento + 1;
				buffer: newBuffer;
				yourself)
		]
	].

	^ newBuffer