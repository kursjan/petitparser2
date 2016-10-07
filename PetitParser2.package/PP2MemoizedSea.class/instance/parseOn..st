parsing
parseOn: context
	| contextMemento returnValue |
	contextMemento := context remember.
	buffer at: contextMemento ifPresent: [:memento |
		context restore: memento contextMemento.
		^ memento returnValue
	].

	returnValue := strategy parseOn: context.

	(context waterPosition == context position) ifFalse: [  
		| result |
		result := PP2Memento new 
			returnValue: returnValue;
			contextMemento: context remember;
			yourself.

		buffer at: contextMemento put: result
	].

	^ returnValue
