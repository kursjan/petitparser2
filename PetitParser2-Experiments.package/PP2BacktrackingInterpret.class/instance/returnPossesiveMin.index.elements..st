visiting - helpers
returnPossesiveMin: min index: index elements: elements
	^ (min <= index) 
		ifTrue: [ elements copyFrom: 1 to: index ]
		ifFalse: [ PP2Failure message: 'not enough repetitions' ]