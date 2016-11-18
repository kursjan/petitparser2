converting
asEventsMorph
	eventsTrace isNil ifTrue: [ ^ Morph new ].
	^ eventsTrace eventsMorph