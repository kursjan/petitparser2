reporting
countFor: event
	^ (events select: [ :e | e == event ]) size