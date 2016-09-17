*PetitParser2-Smalltalk
benchmarkRBParser
	| time  |
	self setupRBParser.
	
	self repetitions timesRepeat: [ 
		time := [ input do: [ :source | 
			
			parser initializeParserWith: source.
			parser parseMethod: source
			
		] ] timeToRunWithoutGC "timeToRun asMilliseconds.".
		
		self reportInput: input time: time name: parser name
	]