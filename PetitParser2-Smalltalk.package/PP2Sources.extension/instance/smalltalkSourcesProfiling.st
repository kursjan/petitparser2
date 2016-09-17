*PetitParser2-Smalltalk
smalltalkSourcesProfiling
	^ self cachedValue: #smalltalkSourcesProfiling ifAbsentPut: [ 
		self 
			selectEvenly: 1000 
			fromFiles: 	self smalltalkFiles
	]