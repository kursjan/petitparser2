optimizations
markRecognizer
	((self hasProperty: #recognizer) and: [ (self propertyAt: #recognizer) not ]) ifTrue: [  
		self warnShouldNotBeShared. 
	].

	self propertyAt: #recognizer ifAbsentPut: true