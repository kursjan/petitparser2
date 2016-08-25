running
runTimeout: timeout
	| time |

	self repetitions timesRepeat: [ 
		
		input withIndexDo: [ :source :index | 
			time := [[ parser parse: source withContext: self context ]
				valueWithin: timeout
				onTimeout: [ Transcript cr; show: 'timeout'; cr. #TIMEOUT ] ] timeToRunWithoutGC.
			self reportInput: source time: time name: parser name.
		].

	].

	^ report