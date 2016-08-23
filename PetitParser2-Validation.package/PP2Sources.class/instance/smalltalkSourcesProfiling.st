smalltalk
smalltalkSourcesProfiling
	^ self cachedValue: #smalltalkSourcesProfiling ifAbsent: [ 
		self 
			selectEvenly: 1000 
			from: 	(self smalltalkSourcesInDirectory: self smalltalkAllDirectory)
	]