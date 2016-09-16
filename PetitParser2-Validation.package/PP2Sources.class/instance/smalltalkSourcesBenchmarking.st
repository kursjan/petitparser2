smalltalk
smalltalkSourcesBenchmarking
	^ self cachedValue: #smalltalkSourcesBenchmarking ifAbsentPut: [ 
		"self smalltalkSourcesInDirectory: self smalltalkSelectedDirectory."
		self 
			selectEvenly: 10000 
			from: 	(self smalltalkSourcesInDirectory: self smalltalkAllDirectory)
	]