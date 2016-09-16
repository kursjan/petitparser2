python
pythonSourcesComplexity
	^ self cachedValue: #pythonSourcesComplexity ifAbsentPut: [ 
		self selectEvenly: 100 from: (self pythonSourcesInDirectory: self pythonAllDirectory).
	]