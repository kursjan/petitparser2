parsing
parseOn: context
	| start result eventsTrace |
	self node hasName ifTrue: [ context event: #namedInvoked 	] ifFalse: [ context event: #invoked ].
	start := context entries size.
	
	result := super parseOn: context.
	
	eventsTrace := PP2EventsTrace new
		entries: context entries;
		startPosition: start;
		stopPosition: context entries size;
		debugResult: context lastDebugResult;
		yourself.
		
	context lastDebugResult eventsTrace: eventsTrace.
	
	^ result