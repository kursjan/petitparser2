converting
asEventsMorph
	invocationEntry isNil ifTrue: [ ^ Morph new ].
	
	^ (self findContext eventsTrace)
		selection: invocationEntry;
		eventsMorph