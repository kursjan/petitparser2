smalltalk
smalltalkSourcesProfiling
	^ self cachedValue: #smalltalkSourcesProfiling ifAbsentPut: [ 
		self 
			selectEvenly: 1000 
			from: 	(self smalltalkSourcesInDirectory: self smalltalkAllDirectory)
	]