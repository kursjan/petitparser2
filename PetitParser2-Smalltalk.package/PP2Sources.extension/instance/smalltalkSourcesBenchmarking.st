*PetitParser2-Smalltalk
smalltalkSourcesBenchmarking
	^ self cachedValue: #smalltalkSourcesBenchmarking ifAbsentPut: [ 
		"self smalltalkSourcesInDirectory: self smalltalkSelectedDirectory."
		self 
			selectEvenly: 10000 
			fromFiles: 	self smalltalkFiles
		]