running
runTimeout: timeout
	| time gcTime |
	self repetitions timesRepeat: [ 
		3 timesRepeat: [ Smalltalk garbageCollect ].
		gcTime := Smalltalk vm totalGCTime.
		time := [ input do: [ :source | 
			[ parser parse: source withContext: self context ]
				valueWithin: timeout
				onTimeout: [ Transcript show: 'timeout'; cr. #timeout ]
		] ] timeToRun asMilliSeconds.

		self reportInput: input time: time gcTime: (Smalltalk vm totalGCTime - gcTime) name: parser class asString
	]