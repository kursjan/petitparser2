resolving
resolveFor: parser in: context
	| memento |
	memento := PP2Memento new
		returnValue: (parser parseOn: context);
		contextMemento: context remember;
		yourself.

	(limit isNotNil and: [ memento contextMemento ~= limit ]) ifTrue: [ 
		PP2ReparseException signal: 'reparse consumed more or less characters than expected'
	].
		
	^ buffer at: position put: memento.
	
