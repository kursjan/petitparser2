smalltalk
smalltalkSourcesVerification
	^ self cachedValue: #smalltalkSourcesVerification ifAbsent: [ 
		"self smalltalkSourcesInDirectory: self smalltalkSelectedDirectory."
		self 
			selectEvenly: 5*1000 
			from: 	(self smalltalkSourcesInDirectory: self smalltalkAllDirectory)
	]