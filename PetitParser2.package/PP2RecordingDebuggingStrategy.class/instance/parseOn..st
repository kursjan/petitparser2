parsing
parseOn: context
	| result entry |
	self node hasName ifTrue: [ context namedInvoked 	] ifFalse: [ context invoked ].
	entry := context eventsTrace last.
	entry start: context eventsTrace entriesCount.
	
	result := super parseOn: context.
	
	entry stop: context eventsTrace entriesCount.
	entry debugResult: context lastDebugResult.

	"JK: I don't like this reference from debugResult to entry..."
	context lastDebugResult invocationEntry: entry.
	
	^ result