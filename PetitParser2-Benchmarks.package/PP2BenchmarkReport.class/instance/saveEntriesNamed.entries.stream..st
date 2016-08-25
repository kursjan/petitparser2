reporting
saveEntriesNamed: name entries: subentries stream: stream
	| size  timeSummary timeWithoutGCSummary gcSummary |

	size := (self sizesFrom: subentries) anyOne.
	timeSummary := self fiveNumberSummary: (self withoutMax: (self timesFrom: subentries)).
	timeWithoutGCSummary := self fiveNumberSummary: (self withoutMax: (self timesWithoutGCFrom: subentries)).
	gcSummary := self fiveNumberSummary: (self withoutMax: (self gcTimesFrom: subentries)).	
	
	stream
			nextPutAll: name;
			"With GC"
			nextPut: Character tab;
			nextPutAll: 'with gc'.
	self printFiveNumberSummary: (timeSummary collect: [ :e | e / size * 1000 ]) on: stream.
	stream
			"Without GC"
			nextPut: Character tab;
			nextPutAll: 'without gc'.
	self printFiveNumberSummary: (timeWithoutGCSummary collect: [ :e | e / size * 1000 ]) on: stream.
	stream
			"GC TIMES"
			nextPut: Character tab;
			nextPutAll: 'gc'.
	self printFiveNumberSummary: (gcSummary collect: [ :e | e / size * 1000 ]) on: stream.
	stream
			nextPutAll: String lf;
			flush.