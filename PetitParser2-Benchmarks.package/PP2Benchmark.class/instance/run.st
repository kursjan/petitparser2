running
run
	| time gcTime |
	self repetitions timesRepeat: [ 
		3 timesRepeat: [ Smalltalk garbageCollect ].
		gcTime := Smalltalk vm totalGCTime.
		time := [ input do: [ :source | 
			"parser parse: source withContext: self context"
			parser perform: selector withArguments: {  source . self context }.
		] ] timeToRun asMilliseconds.
		
		self reportInput: input time: time gcTime: (Smalltalk vm totalGCTime - gcTime) name: parser name
	]