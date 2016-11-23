parsing
parseOn: context
	| result entry lastDebugResult |
	self node hasName ifTrue: [ context namedInvoked 	] ifFalse: [ context invoked ].
	entry := context eventsTrace last.
	entry start: context eventsTrace entriesCount.
	
	result := strategy parseOn: context.
	
	entry stop: context eventsTrace entriesCount.

	(lastDebugResult := context lastDebugResult) isNil ifFalse: [ 
		entry debugResult: lastDebugResult.
		lastDebugResult invocationEntry: entry.
	].
	^ result