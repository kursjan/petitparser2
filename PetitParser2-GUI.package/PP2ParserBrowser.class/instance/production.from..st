private utilities
production: selector from: class
	^ selector isNil 
		ifTrue: [ ^ class newStartingAt: #start ]
		ifFalse: [ class newStartingAt: selector ]