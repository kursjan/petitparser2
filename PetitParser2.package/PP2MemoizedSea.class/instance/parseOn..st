parsing
parseOn: context
	| contextMemento returnValue |
	contextMemento := self remember: context.
	buffer at: contextMemento ifPresent: [:memento |
		self restore: context from: memento contextMemento.
		^ memento returnValue
	].

	returnValue := strategy parseOn: context.

	(context waterPosition == context position) ifFalse: [  
		| result |
		result := PP2Memento new 
			returnValue: returnValue;
			contextMemento: (self remember: context);
			yourself.

		buffer at: contextMemento put: result
	].

	^ returnValue
