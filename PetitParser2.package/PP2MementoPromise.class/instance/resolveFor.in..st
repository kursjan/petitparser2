resolving
resolveFor: parser in: context
	| memento |
	memento := PP2Memento new
		returnValue: (parser parseOn: context);
		contextMemento: context remember;
		furthestPosition: (context furthestPosition max: context position);
		yourself.

	(contextMemento isNotNil and: [ memento contextMemento ~= contextMemento ]) ifTrue: [ 
		PP2ReparseException signal: 'reparse consumed more or less characters than expected'
	].
		
	^ buffer at: position put: memento.
	
