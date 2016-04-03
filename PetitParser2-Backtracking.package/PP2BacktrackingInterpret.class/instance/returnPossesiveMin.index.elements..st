visiting - helpers
returnPossesiveMin: min index: index elements: elements
	^ (min <= index) 
		ifTrue: [ currentContext success: (elements copyFrom: 1 to: index) asArray ]
		ifFalse: [ currentContext failure: 'not enough repetitions' ]