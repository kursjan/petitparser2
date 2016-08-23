python
pythonSourcesComplexity
	^ self cachedValue: #pythonSourcesComplexity ifAbsent: [ 
		self selectEvenly: 100 from: (self pythonSourcesInDirectory: self pythonAllDirectory).
	]