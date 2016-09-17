*PetitParser2-Smalltalk
benchmarkSmalltalkParserSmacc
	| time  gcTime |
	self setupSmalltalkParserSmacc.
	
	self repetitions timesRepeat: [ 
		3 timesRepeat: [ Smalltalk garbageCollect ].
	
		gcTime := Smalltalk vm totalGCTime.
		time := [ input do: [ :source | 
			parser parse: source
		] ] timeToRun asMilliseconds.
		
		self reportInput: input time: time gcTime: (Smalltalk vm totalGCTime - gcTime) name: parser name
	]