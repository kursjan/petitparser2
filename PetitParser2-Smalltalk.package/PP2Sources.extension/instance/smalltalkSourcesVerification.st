*PetitParser2-Smalltalk
smalltalkSourcesVerification
	^ self cachedValue: #smalltalkSourcesVerification ifAbsentPut: [ 
		"self smalltalkSourcesInDirectory: self smalltalkSelectedDirectory."
		self 
			selectEvenly: 5*1000 
			fromFiles: self smalltalkFiles
	]