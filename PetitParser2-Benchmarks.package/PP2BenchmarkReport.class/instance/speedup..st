reporting
speedup: stream
	| grouped firstKey first firstName related relatedName |
	grouped := (self groupBy: #name).
	firstKey := grouped orderedKeys first.
	first := (self fiveNumberSummary: (self timesFrom: (grouped at: firstKey))) first.
	firstName := (grouped at: firstKey) anyOne name. 
	
	grouped orderedKeys allButFirstDo: [ :key | 
		key isNil ifFalse: [ 
			related := (self fiveNumberSummary: (self timesFrom: (grouped at: key))) first.
			relatedName := (grouped at: key) anyOne name.
		
			stream nextPutAll: firstName, ' vs ', relatedName, ' speedup: ', ((first / related) asFloat printShowingDecimalPlaces: 3).
			stream nextPutAll: String lf.
		]
	].
	stream flush.