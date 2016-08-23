smalltalk
smalltalkSourcesBenchmarking
	^ self cachedValue: #smalltalkSourcesBenchmarking ifAbsent: [ 
		"self smalltalkSourcesInDirectory: self smalltalkSelectedDirectory."
		self 
			selectEvenly: 10000 
			from: 	(self smalltalkSourcesInDirectory: self smalltalkAllDirectory)
	]