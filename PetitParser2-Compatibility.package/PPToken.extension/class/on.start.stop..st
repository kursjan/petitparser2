*PetitParser2-Compatibility
on: aSequenceableCollection start: aStartInteger stop: aStopInteger
	^ self basicNew 
		initializeOn: aSequenceableCollection
		start: aStartInteger stop: aStopInteger
		value: (aSequenceableCollection copyFrom: aStartInteger to: aStopInteger)