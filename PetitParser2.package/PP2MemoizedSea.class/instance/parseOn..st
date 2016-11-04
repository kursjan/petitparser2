parsing
parseOn: context
	| contextMemento returnValue |
	self invocation.
	contextMemento := self remember: context.
	buffer at: contextMemento ifPresent: [:memento |
		self cacheHit: context.
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
