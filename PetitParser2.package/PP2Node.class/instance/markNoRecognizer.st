optimizations
markNoRecognizer
	((self hasProperty: #recognizer) and: [ self propertyAt: #recognizer ]) ifTrue: [  
		self warnShouldNotBeShared. 
	].
	self propertyAt: #recognizer put: false